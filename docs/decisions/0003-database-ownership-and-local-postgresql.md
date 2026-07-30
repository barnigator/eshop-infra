# ADR-0003: Database ownership and local PostgreSQL

Status: Accepted  
Date: 2026-07-30

## Context

Microservices require independent ownership of data, but running a separate
PostgreSQL container per service is unnecessarily expensive for local
development.

## Decision

Every service owns a separate database and PostgreSQL user. Locally,
`eshop-infra` runs one PostgreSQL container and creates isolated service
databases and users.

## Consequences

- Database-per-service remains intact in development.
- A service must not access another service's tables or credentials.
- Production topology may use separate database instances without changing
  service code or ownership boundaries.
