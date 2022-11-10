#!/usr/bin/env zsh

ansible-playbook site.yaml --extra-vars=@./vars/rhlab-vars.yaml \
--extra-vars=custom_route=vars/_wildcard_apps_ocp001_rhlab_ch_route.yaml \
--vault-id @prompt $@
