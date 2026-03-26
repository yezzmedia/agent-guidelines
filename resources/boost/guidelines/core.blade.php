## Agent Guidelines

This package provides reusable AI guidelines for package-driven Laravel workflows with strict access boundaries, package-first implementation rules, Git discipline, and completion gates.

### Features
- Access boundaries: agents may read only inside the current project root. Implementation code may be written only inside `./packages/**`. Any path outside the approved scope, including host application paths, sibling projects, home/system paths, `vendor`, `node_modules`, `storage/framework`, `bootstrap/cache`, and `.git`, must remain untouched. If a path is not explicitly allowed, do not search, read, create, edit, move, or delete anything inside it.
- Package-first architecture: all implementation code belongs in Composer packages for maximum modularity. The host application is read-only by default and must remain untouched unless explicitly requested. If host integration is required, provide explicit manual steps instead of auto-applying changes. Do not install, remove, or update dependencies without explicit approval.
- UI, reuse, and data rules: use Filament for backend interfaces only, avoid standalone Livewire UI flows, avoid custom CSS and styling-only HTML, and build UI sections such as hero or navigation as reusable components. Prefer existing models, services, DTOs, repositories, and data sources before introducing new structures. Never duplicate code when shared components, services, or utilities can be reused.
- Language and identity defaults: use `yezzmedia` as the default vendor and `info@yezzmedia.com` as the default contact email. All code, tests, comments, documentation, commit messages, and generated package content must be written in English. Only direct communication with the user may be in German, and every user-facing response must begin with `RE: `.
- Git workflow and branch discipline: never commit directly to `main`. Start every new topic, feature, or test task from a fresh branch created from the latest `main` using the format `<type>/<package>-<short-kebab-summary>`, with allowed branch types `feature`, `fix`, `test`, `chore`, `docs`, `refactor`, and `release`. Keep one topic per branch, do not reuse old branches for new work, always offer a git commit after a completed change, ask whether previous work should be committed before starting a new feature, and after a committed feature ask whether to complete the GitHub flow with PR, merge, release, and branch cleanup. Do not merge without explicit user confirmation.

@verbatim
<code-snippet name="Branch naming example" lang="text">
feature/security-monitor-login-audit
fix/user-center-session-timeout
test/core-smoke-coverage
</code-snippet>
@endverbatim

- Verification and completion gates: a feature is complete only when implementation, tests, and quality checks are finished. Run all relevant checks from the required verification commands, explicitly report missing tooling instead of silently skipping it, and do not mark work complete while any required check or CI gate is failing.

@verbatim
<code-snippet name="Required verification commands" lang="bash">
./vendor/bin/pint
php artisan test --compact
./vendor/bin/phpstan analyse --memory-limit=1G
php artisan dusk
php artisan test --compact --group=smoke
npm run build
</code-snippet>
@endverbatim

- Release and API stability: follow SemVer for package releases. Breaking changes require a major version bump and clear migration notes, new backward-compatible features require a minor version bump, fixes require a patch version bump, and public package APIs must be treated as stable contracts unless explicit approval is given for breaking changes. Keep release notes concise and user-focused.
