# ACCESS

## Authorization Policy

Agents operating within this workspace must adhere to the following access boundaries:

### Read Access
- Full access is granted to the project root and all non-sensitive source files.
- Sensitive files (e.g., `.env`, `.git`, configuration secrets) are strictly forbidden.

### Write Access
- Implementation code must be restricted to the `./packages/**` directory.
- Modification of the host application or core infrastructure is not permitted unless explicitly authorized.

### Prohibited Areas
- Vendor directories (`vendor/`, `node_modules/`)
- System and temporary directories
- Build artifacts and caches
- Any path outside the project root
