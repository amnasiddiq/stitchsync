# StitchSync — FYP milestone prototype

A responsive Next.js 15 / React 19 / TypeScript fashion and associated-tailor marketplace. Based on the revised concept in StitchSync_Before_After_One_Page.docx, bounded by the “Tailor marketplace & booking” schedule row in StitchSync_FYP_Proposal.docx.

## Run

`npm install`

`npm run dev`

`npm run build` creates a static export in `out/`. Deployment copies it to `dist/`.

## Concept alignment update

The homepage now centers multi-brand fashion discovery, with ready-to-wear and unstitched collection filters, brand/designer browsing, product details, size previews and lace/tassel/embellishment preference previews. Only eligible unstitched products continue to associated stitching; selected outfit details carry into the booking form. Ready-to-wear checkout remains clearly deferred. Sample labels are fictional and photos illustrative. This corrects the earlier tailor-first presentation.

## Implemented demo

- Responsive marketplace, Karachi studio search, area and specialty filters, price and rating sorting.
- Studio overview, illustrative portfolio, explicitly labeled sample reviews.
- Saved studios with browser persistence.
- Local demo profiles for customer, tailor, supplier and admin dashboard previews.
- Required-field booking form with service, preferred date, written preferences and demo consent.
- Persistent requests, cancellation and tailor-role demo confirmation.
- Shopping homepage and functional sample product/brand browsing; purchasing and stock management remain later milestones.

## Important boundaries

This is a functional frontend prototype, not a production multi-user system. Browser localStorage stores demo records. Role selection provides presentation previews only, not authorization. There is no secure authentication, shared database, actual partner onboarding, live booking transmission or verified customer review system. Do not enter sensitive body measurements, addresses or private photos.

Supabase credentials were not provided. Secure authentication, PostgreSQL persistence, RLS policies, protected uploads and real role assignment must be connected before real users can use this system. Sample studios, prices, ratings and reviews are fictional. Photos are illustrative Unsplash images stored locally; they are not real studio portfolios.

Fabric checkout, stock, measurements, payments, AI generation, try-on and fulfillment are outside this requested cutoff. AI feasibility needs actual model evaluation and has not been performed.

See docs/milestone.md for requirements, design and acceptance criteria.
