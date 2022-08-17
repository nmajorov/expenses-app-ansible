#!/usr/bin/env zsh
#test task to deploy postgresql 

DIRNAME=`dirname "$0"`
CURRENT_NAMESPACE="$(kubectl config view --minify --output jsonpath={..namespace})"
BRANCH="$1"

# usage test_postgres <BRANCH_NAME>


install_task_deploy_postgresql(){

  echo "step install_task_deploy_postgresql"
  echo "current local dir $DIRNAME"
  echo "current kubernetes ns $CURRENT_NAMESPACE"
  echo
  if tkn t list | grep -q deploy-postgresql 
  then
    echo "found task installed"
    echo "... delete it first"
    tkn t delete deploy-postgresql -f
    echo
  fi

    kubectl  apply -f $DIRNAME/tasks/task-deploy-postgresql.yaml

  echo
}


deploy_pvc(){

  echo "step deploy pvc"
  echo "current local dir $DIRNAME"
  echo "current kubernetes  $(kubectl config view --minify | grep namespace:)"
  echo

  if kubectl get pvc  | grep -q source-pvc
  then
      echo "found pvc"
      echo "... skip steps"
  else
      echo "start to create pvc"
      kubectl apply -f $DIRNAME/resources/pvc-workspace.yaml 
      echo
  fi
  echo

}


clone_directory(){

  echo "step checkout git "
  if [ -z "$BRANCH" ]
  then
     BRANCH="main"
  fi
  echo
  echo "using BRANCH: $BRANCH"
  echo

  tkn clustertask start git-clone \
  --workspace=name=output,claimName=source-pvc\
  --param=url=https://github.com/nmajorov/expense-app-backend-quarkus.git \
  --param=refspec="" \
  --param=revision=$BRANCH \
  --param=submodules=true \
  --param=depth=1 \
  --param=sslVerify=true \
  --param=verbose=true \
  --param=deleteExisting=true \
  --showlog \
  --use-param-defaults

}



run_postgresql_install(){

  echo "step run postgresql install"
  echo
  echo "using NAMESPACE: $CURRENT_NAMESPACE"
  echo

  #--serviceaccount ansible-deployer-account \

  tkn task start deploy-postgresql \
  \
  --workspace=name=output,claimName=source-pvc \
  --showlog \
  --use-param-defaults

}


#deploy_kubeconfig_configmap

install_task_deploy_postgresql
deploy_pvc
clone_directory
run_postgresql_install
