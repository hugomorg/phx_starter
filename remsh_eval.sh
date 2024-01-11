#!/bin/bash

set -euo pipefail

cd ansible

ansible-playbook -u hugo -v playbooks/eval.yml -D --extra-vars "cmd=$1"