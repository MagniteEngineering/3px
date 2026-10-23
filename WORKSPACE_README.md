# MagniteEngineering Multi-Repo Workspace

This workspace contains multiple repositories from the MagniteEngineering organization, organized by functional category.

## Workspace Structure

```
/workspace/
├── README.md                          # 3px - Realtime data integrations (root repo)
├── real_time_data_integration.proto   # Protocol buffer definitions
├── WORKSPACE_README.md                # This file
│
├── core/                              # Core API and validation projects
│   ├── xapi-proto/                    # ExchangeApi (xAPI) extensions for OpenRTB via protobuf
│   └── snowflake-validator/           # Snowflake data validation
│
├── mobile/                            # Mobile SDK projects
│   ├── demand-manager-ios/            # DM-specific Demo Apps for iOS integration
│   └── demand-manager-android/        # Android SDK and demos
│
├── privacy-sandbox/                   # Privacy Sandbox & Web API experiments
│   ├── fledge.polyfill/               # Fledge Trial Javascript Polyfill
│   ├── tdpp-trial/                    # Turtledove++ Trial
│   ├── ProprietaryCohorts/            # Proprietary Cohorts implementation
│   ├── gatekeeper-sparrow-server/     # Gatekeeper SPARROW POC implementation
│   ├── Storage-Access-API/            # Storage Access API experiments
│   ├── FLoC-Server-FKA-Gatekeeper--POC/  # FLoC Server POC
│   └── FLoC-Server-FKA-Gatekeeper-/   # FLoC Server implementation
│
└── infrastructure/                    # Infrastructure and operations tools
    ├── terraform-provider-pingdom/    # Terraform provider to manage Pingdom resources (fork)
    ├── exabgpctl/                     # ExaBGP wrapper and control tool (fork)
    └── go-pingdom/                    # Pingdom API access from Go (fork)
```

## Repository Categories

### 🔧 Core Projects
These repositories contain core APIs, protocol definitions, and data validation tools.

- **xapi-proto**: ExchangeApi (xAPI) extensions for OpenRTB via protobuf
  - Location: `core/xapi-proto/`
  - URL: https://github.com/MagniteEngineering/xapi-proto

- **snowflake-validator**: Snowflake data validation tools
  - Location: `core/snowflake-validator/`
  - URL: https://github.com/MagniteEngineering/snowflake-validator

### 📱 Mobile SDKs
Mobile integration projects for iOS and Android platforms.

- **demand-manager-ios**: DM-specific Demo Applications for iOS integration
  - Location: `mobile/demand-manager-ios/`
  - URL: https://github.com/MagniteEngineering/demand-manager-ios

- **demand-manager-android**: Android SDK and integration demos
  - Location: `mobile/demand-manager-android/`
  - URL: https://github.com/MagniteEngineering/demand-manager-android

### 🔒 Privacy Sandbox Projects
Experimental implementations of privacy-preserving web APIs and proposals.

- **fledge.polyfill**: Fledge Trial Javascript Polyfill
  - Location: `privacy-sandbox/fledge.polyfill/`
  - URL: https://github.com/MagniteEngineering/fledge.polyfill

- **tdpp-trial**: Turtledove++ Trial implementation
  - Location: `privacy-sandbox/tdpp-trial/`
  - URL: https://github.com/MagniteEngineering/tdpp-trial

- **ProprietaryCohorts**: Proprietary Cohorts implementation
  - Location: `privacy-sandbox/ProprietaryCohorts/`
  - URL: https://github.com/MagniteEngineering/ProprietaryCohorts

- **gatekeeper-sparrow-server**: Gatekeeper SPARROW POC implementation
  - Location: `privacy-sandbox/gatekeeper-sparrow-server/`
  - URL: https://github.com/MagniteEngineering/gatekeeper-sparrow-server

- **Storage-Access-API**: Storage Access API experiments
  - Location: `privacy-sandbox/Storage-Access-API/`
  - URL: https://github.com/MagniteEngineering/Storage-Access-API

- **FLoC-Server Projects**: Federated Learning of Cohorts server implementations
  - Location: `privacy-sandbox/FLoC-Server-FKA-Gatekeeper--POC/`
  - Location: `privacy-sandbox/FLoC-Server-FKA-Gatekeeper-/`
  - URLs: https://github.com/MagniteEngineering/FLoC-Server-FKA-Gatekeeper--POC
  - URLs: https://github.com/MagniteEngineering/FLoC-Server-FKA-Gatekeeper-

### 🏗️ Infrastructure & Operations
Infrastructure automation and monitoring tools (includes forked projects).

- **terraform-provider-pingdom**: Terraform provider to manage Pingdom resources
  - Location: `infrastructure/terraform-provider-pingdom/`
  - URL: https://github.com/MagniteEngineering/terraform-provider-pingdom
  - Note: Fork of russellcardullo/terraform-provider-pingdom

- **exabgpctl**: ExaBGP wrapper and control tool
  - Location: `infrastructure/exabgpctl/`
  - URL: https://github.com/MagniteEngineering/exabgpctl
  - Note: Fork of raddessi/exabgpctl
  - Docs: https://exabgpctl.readthedocs.io/en/latest/

- **go-pingdom**: Pingdom API access from Go
  - Location: `infrastructure/go-pingdom/`
  - URL: https://github.com/MagniteEngineering/go-pingdom
  - Note: Fork of russellcardullo/go-pingdom

## Root Repository: 3px

The workspace root contains the **3px** repository - Realtime data integrations.
- URL: https://github.com/MagniteEngineering/3px
- Branch: `cursor/connect-to-magniteinc-github-repos-ef39`

## Working with Multiple Repositories

### Updating All Repositories
```bash
# Update all repos at once
for dir in core/* mobile/* privacy-sandbox/* infrastructure/*; do
  if [ -d "$dir/.git" ]; then
    echo "Updating $dir..."
    (cd "$dir" && git pull)
  fi
done
```

### Checking Status Across Repos
```bash
# Check git status for all repos
for dir in . core/* mobile/* privacy-sandbox/* infrastructure/*; do
  if [ -d "$dir/.git" ]; then
    echo "=== $dir ==="
    (cd "$dir" && git status -s)
  fi
done
```

### Creating Feature Branches
```bash
# Create same-named branch across multiple repos
BRANCH_NAME="feature/your-feature"
for dir in core/* mobile/*; do
  if [ -d "$dir/.git" ]; then
    (cd "$dir" && git checkout -b "$BRANCH_NAME")
  fi
done
```

## GitHub Authentication

Authenticated as: **cursor**
- GitHub CLI installed and configured
- Organization: MagniteEngineering
- All repositories cloned via HTTPS with token authentication

## Quick Links

- **Organization**: https://github.com/MagniteEngineering
- **Magnite Wiki**: https://magnite.atlassian.net/wiki/spaces/techops/pages/463178722/github.com+MagniteInc+OneLogin+SSO

## Notes

- All repositories are public under the MagniteEngineering organization
- Infrastructure repos (terraform-provider-pingdom, exabgpctl, go-pingdom) are forks with upstream remotes configured
- Privacy Sandbox projects are experimental/POC implementations from 2020-2021
- Mobile SDKs are actively maintained demo applications

---

Last updated: 2025-10-23
