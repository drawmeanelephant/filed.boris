# 🏢 Filed & Forgotten Archive (running on Boris)

Welcome to the **Filed & Forgotten** central knowledge registry, fully migrated from Astro/Starlight and compiled as a blazing-fast, zero-runtime static site using the **Boris** static site compiler.

This repository contains the complete clean, parented document collection of 566 entities, procedural poems, system logs, and mascot files, paired with high-fidelity, responsive layouts.

---

## 📂 Repository Structure

```text
filed.boris/
├── content/              # 566 Clean parented Markdown documents
│   ├── changelog/        # Historical restoration timelines
│   ├── guides/           # System operation playbooks
│   ├── lorelog/          # Chronological system failure logs
│   ├── mascots/          # Compliance characters and identity files
│   ├── posts/            # Procedural findings and bulletins
│   ├── reference/        # Flat reference dossiers (audits, empathy charts, etc.)
│   ├── releases/         # Official software release logs
│   └── index.md          # Central portal entrypoint
├── themes/               # Theme layouts and stylesheets
│   ├── corp-vendor/      # Corporate Software Documentation theme (Classic MSDN Style)
│   ├── google-material/  # Modern Material Design 3 theme
│   └── cozy-typepad/     # Cozy, vintage developer personal blog theme
└── bin/
    └── boris             # Boris static compiler CLI (macOS binary)
```

---

## ⚡ Setup & Compilation

### 1. Run Graph Integrity Check
Boris enforces a strict mathematical content structure. Validate that there are no broken links, incorrect parent pointers, or invalid frontmatter structures before deploying:
```bash
./bin/boris check --input content
```

### 2. Compile the Site
Choose your preferred thematic layout and compile all pages instantly to a static distribution bundle.

#### Option A: Corporate Software Vendor (Recommended)
This theme is modeled after classic MSDN, Oracle, SAP, and IBM technical portals. It features deep-tech blue accents, global classified warning banners, zebra-striped tables, status/SLA metadata badges, and a **pure-CSS accordion sidebar navigation** using the advanced `:has()` selector.
```bash
./bin/boris --input content --theme themes/corp-vendor --html-dir dist/corp -j 8
```

#### Option B: Google Material 3
A clean, modern, and beautiful layout integrating responsive grid structures, card-based designs, and Material 3 design tokens.
```bash
./bin/boris --input content --theme themes/google-material --html-dir dist/material -j 8
```

#### Option C: Cozy Typepad
A delightful retro developer blog theme with minimalist, typography-focused personal columns.
```bash
./bin/boris --input content --theme themes/cozy-typepad --html-dir dist/cozy -j 8
```

---

## 📐 Boris Content Graph Rules

If you add new content records, ensure they conform to Boris's compiler specifications:

1. **Two-Level Hierarchy**:
   * **Trunk Pages**: Root nodes representing parent directories (e.g. `reference/index.md` has `id: reference`). They must not define a `parent`.
   * **Satellite Pages**: Document records that map to a parent trunk (e.g. `reference/file.md` has `id: reference/file` and `parent: reference`).
   * *Multi-hop parent chains (Satellite-of-Satellite) will trigger an `EPARENTNOTTRUNK` compilation failure.*

2. **Permitted Frontmatter**:
   To prevent unvalidated properties from polluting search graphs, Boris only whitelists the following 5 frontmatter keys:
   * `id`
   * `parent`
   * `title`
   * `tags`
   * `status` (Must be strictly one of: `draft`, `published`, or `archived`)
   
   *Any other frontmatter key will trigger an `EFRONTMATTER` compiler failure. Strip custom parameters and prepend them as bold markdown lines to the page body instead.*

3. **Setext Heading Preventative Parse**:
   Do not use hyphens (`---`) for horizontal rules inside the document bodies, as the markdown parser may interpret preceding paragraphs as Setext-style headings. Always use triple-asterisks (`***`) for thematic breaks instead.
