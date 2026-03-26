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
| `GUIDELINES.md` | Source of truth for Laravel Boost |
| `install.sh` | One-line installer for Laravel projects |
| Package-first rules | Keep implementation inside packages |
| Host protection rules | Prevent unintended host changes |
| Git and release workflow | Enforce branch, commit, PR, and release discipline |
| Verification gates | Define required quality checks before completion |

---

## Source of Truth

This repository is now centered on the Laravel Boost guideline file:

```text
GUIDELINES.md
```

That file is the version you should copy into `/.ai/guidelines/*` before refreshing Laravel Boost.

---

## Install in Your Project

If you want to use these rules in your own Laravel project, run the installer from the root of your Laravel app:

```bash
curl -fsSL https://yezzmedia.github.io/agent-guidelines/install | bash
```

The GitHub Pages bootstrap downloads the canonical installer, which then downloads `GUIDELINES.md` directly into `/.ai/guidelines/*` and runs `php artisan boost:update`.

If you prefer to inspect or run the canonical installer manually first:

```bash
curl -fsSL https://raw.githubusercontent.com/yezzmedia/agent-guidelines/main/install.sh -o install-agent-guidelines.sh
bash install-agent-guidelines.sh
```

Manual equivalent:

```bash
# create the target directory
mkdir -p ./.ai/guidelines

# download the guideline file into your project
curl -fsSL https://raw.githubusercontent.com/yezzmedia/agent-guidelines/main/GUIDELINES.md -o ./.ai/guidelines/GUIDELINES.md

# regenerate Laravel Boost files
php artisan boost:update

```

Resulting project structure:

```text
your-project/
└── .ai/
    └── guidelines/
        └── GUIDELINES.md
```

---

## Refresh an Existing Installation

If the guideline file already exists and you only want to refresh it, rerun the installer or redownload the file inside `/.ai/guidelines/*` and run Boost again:

```bash
curl -fsSL https://yezzmedia.github.io/agent-guidelines/install | bash
```

Manual equivalent:

```bash
curl -fsSL https://raw.githubusercontent.com/yezzmedia/agent-guidelines/main/GUIDELINES.md -o ./.ai/guidelines/GUIDELINES.md
php artisan boost:update
```

---

## Verify the Generated Files

After copying the guideline file and running Boost, confirm that the generated agent files include your project guidance and still reflect your intended access boundaries, workflow rules, and verification requirements.

---

## Recommended Usage

- Keep `GUIDELINES.md` as the only source of truth
- Use `install.sh` for the fastest project bootstrap and refresh flow
- Copy it into `./.ai/guidelines/` whenever you onboard or refresh a project
- Keep the rules short, explicit, and enforcement-oriented
- Only add project-specific differences that Laravel Boost does not already cover well
- Prefer `php artisan boost:update` over manually maintaining generated agent entry files

---

## Notes

- The defaults in this repository are optimized for Composer package development
- The rules are intentionally strict: if a path is not explicitly allowed, agents should not modify it
- Laravel Boost should be refreshed with `php artisan boost:update` after guideline changes

---

<p align="center">
  <sub>Built for package-driven Laravel teams using Laravel Boost</sub>
</p>
