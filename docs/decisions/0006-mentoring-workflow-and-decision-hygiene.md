# ADR-0006: Mentoring workflow and decision hygiene

Status: Accepted  
Date: 2026-07-30

## Context

The project is both a portfolio system and a learning environment. Decisions
must remain understandable when work resumes in another Codex task.

## Decision

Work in small, verifiable vertical slices. The developer exclusively writes
service code, tests, migrations and service configuration. Codex is the senior
Go mentor: it frames the task, explains design constraints, reviews the saved
implementation and verification output, and gradually raises task complexity
to match real-service engineering. Codex may update only shared documentation
to record progress, rules and accepted decisions.

Ready-to-copy code is a fallback after a genuine unsuccessful attempt or when
it has stopped being educational; small explanatory examples are preferred.
Durable cross-service decisions are recorded as ADRs. Reusable task-completion
and new-task message templates live in `docs/mentoring.md`.

Before a major feature begins, Codex explicitly recommends a new task and
suggests its title. Before an enduring decision is made, Codex explicitly says
that the decision should be documented. Codex does not create a new task or
commit code automatically.

## Consequences

- Reviews focus on the current diff and its tests.
- The developer retains authorship of all production code and gets practice
  with design, implementation, debugging and verification.
- New tasks can rebuild context from `AGENTS.md`, architecture, roadmap and
  ADRs rather than relying solely on chat history.
- Temporary experiments stay out of ADRs until a lasting choice is accepted.
