# Ansible playbooks to deploy expense-app

Expense app demonstrate tekton cd/ci , quarkus backend, react-js front-end and RedHat SSO technology.

Using ansible it's deploy

1. Deploy OpenShift pipeline operator if not installed.
2. RedHat SSO operator
3. Provision Database
4. Deploy tekton pipelines
5. Deploy backend with tekton pipeline and start it.
6. Deploy react-js web-ui with tekton  pipeline and start it
