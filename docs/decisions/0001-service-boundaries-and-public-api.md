# ADR-0001: Service boundaries and public API

Status: Accepted  
Date: 2026-07-30

## Context

Eshop contains authentication, seller/brand, catalogue and media concerns that
will evolve at different speeds. Browser and mobile clients need a stable
public API without knowing internal service topology.

## Decision

Use separate services for SSO, Seller, Catalog and Media. Expose one public
REST API through `eshop-api-gateway`; services communicate internally over
gRPC.

The initial product is a catalogue that links a visitor to a seller's purchase
channel. Payment processing is outside MVP.

## Consequences

- Clients do not call internal services directly.
- Gateway owns HTTP concerns and orchestration, not a shared business database.
- Each service can be built, tested and deployed independently.
- Cross-service business workflows require explicit contracts and, later,
  carefully designed events rather than direct database access.
