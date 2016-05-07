#!/bin/bash
#
# Primary project
# 
# The primary project is the 'containing' project that holds our main Ansible playbook(s)
# as well as our Ansilbe roles directory.
#
# Example:
#
# so, if:
#
#   ~/projects/my_ansible_project
#
# is our primary ansible project then our ansible roles would be here:
#
#   ~/projects/my_ansible_project/roles/one_of_my_ansible_roles

set -e

# Change as required

PROJECTS_DIRECTORY="${HOME}/projects"

PRIMARY_ANSIBLE_PROJECT_NAME=maestro
PRIMARY_GIT_USER=cjsteel
PRIMARY_GIT_ACCOUNT_URL="git@github.com:${PRIMARY_GIT_USER}"

# ensure for project directory

mkdir -p $PROJECTS_DIRECTORY
cd $PROJECTS_DIRECTORY

# check for previous install

if [ -e "$PROJECTS_DIRECTORY/${PRIMARY_ANSIBLE_PROJECT_NAME}" ]; then
    echo "Found existing $PROJECTS_DIRECTORY/${PRIMARY_ANSIBLE_PROJECT_NAME}"
    echo
    echo "Looks like the ${PRIMARY_ANSIBLE_PROJECT_NAME} project is already installed. Bye."
    exit 1
fi

# clone ansible-${PRIMARY_ANSIBLE_PROJECT_NAME} project
#
# need to rename github project "ansible-maestro"
git clone ${PRIMARY_GIT_ACCOUNT_URL}/ansible-${PRIMARY_ANSIBLE_PROJECT_NAME}.git ${PRIMARY_ANSIBLE_PROJECT_NAME}
#git clone ${PRIMARY_GIT_ACCOUNT_URL}/${PRIMARY_ANSIBLE_PROJECT_NAME}.git ${PRIMARY_ANSIBLE_PROJECT_NAME}


# Clone Primary Accounts Ansible roles

mkdir $PROJECTS_DIRECTORY/${PRIMARY_ANSIBLE_PROJECT_NAME}/roles
cd $PROJECTS_DIRECTORY/${PRIMARY_ANSIBLE_PROJECT_NAME}/roles

# git clone ${PRIMARY_GIT_ACCOUNT_URL}/ansible-role-ace.git ace
git clone ${PRIMARY_GIT_ACCOUNT_URL}/ansible-role-vagrant.git vagrant
git clone ${PRIMARY_GIT_ACCOUNT_URL}/ansible-role-virtualbox.git virtualbox
git clone ${PRIMARY_GIT_ACCOUNT_URL}/ansible-role-iso.git iso
git clone ${PRIMARY_GIT_ACCOUNT_URL}/ansible-cobbler.git cobbler

# Clone Secondary Accounts Ansible roles
#
# to do

# Done, you may want to set up mr now
echo
echo "Done ${PRIMARY_ANSIBLE_PROJECT_NAME} project setup!"
echo
