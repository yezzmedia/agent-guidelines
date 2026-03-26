<!-- Logo/Title Section -->
<p align="center">
  <img src="https://img.shields.io/badge/Agent-Guidelines-FF6B35?style=for-the-badge&logo=laravel&logoColor=white" alt="Agent Guidelines">
  <img src="https://img.shields.io/badge/Laravel-Ready-FF2D20?style=for-the-badge&logo=laravel&logoColor=white" alt="Laravel Ready">
  <img src="https://img.shields.io/badge/Package--First-6C5CE7?style=for-the-badge&logo=packagist&logoColor=white" alt="Package First">
</p>

<h1 align="center">Agent Guidelines</h1>

<p align="center">
  Reusable AI agent guidelines for package-driven Laravel workflows
</p>

---

## 📦 What You Get

| Icon | Feature | Description |
|:---:|---|---|
| 🔒 | **Strict Access Control** | Explicit read/write allowlists for directory boundaries |
| 📦 | **Package-First Architecture** | Host application stays untouched; all code goes into packages |
| 🌿 | **Git Workflow** | Branch naming, commit rules, PR flow, and cleanup discipline |
| ✅ | **Verification Gates** | Required checks before any feature is marked complete |
| 📚 | **Release Safety** | SemVer rules and API stability contracts |
| 🌐 | **Language Standards** | English for code, German for user communication |

---

## ⚡ Quick Start — Use It Directly

If you want a simple setup without any extra tooling:

```
1. Copy AGENTS.md into the root of your repository
2. Adjust paths such as ./packages/** to match your project layout
3. Remove or refine any rules that are too strict for your application
4. Commit the file so every agent session starts with the same baseline
```

---

## 🚀 Laravel Boost Installation

If you maintain a Laravel package and want these rules to be distributed through Laravel Boost, use them as a Boost guideline source.

### Step 1 — Add the guideline file to your package

```
📁 your-package/
└── resources/
    └── boost/
        └── guidelines/
            └── core.blade.php
```

Place your project-specific rules in that file. Laravel Boost will include them when users install or update Boost resources.

### Step 2 — Publish your package

```
📦 Release the package version that contains your Boost guideline file
```

### Step 3 — Install Boost in the target Laravel project

```bash
# install your package first
composer require vendor/package-name --dev

# then install Laravel Boost
composer require laravel/boost --dev
php artisan boost:install
```

> 💡 Replace `vendor/package-name` with the package that ships your Boost guideline file

If the package is already installed, you can refresh the generated files later:

```bash
php artisan boost:update --discover
```

### Step 4 — Verify the generated agent files

```
✅ Confirm that the generated agent files include your package guidance
```

---

## 🔄 Recommended Workflow

- 📄 Keep `AGENTS.md` as the source text when you need a repository-level file
- 📂 Mirror the same intent into `resources/boost/guidelines/core.blade.php` when shipping rules through Laravel Boost
- 🎯 Keep the rules short, explicit, and enforcement-oriented
- 🔍 Only include project-specific differences that are not already covered well by Laravel Boost itself

---

## 📝 Notes

- The current defaults are optimized for Composer package development
- The rules are intentionally strict: if a path is not explicitly allowed, agents should not modify it
- Laravel Boost is the best distribution path when you want package rules to follow the package into other Laravel projects

---

<p align="center">
  <sub>Built with 🔥 for package-driven Laravel teams</sub>
</p>
