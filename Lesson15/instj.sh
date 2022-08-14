#!/bin/bash

wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum -y upgrade
# Add required dependencies for the jenkins package
yum -y install java-11-openjdk
yum -y install jenkins
systemctl daemon-reload