# Terpedia.com — Comprehensive Launch Plan

A phased plan to get terpedia.com up and running with the full feature set (Encyclopedia, Terports, Terproduct Database, Rx (Recipes), Tersona, Podcasts, Activity Feed). Adjust timelines and scope to fit team and resources.

---

## 1. Current State

| Item | Status |
|------|--------|
| **Brand / domain** | terpedia.com exists; positioning as “Terpene Knowledge Hub” and Apothyx (Monument, CO). |
| **Existing product** | Live site with strain/terpene data, TerpeneQueen; 24k+ strains, 170k+ terpenes referenced. |
| **TerpediaNext** | Static prototype on GitHub Pages ([Terpedia/terpedia-next](https://github.com/Terpedia/terpedia-next)); landing page + FEATURES.md. |
| **Hosting** | Prototype: GitHub Pages. Production terpedia.com: confirm (e.g. SiteGround, Vercel, or other). |

**Assumption:** Plan can either (a) evolve the current terpedia.com stack, or (b) build a new front-end/back-end and eventually point terpedia.com at it. Decisions in Phase 0 will lock this.

---

## 2. Goals & Success Criteria

- **Launch:** terpedia.com is the primary, reliable home for the Terpedia product.
- **Feed-first, Facebook-like UX** — Activity feed is the primary experience; home/default is the main feed, not a static landing or encyclopedia-first entry.
- **Tersonae subscribe to RSS** — Entity Tersonae (e.g. Myrcene, Limonene) subscribe to external RSS (e.g. PubMed, Google News) for themselves and surface that content in their feed; they are not RSS feeds that users subscribe to. Users follow Tersonae on-site; users post, comment, and review; UGC and moderation are core.
- **Core value:** Users can discover and learn about terpenes and strains (Encyclopedia + Terports) and, over time, products (Terproduct), preferences (Tersona), and updates (Activity Feed).
- **Quality:** Content is accurate, referenced where appropriate, and compliant with your target jurisdictions.
- **Sustainable:** Stack, content workflow, and hosting are maintainable and cost-effective.

---

## 3. Phase Overview

| Phase | Focus | Outcome |
|-------|--------|---------|
| **0. Discovery & decisions** | Stack, data, domain, team | Written decisions; backlog ordered. |
| **1. Feed-first shell + Tersona** | Main feed UI, nav, at least one Tersona type (e.g. terpene) that subscribes to RSS (e.g. PubMed, Google News) and has on-site feed view + follow | Home is the feed; one or more entity Tersonae subscribe to RSS and surface a feed. |
| **2. Foundation** | Domain, hosting, content model, first content | terpedia.com points at new/updated site; core pages work. |
| **3. Encyclopedia MVP** | Browse/search terpenes & strains; “See full profile” from feed cards | Public Encyclopedia usable; supports the feed. |
| **4. Terports** | Short reports + share/print | Terports live and linked from feed/Encyclopedia. |
| **5. Terproduct & Activity Feed** | Product DB + feed of new/updated content | Products searchable; feed shows editorial + product updates. |
| **6. Rx (Recipes)** | Formulations: compounds/essential oils with volume or mass; fork and iterate | Recipes searchable; fork/derived-from; link to Encyclopedia/Terproduct; surface in feed. |
| **7. Social layer** | Auth, post/comment/review, moderation | Users can post, comment, review; moderation queue and policy. |
| **8. Tersona** | Entity feeds + RSS + user follow + chat with each Tersona; user preference profile; optional PubMed/Google News monitoring | Tersonae feeds, follow, and chat; user Tersona for recommendations and personalized feed. |
| **9. Podcasts** | Audio + show notes + cross-links | Podcast section live and linked from site/feed. |
| **10. Polish & scale** | Performance, SEO, moderation, B2B/API if needed | Production-ready, measurable, extensible. |

---

## 4. Phase 0 — Discovery & Decisions (2–4 weeks)

**Goal:** Make explicit decisions so the rest of the plan is executable.

### 4.1 Technical direction

- **Feed-first + UGC favor a dynamic stack** — Activity feed as primary experience, real-time-ish updates, and user posts/comments/reviews require an app with API and database (or CMS with auth and feeds). Static-only (e.g. GitHub Pages with no backend) is insufficient for the full vision; Phase 0 should confirm stack choice.

- **Option A — Evolve current stack**  
  If terpedia.com runs WordPress (e.g. on SiteGround): enhance with custom themes, plugins, and possibly a headless front-end for specific sections. Reuse existing DB and content.

- **Option B — New app + headless CMS or API**  
  Build a modern front-end (e.g. Next.js, Astro) on Vercel/Netlify; use a CMS (Strapi, Sanity, Contentful) or existing API for terpenes/strains/products. Best if you want full control over UX and plan heavy personalization (Tersona, Feed).

- **Option C — Hybrid**  
  Keep marketing/static on current host; run app subdomain or paths (e.g. app.terpedia.com or terpedia.com/feed) for feed, Encyclopedia, Terports, Terproduct, Tersona.

**Deliverable:** One-page “Tech stack & hosting” doc: front-end, back-end/CMS/API, hosting, CI/CD.

### 4.2 Data & content

- **Terpenes & strains:** Source of truth (current DB, API, CSV, manual). Plan for sync/import and updates.
- **Terports:** Who writes them; workflow (draft → review → publish); where they live (CMS, DB, markdown in repo).
- **Products (Terproduct):** Initial dataset (manual, partner feeds, scrape with legal review); ongoing who adds/edits and moderation.
- **Podcasts:** Hosting (e.g. Buzzsprout, Transistor); where metadata and show notes live (CMS vs static).
- **Patient records:** Stored on the user's device only (cookies or localStorage); no server persistence by default. Define record schema (notes, conditions, goals, products/strains used); export/delete supported.

**Deliverable:** “Data & content sources” doc + content ownership matrix (who owns Encyclopedia vs Terports vs Products vs Podcasts).

### 4.3 Domain & DNS

- Confirm terpedia.com registrar and DNS.
- Decide: single domain (terpedia.com) vs subdomains (app.terpedia.com, podcast.terpedia.com).
- Plan for HTTPS, optional CDN, and (if applicable) migration from current host to new stack without downtime.

**Deliverable:** Domain/DNS checklist and cutover steps.

### 4.4 Team & roles

- **Product / PM** — Prioritization, phases, acceptance criteria.
- **Design** — UI/UX for Encyclopedia, Terports, Terproduct, Tersona, Feed, Podcasts.
- **Engineering** — Front-end, back-end/CMS, search, auth (for Tersona), feeds.
- **Content** — Terports, glossary, product entries, podcast show notes.
- **Compliance / legal** — Claims, jurisdictions, age gates if required.

**Deliverable:** RACI or simple role map and a “who decides what” for scope changes.

### 4.5 Risk register (starter)

| Risk | Mitigation |
|------|------------|
| Existing data not available or locked in old system | Export/API audit in Phase 0; plan ETL or manual seed. |
| Scope creep (too many features at launch) | Strict MVP per phase; backlog for “post-launch.” |
| Compliance (claims, regions) | Legal/compliance review before publishing; clear disclaimers. |
| No clear content owner | Assign owners in Phase 0; start with a small, defined content set. |
| **Moderation burden** (UGC: posts, comments, reviews) | Clear policy; reporting UX; human review queue at launch; consider automated filters later. |
| **RSS scalability** (per-Tersona feeds, external PubMed/Google News ingestion) | Design feed pipeline and cache; rate-limit external fetches; start with terpenes-only for Tersonae. |
| **Content tagging consistency** (post/entity → terpene(s), strain(s)) | Clear schema and UI for tagging; validate on publish so Tersona feeds stay accurate. |

---

## 5. Phase 1 — Feed-first shell + Tersona (3–5 weeks)

**Goal:** Home is the activity feed; at least one entity Tersona (e.g. terpene) subscribes to RSS and surfaces an on-site feed; users can follow Tersonae.

- **Main feed UI:** Single main column (feed) as home/default; Facebook-like card layout; optional side column (“Tersonae you follow,” “Trending”). Nav: Feed first, then Tersonae, Explore, Profile, Podcasts.
- **Tersona type (terpenes):** At least one Tersona type (e.g. terpene) with per-entity feed: each subscribes to external RSS using the entity name as the query (e.g. Myrcene Tersona subscribes to “myrcene” in PubMed and “myrcene” in Google News). Ingested items + editorial/UGC tagged to that entity surface in its feed.
- **On-site Tersona page:** e.g. “Myrcene” page = header (name, blurb, follow button) + feed of items (from RSS subscriptions and tagging) in card layout. Optional: “Chat with [Tersona]” entry point.
- **Follow Tersonae:** Logged-in users can follow Tersonae; “My feed” can merge followed Tersonae (or show “all” / “trending”). Feed pipeline and cache for RSS ingestion.

**Exit criteria:** Home is the feed; one or more Tersonae (e.g. Myrcene) subscribe to RSS and surface a feed; follow works; feed-first IA in place.

---

## 6. Phase 2 — Foundation (3–6 weeks)

**Goal:** terpedia.com points at the chosen stack; core navigation and a few real pages work.

- **Hosting & DNS:** Provision environment (e.g. Vercel project or SiteGround); point terpedia.com (and optional www) to it; SSL.
- **Repo & CI/CD:** Main app repo (or continue Terpedia/terpedia-next); branch strategy; deploy on push to main (or release branch).
- **Design system:** Typography, colors, components (header, footer, cards, search) aligned with current prototype/brand.
- **Core pages:** Home = feed (from Phase 1); main nav (Encyclopedia, Terports, Terproduct, Rx (Recipes), Tersona, Podcasts, Feed). Use placeholder or “Coming soon” where not built yet.
- **Content model:** Define and implement minimal schema for terpenes and strains (and optionally products) so Phase 3 can plug in real data.
- **First content:** Publish a small set of terpenes and strains (e.g. 20–50) to validate pipeline and UI.

**Exit criteria:** Visiting terpedia.com shows the new experience; at least one real list/detail flow (e.g. “Terpenes” list + one terpene page) works.

---

## 7. Phase 3 — Encyclopedia MVP (4–8 weeks)

**Goal:** Public Encyclopedia for terpenes and strains is usable and accurate.

- **Terpene library:** List view (search, filters); detail page (name, structure, properties, occurrence, references).
- **Strain profiles:** List view (search, filters); detail page (name, terpene profile, effects, aroma, genetics, links to terpenes).
- **Cross-linking:** Strain ↔ terpene links; optional ingredient/essential-oil stub pages.
- **Glossary / definitions:** Dedicated page or inline tooltips (e.g. terpenome, entourage effect); link from strain/terpene pages.
- **References:** Field and display for citations; optional “Sources” section per entity.
- **SEO:** Meta tags, structured data (e.g. FAQ, Article), sitemap, internal links.
- **Performance:** Fast loads; consider static generation for most encyclopedia pages.

**Exit criteria:** Users can search/browse terpenes and strains and open detailed, cross-linked profiles; glossary is findable. “See full profile” from feed cards links to Encyclopedia.

---

## 8. Phase 4 — Terports (3–5 weeks)

**Goal:** Short, shareable reports (Strain Terports, Terpene Terports, later category/product).

- **Content model:** Terport = title, type (strain / terpene / category / product), body/fields, related entities, “last updated.”
- **Authoring:** CMS or markdown + build; simple workflow (draft → publish).
- **Templates:** Strain Terport (top terpenes, effects, aroma, use cases); Terpene Terport (chemistry, sources, effects, safety).
- **Sharing:** Canonical URL; optional “Share” button; PDF export (template or tool e.g. Puppeteer, or export service).
- **Discovery:** Terports linked from strain/terpene detail pages; “Terports” section with list/filter.
- **Versioning:** “Last updated” date; optional history (e.g. “v1.1”) if needed for compliance.

**Exit criteria:** At least one Strain Terport and one Terpene Terport live; shareable link and optional PDF work.

---

## 9. Phase 5 — Terproduct Database & Activity Feed (4–8 weeks)

**Goal:** Products are searchable; a simple Activity Feed shows new/updated content.

### 9.1 Terproduct Database

- **Schema:** Product (name, brand, category, terpene callouts, ingredients, COA link, region, compliance notes).
- **CRUD:** Add/edit/delete (admin or CMS); optional “suggest a product” form with moderation queue.
- **Search & filters:** By terpene(s), brand, category, region.
- **Strain/product links:** Many-to-many strain ↔ product where relevant.
- **Regulatory:** Fields and display for jurisdiction/claims; review before launch in new regions.

### 9.2 Activity Feed

- **Data source:** Events from Encyclopedia (new/updated terpenes, strains), Terports, Terproduct (new/updated products). Store “activity” records (type, entity id, title, date, optional image).
- **Public feed:** Chronological or “featured” stream on homepage or /feed; filters by type (strains, terpenes, products, Terports).
- **UI:** Cards with link to entity; “Terp of the week” or curated slot if desired.
- **Personalization:** Deferred to Phase 7 (Tersona); keep feed logic ready for “filter by user prefs” later.

**Exit criteria:** Product list/detail and search work; Activity Feed shows recent content and is linked from nav/home.

---

## 10. Phase 6 — Rx (Recipes) (3–5 weeks)

**Goal:** Recipes (formulations) are lists of compounds and/or essential oils with volume or mass; users can fork and iterate on recipes.

- **Recipe model:** Recipe = name, optional description, category (e.g. topical, beverage, aroma blend), list of ingredients. Each ingredient = compound or essential oil (link to Encyclopedia/Terproduct) + **volume or mass** (e.g. 2 ml, 0.5 g). Optional instructions. Units: support ml, L, g, mg, etc.; optional “scale to total” (e.g. 100 ml).
- **CRUD:** Create, edit, delete own recipes; list/detail views; search and filter by ingredient, author, category.
- **Fork and iterate:** “Fork” creates a copy of a recipe that the user can edit; forked recipe links back to source (“Forked from [original]”). Optional: version history or derived-from graph so recipes evolve in a tree. Attribution: author and source recipe credited.
- **Feed and Tersonae:** New/updated recipes surface in activity feed; recipes can be tagged to Tersonae (e.g. by dominant terpene). Link from feed cards to recipe detail.
- **Discovery:** Rx/Recipes in nav; list and detail pages; optional licensing (e.g. share-alike) for forked recipes.

**Exit criteria:** Users can create and edit recipes (ingredients + volume/mass); fork an existing recipe and iterate; recipes discoverable and linked from feed.

---

## 11. Phase 7 — Social layer (4–6 weeks)

**Goal:** Users can post to the feed, comment on posts/entities, and review strains/products; moderation in place.

- **Auth:** Required for post/comment/review; optional for follow. Email or OAuth; optional account.
- **Post to feed:** Create post (text, optional links/images, optional tag to terpene(s)/strain(s)/product(s)); posts appear in main feed and in tagged Tersonae feeds.
- **Comment:** Comments on posts and/or on entities (strains, products, Terports); threaded or flat; reporting.
- **Review:** Structured reviews (e.g. star rating + text) for strains and/or products; appear as feed items and on entity pages; tag to Tersonae.
- **Moderation:** Policy, reporting UX, review queue (approve/remove, block user); human-only MVP with simple queue; consider automated filters later.
- **Data model:** Posts, comments, reviews as first-class entities; link to user and to terpene/strain/product for Tersona feeds.

**Exit criteria:** Authenticated users can post, comment, and review; moderation queue and policy live.

---

## 12. Phase 8 — Tersona (4–6 weeks)

**Goal:** Users can create a terpene “persona” and get recommendations; feed can be personalized.

- **Data model:** Preferences (effects, flavors, use cases, avoidances); optional account (email or OAuth).
- **Onboarding:** Short flow to capture preferences; store against anonymous id or account.
- **Recommendations:** Logic that maps preferences to strains/terpenes/products (rules or simple scoring); “For you” or “Recommended” section.
- **Activity Feed:** When user has Tersona, filter or rank feed by preferences.
- **Privacy:** Clear policy; optional account; export/delete; no unnecessary data collection.
- **Integration:** Tersona surfaces on homepage, nav, and key discovery pages.
- **Tersona monitoring external RSS:** Each entity Tersona subscribes to PubMed and Google News using the entity name as the query. For example, the Myrcene Tersona subscribes to “myrcene” in PubMed and “myrcene” in Google News. Ingested items surface in that Tersona’s feed and main feed with attribution; requires feed-ingestion pipeline and per-Tersona query config (query = entity name, e.g. myrcene, limonene).

- **Chat with each Tersona:** Users can open a chat with any entity Tersona (e.g. Myrcene). Conversation is contextual to that terpene: answers questions, summarizes its feed, points to Encyclopedia and recent PubMed/News items, suggests strains or recipes. AI-backed (e.g. TerpeneQueen) with per-Tersona context. Chat entry on each Tersona page.

**Exit criteria:** User can set preferences and see recommendations; signed-in user (if implemented) sees personalized feed; entity Tersonae optionally include PubMed/Google News–sourced items; users can chat with each Tersona (contextual, AI-backed).

---

## 13. Phase 9 — Podcasts (3–4 weeks)

**Goal:** Podcast section live with show notes and cross-links.

- **Hosting:** Choose provider (Buzzsprout, Transistor, etc.); RSS and distribution to Apple, Spotify, etc.
- **Metadata:** Episodes in CMS or config (title, description, date, audio URL, image).
- **Episode pages:** Per-episode page with show notes, links to strains/terpenes/products/Terports.
- **Transcripts:** Upload or generate; display on episode page; consider SEO.
- **Discovery:** “Podcasts” in nav; list by show/series; link from Activity Feed when new episode drops.
- **Cross-link:** Episode content that mentions entities links to Encyclopedia/Terports.

**Exit criteria:** At least one show with 1–2 episodes; episode pages and RSS work; links to site content from show notes.

---

## 14. Phase 10 — Polish & Scale (ongoing)

**Goal:** Stable, fast, measurable, and ready for growth.

- **Performance:** Core Web Vitals; lazy loading; image optimization; CDN if not already.
- **SEO:** Sitemaps, robots, structured data, internal linking; fix critical issues.
- **Analytics & monitoring:** Events (search, entity views, Terport shares, recommendations); errors and uptime.
- **Moderation (if UGC):** Process for product suggestions, comments, or community content; guidelines and tooling.
- **B2B / API (if in scope):** Documented API for strains/terpenes/products; terms and keys; rate limits.
- **Content growth:** Process to add strains, terpenes, Terports, products, and episodes regularly.

---

## 15. Timeline (High-Level)

| Phase | Duration (est.) | Cumulative |
|-------|------------------|------------|
| 0. Discovery & decisions | 2–4 weeks | 4 weeks |
| 1. Feed-first shell + Tersona | 3–5 weeks | 9 weeks |
| 2. Foundation | 3–6 weeks | 15 weeks |
| 3. Encyclopedia MVP | 4–8 weeks | 23 weeks |
| 4. Terports | 3–5 weeks | 28 weeks |
| 5. Terproduct + Activity Feed | 4–8 weeks | 36 weeks |
| 6. Rx (Recipes) | 3–5 weeks | 41 weeks |
| 7. Social layer | 4–6 weeks | 47 weeks |
| 8. Tersona | 4–6 weeks | 53 weeks |
| 9. Podcasts | 3–4 weeks | 57 weeks |
| 10. Polish & scale | Ongoing | — |

**Rough total to “full launch”:** ~12 months with one small team; can compress with more people or by trimming scope per phase (e.g. smaller Encyclopedia set at first, or Terproduct without UGC).

---

## 15. Dependencies & Ordering

- **Phase 0** must finish before committing to build (stack, data, domain).
- **Phase 1** (Feed-first shell + Tersona) establishes home-as-feed and Tersonae that subscribe to RSS; can start as soon as stack is chosen; feeds Phase 2+.
- **Phase 2** (Foundation) unblocks all later phases (domain, hosting, design system, content model).
- **Phase 3** (Encyclopedia) is the backbone; Terports (4), Activity Feed (5), and Rx (6) depend on it; “See full profile” from feed cards links here.
- **Phase 5** (Terproduct + Feed) can start once product schema and moderation approach are set.
- **Phase 6** (Rx / Recipes) needs Encyclopedia and ideally Terproduct for ingredient links; recipes = compounds/essential oils with volume or mass; fork and iterate.
- **Phase 7** (Social layer) adds post/comment/review and moderation; depends on auth and feed.
- **Phase 8** (Tersona) needs Encyclopedia and ideally Terproduct + Feed so recommendations and personalization have content; entity Tersonae subscribe to RSS (e.g. PubMed, Google News).
- **Phase 9** (Podcasts) can run in parallel with 7–8 if different owner; only needs nav and feed integration.
- **Phase 10** runs in parallel from Phase 3 onward (performance, SEO, analytics) and continues after launch.
- **Patient records** can be implemented as a client-only feature (cookies/localStorage) in parallel or after Foundation; no backend required for MVP; optional sync/backup if user opts in.

---

## 17. Next Steps (Immediate)

1. **Confirm ownership and goals** — Who signs off on Phase 0 decisions (stack, data, domain)? Any hard launch date?
2. **Kick off Phase 0** — Schedule discovery sessions for tech, data, and content; assign owners for each deliverable.
3. **Lock stack and data** — Choose Option A/B/C; document data sources and content owners. Confirm feed-first + UGC implies dynamic stack (app + API + DB).
4. **Prioritize Phase 1 and 3 scope** — Phase 1: which Tersona type first (terpenes only?), which RSS sources (PubMed, Google News). Phase 3: how many terpenes/strains in Encyclopedia at launch? Which fields are must-have vs nice-to-have?
5. **Prototype → production path** — Decide whether Terpedia/terpedia-next becomes the app repo or a reference; set up production repo and CI/CD in Phase 2.

---

*Plan version: 1.0 · Last updated: Feb 2025 · Living document — update as decisions and scope change.*
