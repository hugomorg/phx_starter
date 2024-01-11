#!/bin/bash

set -euo pipefail

cd ansible

ansible-playbook -u hugo -v playbooks/setup-https.yml -D
