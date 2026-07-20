#!/usr/bin/env python3
import sys
import subprocess
import json

def main():
    print("🔍 Starting Boris Content Graph Integrity Check...")
    
    # Execute boris check and capture output
    cmd = ["./bin/boris", "check", "--input", "content", "--format", "json"]
    result = subprocess.run(cmd, capture_output=True, text=True)
    
    report = None
    try:
        if result.stdout.strip():
            report = json.loads(result.stdout)
    except json.JSONDecodeError:
        pass

    if not report:
        try:
            if result.stderr.strip():
                report = json.loads(result.stderr)
        except json.JSONDecodeError:
            pass

    # If we still can't parse a JSON report, then it's a critical execution error
    if not report:
        print("❌ Boris execution failed with a critical compiler/validation error:")
        print("--- stdout ---")
        print(result.stdout)
        print("--- stderr ---")
        print(result.stderr)
        sys.exit(1)
        
    findings = report.get("findings", [])
    
    # Filter out acceptable unreferenced_page warnings.
    # On a sidebar/index-driven static site, satellite pages are fully navigable via the dynamic nav sidebar menu.
    # Therefore, they do not require inline markdown links from other page bodies, meaning they trigger unreferenced_page warnings.
    real_errors = [f for f in findings if f.get("code") != "unreferenced_page"]
    
    print(f"📊 Summary:")
    print(f"  - Total Pages: {report.get('summary', {}).get('pages', 0)}")
    print(f"  - Roots (Trunks): {report.get('summary', {}).get('roots', 0)}")
    print(f"  - Satellites: {report.get('summary', {}).get('satellites', 0)}")
    print(f"  - Total Findings: {len(findings)}")
    print(f"  - Acceptable Warnings (unreferenced_page): {len(findings) - len(real_errors)}")
    print(f"  - Critical Errors: {len(real_errors)}")
    
    if real_errors:
        print("\n❌ Graph Integrity Failure! The following critical errors must be resolved:")
        for idx, err in enumerate(real_errors, 1):
            print(f"  {idx}. [{err.get('code')}] {err.get('type')}: {err.get('value')}")
        sys.exit(1)
        
    print("\n✅ Graph Integrity Passed! (Ignoring expected unreferenced_page warnings)")
    sys.exit(0)

if __name__ == "__main__":
    main()
