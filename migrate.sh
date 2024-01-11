#!/bin/bash

set -euo pipefail

cd ansible

ansible-playbook -u app -v playbooks/migrate.yml