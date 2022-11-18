#!/usr/bin/env zsh

ansible-playbook site.yaml --extra-vars=@./vars/rhlab-vars.yaml \
--extra-vars=custom_route=vars/_wildcard_apps_ocp001_rhlab_ch_route.yaml \
-e app_frontend_git_revision="exchange" -e app_namespace="nm-demo02" \
-e backend_url="https://expenses-backend-quarkus-nm-demo.apps.ocp001.rhlab.ch" \
-e sso_client_id="app-react-2" \
--vault-id @prompt  --tags web
