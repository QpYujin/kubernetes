#! /bin/bash

#Install dashboard
kubectl create -f https://raw.githubusercontent.com/kubernetes/kops/master/addons/kubernetes-dashboard/v1.6.0.yaml

#Install heapster (for future use)
kubectl create -f https://raw.githubusercontent.com/kubernetes/kops/master/addons/monitoring-standalone/v1.6.0.yaml

#Install route53 mapper (This will be changed in the future to external dns)
kubectl create -f https://raw.githubusercontent.com/QpYujin/k8s-addon/master/v1.3.0.yml

#Runs helm, a kubernetes addons manager
helm init
sleep 10s
#Installs consul
helm install --name my-consul --set DisableHostNodeId=true,ui.enabled=true,uiService.enabled=true,uiService.type=LoadBalancer,Replicas=1 stable/consul --version 0.3.0
#Install config for consul-register
kubectl create -f https://raw.githubusercontent.com/QpYujin/k8s-addon/master/config.yaml
sleep 5s
#Install kube-consul-register
kubectl create -f https://raw.githubusercontent.com/QpYujin/k8s-addon/master/rs.yaml

#Install elasticsearch
#kubectl create -f https://raw.githubusercontent.com/QpYujin/k8s-addon/master/es-controller.yaml
#kubectl create -f https://raw.githubusercontent.com/QpYujin/k8s-addon/master/es-service.yaml
sleep 5s

#Install Kibana (This needs to be updated)
#kubectl create -f https://raw.githubusercontent.com/QpYujin/k8s-addon/master/kibana-controller.yaml
#kubectl create -f https://raw.githubusercontent.com/QpYujin/k8s-addon/master/kibana-service.yaml
sleep 5s

#Install fluentd as daemonset
#kubectl create -f https://raw.githubusercontent.com/QpYujin/k8s-addon/master/fluentd-daemonset-elasticsearch.yaml
#kubectl create -f https://raw.githubusercontent.com/QpYujin/k8s-addon/master/fluentd-service.yaml

