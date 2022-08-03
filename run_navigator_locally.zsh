#!/usr/bin/env zsh
#
ansible-navigator  run -v   site.yaml -m stdout --eev $HOME/.kube:/home/runner/.kube --senv KUBECONFIG="/home/runner/.kube/config"
