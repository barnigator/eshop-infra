# ADR-0004: Migration ownership and execution

Status: Accepted  
Date: 2026-07-30

## Context

The shared local environment must start services only after their schemas are
ready, while a service team must retain ownership of its schema evolution.

## Decision

SQL migrations live in the repository of the service that owns the schema.
`eshop-infra` mounts those directories into one-shot migration containers and
orders service startup after migration success.

## Consequences

- Infrastructure composes and runs migrations but does not define service
  tables.
- Each migration is reviewed and tested with its service.
- Migration changes that affect compatibility or data safety require a new ADR
  or an update to the relevant existing ADR.
