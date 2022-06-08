#!/usr/bin/env zsh
#
ansible-navigator  run -v   sso_operator_install.yaml -m stdout --eev $HOME/.kube:/home/runner/.kube --senv KUBECONFIG="/home/runner/.kube/config"
