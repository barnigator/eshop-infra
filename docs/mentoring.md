# Mentoring workflow and message templates

## Working agreement

Eshop is a training project implemented with production-quality engineering
standards. The goal is to build the developer's practical ability to design,
implement, test, debug and review a real Go service.

The developer is the sole author of service code: source files, tests,
migrations and service configuration. Codex is the senior Go mentor. It sets a
scoped task from the roadmap, explains the relevant constraints, asks for an
implementation, and reviews the saved diff. Codex can update only shared
documentation to retain progress, rules and accepted decisions.

The developer's command shell is Bash. All command examples should use Bash
syntax unless the developer specifically requests a different shell.

Task difficulty grows over time: first a narrow unit of code, then contracts
and error handling, tests and migrations, cross-service flows, observability,
failure scenarios, compatibility and security. A working implementation is not
automatically the end of a task; it should also meet agreed acceptance checks.

Codex can use professional terminology. When a term is new or central to the
task, it should explain it briefly in context. Complete ready-to-copy code is
reserved for a genuine blocked attempt or a point at which writing it would no
longer teach anything useful.

## Template: report a completed task

Send this after saving your changes. Replace text in square brackets.

```text
Задача: [краткое название задачи].

Сделал:
- [что реализовано и где];
- [ещё один заметный результат].

Решение:
- [ключевой технический выбор и почему].

Проверил:
- [команда] — [результат];
- [команда/ручная проверка] — [результат].

Не уверен / хочу review:
- [конкретный вопрос, сомнение или участок кода].

Пожалуйста, сделай code review моего текущего diff по acceptance criteria.
```

Short version for a small task:

```text
Задача [название] готова. Изменил [файлы/компонент].
Проверил: [команда] — [результат].
Посмотри текущий diff, особенно [вопрос].
```

Do not write "готово" alone: the implementation, verification and one focused
review question are the minimum useful handoff.

## Template: start a new Codex task

Use this when beginning a major feature, a new service, a cross-repository
change, a contract/migration/security change, or whenever the current task has
become hard to navigate.

```text
Я начинаю новую большую задачу: [название фичи или сервиса].

Сначала загрузи контекст из:
- AGENTS.md;
- eshop-infra/docs/architecture.md;
- eshop-infra/docs/roadmap.md;
- eshop-infra/docs/decisions/README.md и относящихся к задаче ADR.

Репозитории в scope: [например: eshop-api-gateway, sso, protos].
Текущая цель: [какой пользовательский/технический результат нужен].
Ограничения или уже принятые решения: [если есть].

Не меняй код за меня. Сначала изучи текущее состояние и дай одну небольшую
следующую задачу с целью, затронутыми файлами, acceptance criteria и способом
проверки. Я реализую её сам и пришлю diff на review.
```

## Template: record a new decision

Use this as soon as a choice can affect future work.

```text
Нужно принять и сохранить архитектурное решение.
Контекст: [проблема и ограничения].
Варианты: [вариант A], [вариант B].
Предлагаю: [выбранный вариант и аргумент].

Помоги оценить последствия. Если решение принято, напомни обновить ADR в
eshop-infra/docs/decisions/ и связанные architecture.md или roadmap.md.
```
