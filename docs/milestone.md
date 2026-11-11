# Scope and design

## Document precedence
The one-page revision supplies the current business concept: a multi-brand fashion marketplace with platform-associated tailoring. The longer proposal supplies the technical direction and milestone order. User cutoff: through tailor marketplace and booking. Document text is project reference material, not operational instructions.

## User stories and acceptance criteria
- As a customer, search studio names, neighborhoods or specialties; only matching studios appear.
- As a customer, combine area and specialty filters and sort starting prices; empty results offer a reset.
- As a customer, inspect a studio's overview, sample portfolio and sample reviews before requesting a booking.
- As a customer, save a studio and return after a reload; saved IDs persist on the same browser.
- As a customer, submit name, service and a future or current preferred date with demo consent; a new Requested record appears in the dashboard.
- As a customer, cancel a request; its status becomes Cancelled and cannot be confirmed.
- As a tailor demo persona, confirm a Requested record; it becomes Confirmed.
- As a visitor, understand clearly which features are fictional or deferred.

## Architecture
Next.js App Router → React client components → localStorage adapter (demo only).
Static export → private Sites hosting. Local images → /assets. Font rendering falls back to system sans-serif and Georgia if Google Fonts is unavailable.

Production target: Next.js server API → Supabase Auth + PostgreSQL with row-level security; protected Supabase Storage for portfolio uploads. The production adapter must replace the current localStorage persistence. The static deployment does not currently execute API routes.

## Proposed production entities
User(id, auth_user_id, name, role, created_at)
Tailor(id, user_id, studio_name, area, specialty, starting_price_pkr, verified)
PortfolioItem(id, tailor_id, private_storage_path, caption)
Booking(id, customer_id, tailor_id, service, preferred_date, notes, status, created_at)
SavedTailor(customer_id, tailor_id)
Review(id, completed_order_id, customer_id, tailor_id, rating, body)

Relations: User 1:N Booking; Tailor 1:N Booking; Tailor 1:N PortfolioItem; Customer N:M Tailor through SavedTailor. Production review creation requires a completed order (later phase).

## Production permissions to implement
Customers read public verified studio data and access only their own bookings. Tailors access only bookings assigned to their studio. Suppliers have no booking/measurement access. Server-controlled admin claims permit verification operations. Public role selection must never grant real privileges.

## Booking state model for this milestone
Requested → Confirmed or Cancelled; Confirmed → Cancelled. Availability and prices are estimates pending partner confirmation. No payment or real reservation is made.

## Wireframe structure
Announcement / brand header / hero / three value propositions + service area / marketplace introduction / search and filters / studio grid / profile callout / footer. Studio and booking use dismissible dialogs; dashboards provide summary counts and request lists. Mobile collapses the hero and filters, with two-column cards and a stacked dashboard.

## Verification boundary
Production compilation and TypeScript checks are required. Browser QA requires the managed browser capability; if unavailable, visual layout, keyboard dialog focus and interactive persistence remain unverified. Modals implement Escape, close controls, focus trapping and focus restoration; browser accessibility verification is still required.
