#!/bin/bash

set -euo pipefail

cd ansible

ansible servers -a "psql -d phx_starter -c 'SELECT version FROM schema_migrations ORDER BY version DESC'" -u app