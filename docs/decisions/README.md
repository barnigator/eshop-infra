# Architecture decision records

An ADR records a durable decision that future work must respect. ADRs are not
task notes and do not replace issues or TODO comments.

For the working agreement and copyable task communication templates, see
[`../mentoring.md`](../mentoring.md).

## When to add one

Add or update an ADR for a decision about:

- service boundaries and ownership;
- HTTP or gRPC contracts;
- data ownership, migrations and compatibility;
- authentication, authorization and security policy;
- deployment, infrastructure or observability;
- event delivery, retries or consistency guarantees;
- a long-term development workflow rule.

Use `Proposed` while options remain open and `Accepted` after the decision is
made. Do not rewrite an accepted decision to hide history; mark it
`Superseded by ADR-XXXX` instead.

## Naming

Use four-digit ordered names:

```text
0001-short-decision-name.md
```

## Template

```md
# ADR-XXXX: Short decision title

Status: Proposed | Accepted | Superseded by ADR-XXXX  
Date: YYYY-MM-DD

## Context

What problem or constraint requires a decision?

## Decision

What has been chosen?

## Consequences

What becomes easier, harder, required or explicitly out of scope?
```

## Index

- [ADR-0001: Service boundaries and public API](0001-service-boundaries-and-public-api.md)
- [ADR-0002: Shared gRPC contracts](0002-shared-grpc-contracts.md)
- [ADR-0003: Database ownership and local PostgreSQL](0003-database-ownership-and-local-postgresql.md)
- [ADR-0004: Migration ownership and execution](0004-migration-ownership-and-execution.md)
- [ADR-0005: Request correlation and structured logs](0005-request-correlation-and-structured-logs.md)
- [ADR-0006: Mentoring workflow and decision hygiene](0006-mentoring-workflow-and-decision-hygiene.md)
