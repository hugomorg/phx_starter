#!/bin/bash

set -euo pipefail

echo "Building latest..."
APP="phx_starter" /bin/bash ./build.sh

cd ansible

ansible-playbook -u deploy -v playbooks/deploy-app.yml --tags deploy --extra-vars ansible_become=false -D