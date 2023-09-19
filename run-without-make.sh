#!/bin/bash -e

echo "Simulate Pipeline"

echo "make format"
# make format
terraform fmt -recursive -diff -no-color

echo "make lint"
# make lint
# yamllint -f auto .

echo "make tflint"
# make tflint
terraform fmt -check -recursive -diff -no-color

echo "make init-all"
# make init-all
terraform init -no-color

echo "make validate"
# make validate
terraform validate -no-color

echo "make clean"
# make clean

echo "make docs"
# make docs

echo "make tfsec"
# make tfsec
# tfsec ./

echo "make plan-all"
# make plan-all
terraform plan -no-color

echo "pre-commit run -a"
# pre-commit run -a
