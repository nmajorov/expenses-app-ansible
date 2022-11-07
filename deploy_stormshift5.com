#!/usr/bin/env zsh

ansible-playbook site.yaml --extra-vars "wildcard_domain=apps.ocp5.stormshift.coe.muc.redhat.com" $@
