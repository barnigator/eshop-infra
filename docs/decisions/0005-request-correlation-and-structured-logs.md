# ADR-0005: Request correlation and structured logs

Status: Accepted  
Date: 2026-07-30

## Context

A request can travel through Gateway and several gRPC services. Plain text logs
without a shared correlation identifier make failures difficult to trace.

## Decision

Use structured `slog` logging. Pass `x-request-id` through gRPC metadata;
servers generate an ID when a caller has not provided one and place it in the
request context for logging.

## Consequences

- Request IDs are technical metadata, not domain attributes and not business
  protobuf fields.
- Gateway must propagate the inbound request ID to downstream gRPC calls when
  its HTTP server is added.
- Logs must not contain passwords, tokens or other secrets.
