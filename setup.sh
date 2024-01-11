#!/bin/bash

set -euo pipefail

cd ansible

# Note: ubuntu only works on first run. After setting up users,
# the account is deactivated
ansible-playbook -u ubuntu -v playbooks/setup-server.yml -D -i inventory

ansible-playbook -u hugo -v playbooks/setup-db.yml -D

ansible-playbook -u hugo -v playbooks/deploy-app.yml --skip-tags deploy -D

ansible-playbook -u hugo -v playbooks/logs.yml -D

ansible-playbook -u hugo -v playbooks/reboot.yml -D
