# Terpedia features & subdomains

Planned features and the subdomains (or paths) where they will live. Update as decisions are made.

**Domain:** terpedia.com (DNS in Terpedia AWS). **Hosting:** Migrating to AWS for app and API. See [migrating-to-aws.md](migrating-to-aws.md), [move-terpedia-domain-to-terpedia-aws.md](move-terpedia-domain-to-terpedia-aws.md), and [deploy-route53.md](deploy-route53.md).

---

## Subdomains (planned)

| Subdomain | Purpose | Status |
|-----------|---------|--------|
| **next.terpedia.com** | Prototype / next-gen static site (GitHub Pages) | In use |
| **www.terpedia.com** / **terpedia.com** | Main marketing or app entry (AWS) | TBD |
| **app.terpedia.com** | Full app on AWS (feed, Tersonae, Encyclopedia, Rx, Patient records, etc.) | Planned |
| **api.terpedia.com** | Public API on AWS (strains, terpenes, products, optional B2B) | Planned |
| **podcasts.terpedia.com** | Podcast show notes / episode pages (or path under main) | TBD |
| *(others)* | Add rows as needed | — |

---

## Features by subdomain (draft)

### next.terpedia.com (current)

- Static prototype: landing, /features, about.
- GitHub Pages deploy; CNAME next → terpedia.github.io.
- No backend; content from repo.

### app.terpedia.com (planned)

Features from [FEATURES.md](../FEATURES.md) that require an app + backend:

- **Activity Feed** — Primary experience; feed-first layout.
- **Tersonae** — Entity feeds (subscribe to RSS), follow, chat with each Tersona.
- **User Tersona** — Preferences, recommendations, personalized feed.
- **Post / comment / review** — UGC; moderation.
- **Encyclopedia** — Terpenes, strains, glossary; supports feed.
- **Terports** — Short reports; support feed.
- **Terproduct Database** — Products; search, filters; support feed.
- **Rx (Recipes)** — Formulations (volume/mass); fork and iterate.
- **Podcasts** — Episode pages, show notes, cross-links (or on podcasts.terpedia.com).
- **Patient records** — Stored in cookies/localStorage on device; optional sync.

### api.terpedia.com (planned)

- Read API for strains, terpenes, products (and optionally recipes, Terports).
- Auth/keys for B2B or rate-limited access.
- CORS and docs (e.g. OpenAPI).

### Paths vs subdomains

- **Paths on one domain** (e.g. terpedia.com/feed, terpedia.com/encyclopedia) — Single origin; simpler cookies/auth.
- **Subdomains** (app., api., podcasts.) — Clear separation; can deploy independently; need to decide auth/cookie scope (e.g. *.terpedia.com).

---

## DNS / Route 53 (Terpedia AWS)

| Record | Type | Target | Notes |
|--------|------|--------|-------|
| **next** | CNAME | terpedia.github.io | GitHub Pages prototype |
| **www** | CNAME or A/ALIAS | CloudFront or ALB | Main site (AWS) when deployed |
| **app** | CNAME or A/ALIAS | CloudFront or ALB | App host (AWS) when deployed |
| **api** | CNAME or A/ALIAS | API Gateway or ALB | API host (AWS) when deployed |
| **podcasts** | CNAME or A/ALIAS | TBD | If separate subdomain |

---

## Open decisions

- [ ] www.terpedia.com vs terpedia.com (apex) as primary entry.
- [ ] App host: **AWS** (CloudFront + S3, or Amplify, or ECS). See [migrating-to-aws.md](migrating-to-aws.md).
- [ ] API: separate AWS service (API Gateway + Lambda) or same app with /api routes.
- [ ] Podcasts: subdomain vs terpedia.com/podcasts.
- [ ] Cookie domain for auth/patient data: .terpedia.com vs per-subdomain.

---

*Living document — update as features and subdomains are defined. See [FEATURES.md](../FEATURES.md) for full feature list and [PLAN.md](../PLAN.md) for launch phases.*
