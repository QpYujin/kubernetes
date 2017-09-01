#! /bin/bash

export AWS_ACCESS_KEY_ID=$1
export AWS_SECRET_ACCESS_KEY=$2 

aws s3api create-bucket --bucket yujin-state-store --region us-east-1
aws s3api put-bucket-versioning --bucket yujin-state-store  --versioning-configuration Status=Enabled

export NAME=deploybytes.com
export KOPS_STATE_STORE=s3://yujin-state-store

kops create cluster --zones us-east-1a --master-size t2.medium $NAME
kops update cluster $NAME --yes
