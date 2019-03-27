#!/bin/bash

echo "This tool will setup helm on a kubernetes cluster."
echo "It expects that you have your cluster up and running and"
echo "helm installed on your local computer."
echo

echo "Creating service account"
kubectl create ns helm-system
kubectl -n helm-system create serviceaccount tiller
kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount helm-system:tiller
echo

echo "Installing tiller"
helm init --service-account tiller --tiller-namespace helm-system
echo

echo "Done"