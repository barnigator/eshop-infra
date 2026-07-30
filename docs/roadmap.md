# Eshop roadmap

> Last reviewed: 2026-07-30.  
> Work in small vertical slices. Do not add infrastructure merely because it
> appears in the target diagram.

## Current position

The project has a functioning SSO and Seller service plus local Compose
infrastructure. The active work item is the first Gateway auth vertical slice:

```text
HTTP Register/Login -> Gateway use case -> SSO gRPC client -> SSO
```

## Milestones

### 0. Product and architectural foundation — complete

- Catalogue (not in-platform payment marketplace) boundary fixed.
- Roles and key user scenarios described.
- Service boundaries, databases and communication style defined.
- Shared protobuf module created.

### 1. Shared documentation and durable rules — complete

- Versioned architecture, roadmap and ADRs in `eshop-infra/docs`.
- Workspace and project-level `AGENTS.md` guidance.

### 2. SSO readiness for Gateway authorization — in progress

- [x] Registration, login, bcrypt, JWT and PostgreSQL.
- [x] gRPC contract definitions for `ValidateToken` and `GetUser`.
- [ ] Add `role` and `is_active` to SSO persistence, domain and JWT claims.
- [ ] Implement `ValidateToken` and `GetUser`.
- [ ] Decide and configure the Gateway-owned SSO `app_id`.
- [ ] Add migration and integration tests for the new contract.

### 3. API Gateway auth vertical slice — in progress

- [x] Gateway configuration, logger, SSO client and auth use case.
- [ ] Implement and test HTTP `POST /api/v1/auth/register`.
- [ ] Implement and test HTTP `POST /api/v1/auth/login` after the `app_id`
  decision.
- [ ] Add router, HTTP server lifecycle and graceful shutdown.
- [ ] Map expected domain/gRPC errors to stable HTTP responses.
- [ ] Run an end-to-end smoke test against Compose.

### 4. Gateway authorization and Seller HTTP API

- [ ] JWT authentication middleware using SSO token validation.
- [ ] Role middleware for `user`, `seller` and `admin`.
- [ ] Propagate request IDs to downstream gRPC calls.
- [ ] Expose Seller REST endpoints without accepting an arbitrary `user_id`
  from a trusted client body.
- [ ] Add OpenAPI/Swagger, recovery, CORS, validation and initial rate limits.

### 5. Seller moderation completion

- [ ] Define explicit admin moderation actions and reasons.
- [ ] Enforce ownership and role checks through Gateway.
- [ ] Add endpoint-level integration tests.

### 6. Catalog Service

- [ ] Create the service and its PostgreSQL schema.
- [ ] Categories and administrative category management.
- [ ] Products, product status lifecycle and purchase links.
- [ ] Filtering, pagination and search baseline.
- [ ] gRPC contract, unit tests and integration tests.

### 7. Media Service

- [ ] Add MinIO/S3 to local infrastructure.
- [ ] Upload, delete and associate image metadata.
- [ ] Enforce ownership and content/size validation.
- [ ] Connect Catalog and Seller image use cases.

### 8. Redis where justified

- [ ] Cache catalogue read paths with explicit invalidation rules.
- [ ] Add Gateway rate limiting.
- [ ] Decide whether token revocation/session state requires Redis.

### 9. Kafka and asynchronous events

- [ ] Add Kafka to Compose only after producer/consumer requirements exist.
- [ ] Define event envelope, versioning, idempotency and retry/DLQ strategy.
- [ ] Publish seller and product lifecycle events.

### 10. Post-MVP services

- [ ] Notification service consuming domain events.
- [ ] Subscription plans and seller limits.
- [ ] Payment integration only after subscription requirements are stable.
- [ ] Search, analytics and administrative workflows as separate bounded
  components when the need is concrete.

### 11. Production readiness and portfolio packaging

- [ ] Health/readiness endpoints and Docker health checks.
- [ ] Prometheus metrics, dashboards and distributed tracing.
- [ ] CI checks: format, test, build, migrations and linting.
- [ ] Security review for secrets, auth, input validation and dependency
  updates.
- [ ] README updates, architecture diagram, API examples and one-command local
  startup instructions.

## Rule for changing the roadmap

Update this document when a milestone changes status, scope, order or
dependency. Record the reason as an ADR when the change affects an enduring
architecture choice rather than a simple implementation detail.
