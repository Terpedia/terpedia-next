# Terpedia.com — Feature List

A working list of product features for [terpedia.com](https://terpedia.com). Refine and prioritize as needed.

**Primary experience:** Activity feed first (Facebook-like). The feed is the main surface; Encyclopedia, Terports, Terproduct, Rx (Recipes), and Podcasts support the feed (linked from feed items, and their updates appear in relevant Tersonae feeds and the main feed).

---

## 1. Activity Feed (primary experience)

**The main surface: a Facebook-like, feed-forward stream of recent and relevant activity.**

- **Primary experience** — Home/default is the main activity feed (chronological or algorithmically ranked), not a static landing or encyclopedia.
- **Facebook-like layout** — Single main column (feed) with optional side column (e.g. “Tersonae you follow,” “Trending”). Feed cards: author/attribution, content snippet, media if any, terpene/strain/product tags, actions (like, comment, share).
- **Mix of editorial + UGC** — Stream combines editorial (new strain profile, Terport, product), system (e.g. “New strain added”), and user-generated content (posts, reviews). Same card-based layout for all.
- **Follow Tersonae to shape feed** — Logged-in users follow entity Tersonae (e.g. Myrcene, Limonene); “My feed” can merge followed Tersonae, or show “all” / “trending.”
- **Content updates** — New or updated strain profiles, terpenes, Terports, products surface in the feed.
- **Curated highlights** — Featured strains, new podcast episodes, “Terp of the week.”
- **Filters** — By type (strains, terpenes, products, podcasts, Terports), date, category.
- **Engagement** — Like/react, share (link or reshare), bookmark/save.
- **Public vs signed-in** — Rich feed for signed-in users; still useful default feed for anonymous visitors.

---

## 2. Tersona

**Two concepts: entity Tersonae (they subscribe to RSS) and user Tersona (preference profile).**

### 2.1 Entity Tersonae (subscribe to RSS)

- **Tersonae subscribe to RSS** — Each Tersona subscribes to external RSS for itself using the entity name as the query. For example, the Myrcene Tersona subscribes to “myrcene” in PubMed and “myrcene” in Google News (PubMed search RSS and Google News topic RSS). Limonene would subscribe to “limonene” in both, and so on. They are not RSS feeds that users subscribe to; they are entities that consume and surface RSS (and other content) into a feed.
- **Tersona = entity feed** — Each terpene (and optionally each strain or category) is a “Tersona” with a canonical feed: items from the RSS sources it subscribes to, plus editorial (new strain profile, Terport, product), system (e.g. “New strain added: X”), and UGC (user post or review tagged to that terpene/strain). Clear tagging: post/entity → terpene(s), strain(s).
- **On-site feed UI** — “Myrcene” page = that Tersona’s feed in Facebook-like card layout; header with name, short blurb, follow button. Ingested items (e.g. from PubMed, Google News) appear with attribution and link to source.
- **Follow Tersonae** — Logged-in users follow Tersonae; content in a Tersona’s feed (from its RSS subscriptions and tagging) appears in the main activity feed when relevant.
- **Chat with each Tersona** — Users can open a chat with any entity Tersona (e.g. Myrcene, Limonene). Conversation is contextual to that terpene/strain: the Tersona can answer questions, summarize its feed, point to Encyclopedia entries and recent PubMed/Google News items, and suggest strains or recipes. Can be powered by the same AI as TerpeneQueen, with per-Tersona context (name, feed, linked data). Chat entry point on each Tersona page (e.g. “Chat with Myrcene”).

### 2.2 User Tersona (preference profile)

- **Preferences & goals** — Flavor, effects, use case (e.g., focus, sleep, wellness).
- **Taste / aroma preferences** — Likes and dislikes (citrus, earthy, floral, etc.).
- **Recommendations** — Strains, terpenes, or products that match the user Tersona; “For you” and which Tersonae to suggest.
- **Profile over time** — Optional: track how preferences or tolerance change.
- **Privacy-first** — Clear data use; optional account; export/delete.
- **Integration** — Feeds into discovery (Encyclopedia, Terproduct Database) and Activity Feed personalization.

---

## 3. Post to feed, comment, review (social layer)

- **Post to feed** — Authenticated users create a post (text, optional links/images, optional tag to terpene(s)/strain(s)/product(s)). Posts appear in main feed and in the feeds of tagged Tersonae.
- **Comment** — Comments on posts and/or on entities (strains, products, Terports). Threaded or flat; moderation and reporting.
- **Review** — Structured reviews (e.g. star rating + text) for strains and/or products. Reviews appear as feed items and on entity pages; can be tagged to Tersonae so they appear in that Tersona’s feed.
- **Moderation** — Policy, reporting UX, and backend: review queue, approve/remove, block user. Consider automated filters (e.g. profanity, spam) in a later phase; human-only MVP with simple queue at launch.

---

## 4. Encyclopedia

**Core knowledge hub for terpenes and related science. Supports the feed: linked from feed items (“See full profile”); new/updated content appears in relevant Tersonae feeds and main feed.**

- **Terpene library** — Browse and search terpenes (names, structures, properties, occurrence).
- **Strain profiles** — Cannabis strains with terpene profiles, effects, aromas, genetics.
- **Essential oils & ingredients** — Terpene content and usage across aromatherapy, cosmetics, food & beverage.
- **Definitions & glossary** — Clear, evidence-based definitions (e.g., terpenome, entourage effect).
- **Cross-linking** — Strain ↔ terpene ↔ ingredient links for discovery.
- **References** — Links to or citations from scientific literature where applicable.

---

## 5. Terports

**Short-form “reports” or summaries (terpene + report). Support the feed: linked from feed items; new Terports appear in relevant Tersonae feeds and main feed.**

- **Strain Terports** — Snapshot reports for strains: top terpenes, typical effects, aroma, use cases.
- **Terpene Terports** — One-pagers per terpene: chemistry, sources, effects, safety notes.
- **Product / category Terports** — Summaries for product categories or ingredients (e.g., “Terpenes in Beverages”).
- **Shareable / printable** — Easy share links or PDF for pros and educators.
- **Versioning** — Optional “last updated” and simple version history for accuracy.

---

## 6. Terproduct Database

**Structured database of products that feature or reference terpenes. Supports the feed: product updates and reviews appear in main feed and relevant Tersonae feeds.**

- **Product records** — Name, brand, category, terpene callouts, ingredients, COA link where available.
- **Categories** — Cannabis products, supplements, essential oils, beverages, cosmetics, etc.
- **Search & filters** — By terpene(s), brand, category, region, availability.
- **Strain ↔ product links** — Products that use or reference specific strains/terpenes.
- **User/community input** — Submissions, corrections, or “suggest a product” (with moderation).
- **Regulatory / compliance** — Fields for jurisdiction, claims, and compliance notes where relevant.

---

## 7. Podcasts

**Audio content for terpene and cannabis education. New episodes surface in the feed and in relevant Tersonae feeds.**

- **Original shows** — Terpedia-hosted series (interviews, deep dives, industry news).
- **Episodes** — Per-episode pages with show notes, links to strains/terpenes/products.
- **Subscribe** — RSS and links to major podcast platforms (Apple, Spotify, etc.).
- **Transcripts** — Searchable transcripts for accessibility and SEO.
- **Cross-link** — Episode mentions of strains/terpenes link to Encyclopedia/Terports and Tersona feeds.

---

## 8. Rx (Recipes)

**Formulations: lists of compounds and/or essential oils with volume/mass. Recipes can be forked and iterated on.**

- **Recipe = list of ingredients** — Each recipe is a list of compounds (terpenes, etc.) and/or essential oils with **volume or mass** per ingredient (e.g. 2 ml limonene, 0.5 g myrcene). Optional: name, description, category (e.g. topical, beverage, aroma blend), instructions.
- **Link to Encyclopedia/Terproduct** — Ingredients reference terpenes, essential oils, or products from the database; optional validation or autocomplete.
- **Fork and iterate** — Users can **fork** an existing recipe to create a copy they can edit. Iterations are explicit: “Forked from [original]” with link; optional version history or “derived from” graph so recipes evolve in a tree.
- **Discovery** — Recipes searchable/filterable by ingredient, author, category; new/updated recipes surface in the activity feed and can be tagged to Tersonae.
- **Attribution** — Author and, when forked, source recipe credited; optional licensing (e.g. share-alike).
- **Units** — Support volume (ml, L, etc.) and mass (g, mg, etc.) with clear unit per ingredient; optional scaling (e.g. “scale to 100 ml total”).

---

## Summary Table

| Feature | Purpose |
|--------|---------|
| **Activity Feed** | Primary experience: Facebook-like stream of editorial + UGC; follow Tersonae to shape feed. |
| **Tersona** | Entity Tersonae = subscribe to RSS per terpene/strain, surface a feed, and are chat-table (chat with each Tersona); user Tersona = preference profile and recommendations. |
| **Post / Comment / Review** | Users post to feed, comment on posts/entities, review strains/products; moderation required. |
| **Encyclopedia** | Core reference: terpenes, strains, ingredients, definitions; supports feed. |
| **Terports** | Short, shareable reports; support feed. |
| **Terproduct Database** | Searchable products tied to terpenes and strains; supports feed. |
| **Podcasts** | Audio education with show notes and cross-links; support feed. |
| **Rx (Recipes)** | Formulations: compounds/essential oils with volume or mass; fork and iterate; link to Encyclopedia/Terproduct. |

---

## Possible Additions (backlog)

- **TerpeneQueen / AI assistant** — General terpene Q&A (existing or expanded); can back “chat with Tersona” with per-Tersona context.
- **Lab / COA tools** — Upload or link COAs; parse terpene results; link to strain/product.
- **Pro / B2B** — API, bulk data, or white-label for brands and labs.

---

*Last updated: Feb 2025. Living document — adjust as product evolves.*
