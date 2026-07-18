# CloakBrowser Linux / Cloud-Agent Tutorial

This repository includes a Linux/cloud-agent compatible automation tutorial:

- `cloakbrowser_colab_browser_automation_tutorial_Marktechpost.ipynb.txt`

The tutorial was refactored to run against a localhost HTTP origin (instead of a `data:` URL), which fixes localStorage restrictions in headless Linux runners.

## Quick start

### 1) Clone and enter repo

```bash
git clone https://github.com/genregod/Cloakbrowse.git
cd Cloakbrowse
```

### 2) Run one-shot setup

```bash
chmod +x scripts/setup_linux.sh
./scripts/setup_linux.sh
```

### 3) Run the tutorial

If you use Jupyter/Notebook, run the notebook-style cells from:

- `cloakbrowser_colab_browser_automation_tutorial_Marktechpost.ipynb.txt`

For script-like execution in cloud agents, execute the same code blocks sequentially in a Python runtime.

## Pull latest updates

If you already cloned the repo:

```bash
git fetch origin
git checkout main
git pull --ff-only origin main
```

To use the feature branch changes before merge:

```bash
git fetch origin
git checkout fix/local-linux-cloud-agent-http-origin
git pull --ff-only origin fix/local-linux-cloud-agent-http-origin
```

## Artifacts generated

The tutorial writes outputs under:

- `artifacts/cloakbrowser_advanced_tutorial/`

Expected files include:

- `test_page.html`
- `cloakbrowser_result.png`
- `storage_state.json`
- `persistent_profile/`
- `summary.json`

## CI / cloud-agent notes

- In CI (`CI=true`), browser args include:
  - `--no-sandbox`
  - `--disable-dev-shm-usage`
- The tutorial exits non-zero if critical sections fail:
  - `advanced_context`
  - `storage_restore`
  - `persistent_profile`
  - `rendered_extraction`

## Troubleshooting

- If Linux dependency installation fails, re-run:

```bash
python3 -m playwright install-deps chromium
```

- If package installs fail due to environment policy, use a virtualenv:

```bash
python3 -m venv .venv
source .venv/bin/activate
./scripts/setup_linux.sh
```
