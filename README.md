# Agent Guidelines

Reusable AI agent guidelines for package-driven Laravel workflows.

## Purpose

This repository provides a reusable `AGENTS.md` baseline for teams that want stricter agent behavior around package boundaries, Git workflow, verification, and release safety.

## Included

- `AGENTS.md` as the main guideline file
- access rules for read/write boundaries
- package-first architecture and host protection rules
- Git workflow, branch naming, and completion requirements
- verification defaults for Laravel projects

## How to Use

1. Copy `AGENTS.md` into the root of your target repository.
2. Adjust allowed paths such as `./packages/**` to match your project structure.
3. Keep only the rules that are truly project-specific.
4. If you use Laravel Boost, adapt the same rules into your Boost guideline source.

## Notes

- The current defaults are optimized for Composer package development.
- The file is intentionally strict: if a path is not explicitly allowed, agents should not modify it.
