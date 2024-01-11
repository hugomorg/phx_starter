#!/bin/bash

set -euo pipefail

cd ansible

if [ $# -eq 0 ]; then
    echo "No arguments supplied"
    exit 1
fi

ansible-playbook -u app -v playbooks/rollback-db.yml -D --extra-vars "schema_version=$1"