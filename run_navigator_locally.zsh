#!/usr/bin/env zsh
SCRIPT_PATH=${0:a}
ansible-navigator  run -v   site.yaml -m stdout --eev $HOME/.kube:/home/runner/.kube \
     \
    --senv KUBECONFIG="/home/runner/.kube/config"
