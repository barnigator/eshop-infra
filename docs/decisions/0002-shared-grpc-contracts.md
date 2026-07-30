# ADR-0002: Shared gRPC contracts

Status: Accepted  
Date: 2026-07-30

## Context

Gateway and internal services need stable, type-safe contracts. Copying
generated code or defining duplicate request types in several services would
make incompatible changes likely.

## Decision

Store protobuf source and generated Go code in the versioned `protos`
repository. Services consume tagged module versions. gRPC contracts describe
transport only; use cases depend on small interfaces defined by their consumer.

## Consequences

- A contract change is a cross-repository event and must be reviewed for
  backward compatibility.
- Generated code must be regenerated and released with the matching `.proto`
  change.
- HTTP DTOs remain private to Gateway and do not leak into use cases.
