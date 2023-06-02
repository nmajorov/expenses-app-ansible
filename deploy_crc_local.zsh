#!/usr/bin/env zsh

ansible-playbook site.yaml --extra-vars "wildcard_domain=apps-crc.testing" $@

