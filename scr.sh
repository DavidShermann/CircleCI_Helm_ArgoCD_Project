#!/bin/bash
aws eks update-kubeconfig --region us-east-1 --name my-cluster

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl port-forward svc/argocd-server -n argocd 8080:443 &

argocd admin initial-password -n argocd
