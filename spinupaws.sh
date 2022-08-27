# AWS cluster creation

eksctl create cluster \
  --version 1.23 \
  --region ap-south-1 \
  --node-type t2.micro \
  --nodes 3 \
  --nodes-min 1 \
  --nodes-max 4 \
  --name my-demo-123
