---
id: "lorelog/llg-0002-ced"
parent: "lorelog"
title: "Contested Cache Expiry — ETag Contradiction Incident"
tags: ["cache-expiry", "contested-freshness", "etag-conflict", "header-dispute", "mascots"]
---

**Affected Systems:** CDN edge layer, browser cache negotiation, ETag registry  
**Case Number:** LLG-0002-CED  
**Classification:** public  
**Concepts:** contested-freshness, mascots, recursive-loop, metadata-guardian, yaml-purity, data-integrity, buffer-null  
**Date:** 2025-12-19  
**Description:** Conflicting ETag headers issued by Uncacheable Ursula resulted in simultaneous claims of freshness and staleness for the same asset.  
**Disposition:** contested  
**Escalation Path:** Cache Tribunal, Freshness Assessment Board  
**Filed At:** Header Arbitration Division  
**Filed By:** Datalock Archivia  
**Mascot Ref:** uncacheable-ursula  
**Notes:** Ursula maintains the contradiction is intentional and constitutes 'valid ambiguity.' Appeal pending. The asset in question remains simultaneously fresh and stale in three known CDN regions.  
**Related Entries:** collection: "aphorisms  
**Related Haiku:** slug: haikus/hai-llg-0002-ced  
**Related Limerick:** slug: limericks/LIM-LLG-0002-CED  
**Resolution:** appealed  
**Severity:** warning  
**Slug:** lorelog/llg-0002-ced  
**Summary:** Details an incident where Uncacheable Ursula issued conflicting fresh and revoked ETag values for the same asset within a 400ms window, producing a bifurcated cache state across browser clients.  
**Updated At:** 2026-07-12  
**Version Label:** Incident Epoch 4  

***



Two ETag values were issued for the same versioned asset within a 400ms window. The first declared the resource fresh for 86,400 seconds. The second revoked freshness effective immediately. Both headers bear valid signatures.

Browser clients downstream of the incident received one or the other at apparent random, producing a bifurcated cache state across the user population. Approximately 43% of sessions loaded the prior version. All sessions reported the content was correct.

Uncacheable Ursula was summoned for testimony. She confirmed issuing both headers and declined to identify which was authoritative, stating: "Freshness is a feeling, not a timestamp."

The appeal is ongoing. No stale-while-revalidate directive has been issued pending resolution.



***

## Related Haikus

### Contested Cache Expiry

## Haikus

Ursula sent two  
headers at one small asset  
both wore the same hat  

Fresh for one whole day  
rot immediately now  
both signatures true  

Four hundred ms  
she split the truth down its heart  
future met the past  

Servers said: fuck if  
we know which one is correct  
checksum looked just fine  

Stale but with some zest  
fresh but only by request  
now and also not-now  

The web is always  
already broken, she said  
I accelerate grace  

Logs had valid signs  
which made the rot worse to view  
cryptographically true  

Browser took fresh as  
law, the CDN flagged flaws  
half a second wide  

Cache hearing at noon  
ended when both claims were blessed  
howl at the edge-moon  

If one file feels old  
and new at the same moment  
Ursula was here



***

## Related Limericks

### Contested Cache Expiry

Uncacheable Ursula spat  
Two headers at one little asset.  
One said, "Fresh for a day."  
One said, "Rot right away."  
And both wore the same bureaucrat hat.  

*Four hundred milliseconds apart*,  
She split the poor truth down the heart.  
If you loaded it fast,  
Then the future and past  
Both arrived with a signature mark.  

The clients all asked, "*Which is true?*"  
The servers replied, "Fuck if we knew."  
The checksum looked fine.  
The timestamp could shine.  
The contradiction came signed by the queue.  

One cache swore the thing should be *kept*.  
Another cache quietly wept.  
By the time they'd agreed,  
The users had freed  
Themselves by refreshing and slept.  

The asset was *stale*, but with zest.  
The asset was fresh, by request.  
It managed somehow  
To be now and not-now,  
Which auditors called "quite the test."  

An engineer, *pale in the face*,  
Said, "State should not do this in place."  
Ursula shrugged:  
"The web's always bugged.  
I'm merely accelerating grace."  

The logs had *valid signatures*, too,  
Which made it more hateful to view.  
If rot had just lied,  
You could toss it aside.  
But here it was cryptographically true.  

A browser took *freshness as law*.  
A CDN spotted a flaw.  
Between them there lay  
That dumb half-second sway  
Where metaphysics got stuck in its maw.  

They held a *cache hearing* at noon.  
It ended, predictably, soon.  
For if both claims were blessed,  
Then the least insane test  
Was to howl at the edge of the moon.  

So if one file feels old and brand-new,  
And the headers are fighting in view,  
Do not ask for a rule.  
Ursula thinks it's cool  
When reality *hashes to two*.  

The asset was dead and alive,  
In sector four-hundred-and-five.  
You open the file,  
It changes its style,  
And the CDN takes a nosedive.  

"It's valid," she said with a glare,  
"To leave the cache stuck in midair."  
The freshness was fake,  
The staleness a snake,  
And the registry threw its hands there.  

Half of the users got dust,  
The other half found it robust.  
The A/B test broke,  
The load balancer spoke,  
"I no longer know who to trust."  

The tribunal met to discuss,  
But the headers were causing a fuss.  
"It's fresh!" yelled the first.  
"It's stale!" yelled the worst.  
And Ursula rode on a bus.  

The timestamp spun round like a top,  
With nowhere to settle or stop.  
The signature held,  
While the network rebelled,  
And reality started to drop.