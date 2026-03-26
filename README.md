<!-- Header -->
<p align="center">
  <img src="https://img.shields.io/badge/Laravel-Boost-FF2D20?style=for-the-badge&logo=laravel&logoColor=white" alt="Laravel Boost">
  <img src="https://img.shields.io/badge/Package-First-6C5CE7?style=for-the-badge&logo=packagist&logoColor=white" alt="Package First">
  <img src="https://img.shields.io/badge/Agent-Guidelines-111827?style=for-the-badge&logo=github&logoColor=white" alt="Agent Guidelines">
</p>

<h1 align="center">Agent Guidelines</h1>

<p align="center">
  Reusable Laravel Boost guideline source for package-driven AI workflows
</p>

---

## What This Repository Ships

| Item | Purpose |
|---|---|
| `core.blade.php` | Source of truth for Laravel Boost |
| Package-first rules | Keep implementation inside packages |
| Host protection rules | Prevent unintended host changes |
| Git and release workflow | Enforce branch, commit, PR, and release discipline |
| Verification gates | Define required quality checks before completion |

---

## Source of Truth

This repository is now centered on the Laravel Boost guideline file:

```text
core.blade.php
```

That file is the version you should copy into your package and distribute through Laravel Boost.

---

## Install in Your Package

If you want to use these rules in your own Laravel package, copy the root Boost guideline file into the Boost path inside your package:

```bash
# clone the repository to a temporary location
git clone https://github.com/yezzmedia/agent-guidelines.git /tmp/agent-guidelines

# copy the Laravel Boost guideline source into your package
mkdir -p resources/boost/guidelines
cp /tmp/agent-guidelines/core.blade.php resources/boost/guidelines/core.blade.php

# cleanup temporary clone
rm -rf /tmp/agent-guidelines
```

Resulting package structure:

```text
your-package/
└── resources/
    └── boost/
        └── guidelines/
            └── core.blade.php
```

---

## Publish Through Laravel Boost

Once the file exists in your package, release that package version.

In the target Laravel application:

```bash
composer require vendor/package-name --dev
composer require laravel/boost --dev
php artisan boost:install
```

Replace `vendor/package-name` with the package that contains your guideline file.

If the package is already installed and you only want to refresh generated files:

```bash
php artisan boost:update --discover
```

---

## Verify the Generated Files

After installing or updating Boost, confirm that the generated agent files include your package guidance and still reflect your intended access boundaries, workflow rules, and verification requirements.

---

## Recommended Usage

- Keep `core.blade.php` as the only source of truth
- Keep the rules short, explicit, and enforcement-oriented
- Only add project-specific differences that Laravel Boost does not already cover well
- Prefer package distribution over manually maintaining multiple agent entry files

---

## Notes

- The defaults in this repository are optimized for Composer package development
- The rules are intentionally strict: if a path is not explicitly allowed, agents should not modify it
- Laravel Boost is the intended delivery mechanism for these guidelines

---

<p align="center">
  <sub>Built for package-driven Laravel teams using Laravel Boost</sub>
</p>
