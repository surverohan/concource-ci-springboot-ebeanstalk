#!/bin/sh

set -e

if [ ! -z ${DEBUG_MODE} ]
then
  if [ ${DEBUG_MODE} = "true" ]
  then
    echo "DEBUG MODE"
    set -x
  fi
fi

RED='\033[0;31m'



# "Building" terraform
export TF_IN_AUTOMATION="true"
errors=0

    echo "****************** BUILDING $env ******************"
	echo " pwd -" 
	pwd
	ls
	cd  ci-pipeline/tasks/terraform
		echo " pwd -"
	pwd
	ls
  ## CP -R ci-pipeline/tasks/terraform .
  ##  cd terraform-plan-out/dev

    echo "BUILDING $env: terraform init"
    terraform init
    echo "BUILDING $env: terraform plan"
	terraform plan
	echo "BUILDING $env: terraform plan done ....."

    echo "BUILDING $env: terraform apply"
	terraform apply -auto-approve
	echo "BUILDING $env: terraform apply done ....."

    ## touch tfplan.txt
    ## set +e
    ## terraform apply > tfplan.txt
    ## planexit=$?
    ## set -e