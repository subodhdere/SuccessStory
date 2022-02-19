# SuccessStory

# Commands :

* kubectl api-resources

* kubectl create -f <file_name>.yaml
* kubectl apply -f <file_name>.yaml
* kubectl apply -f ./my1.yaml -f ./my2.yaml

## Node

* kubectl get nodes
* kubectl describe node <nodename>
* kubectl get nodes -o wide  

## Pod

* kubectl get pods
* kubectl get pods --show-labels
* kubectl get pods -o wide
* kubectl describe pod <pod_name>

## Service
  
* kubectl get svc
* kubectl describe svc <service_name>
* minikube service <service_name> --url

## Deployment

* kubectl apply -f deployment_definition.yml
* kubectl apply -f deployment_definition.yml --record=true
* kubectl get deployment
* kubectl describe deployment <deployment_name>
* kubectl edit deployment <deployment_name>
* kubectl delete deployment <deployment_name>
* kubectl rollout status deployment <deployment_name>
* kubectl rollout history deployment <deployment_name>
* kubectl rollout undo deployment <deployment_name>
* kubectl rollout undo deployment <deployment_name> --to-revision=<revision_number>
* kubectl autoscale deployment <deployment_name> --cpu-percent=50 --min=1 --max=10
* kubectl get hpa
* command to generate load : kubectl run -i --tty load-generator --rm --image=busybox --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://php-apache; done"

## ConfigMap
* kubectl create cm <cm_name> --from-literal=city=pulgaon
* kubectl create cm <cm_name> --from-file=<file_name>
* kubectl create cm <cm_name> --from-file=<file_name> --from-file=<file_name>
* kubectl create cm <cm_name> --from-file=<dir_name>
* kubectl create cm <cm_name> --from-env-file=<file_name>
* kubectl create cm <cm_name> --from-literal=city=pulgaon --dry-run=client -o yaml
* kubectl get cm
* kubectl describe cm <cm_name>
* kubectl edit cm <cm_name>  
  
## Secrets
* kubectl create secret generic <secret_name> --from-literal=city=pulgaon
* kubectl create secret generic <secret_name> --from-file=<file_name>
* kubectl create secret generic <secret_name> --from-file=<file_name> --from-file=<file_name>
* kubectl create secret generic <secret_name> --from-file=<dir_name>
* kubectl create secret generic <secret_name> --from-env-file=<file_name>
* kubectl create secret generic <secret_name> --from-literal=city=pulgaon --dry-run=client -o yaml
* kubectl get secret
* kubectl describe secret <secret_name>
* kubectl edit secret <secret_name>  
  
## ResourceQuota
* kubectl describe quota -n <namespace_name>
* kubectl describe quota <ResourceQuota_name>
* kubectl describe quota <ResourceQuota_name> -n <namespace_name>
* kubectl delete quota <ResourceQuota_name> -n <namespace_name>
  
## LimitRange
* kubectl describe lr -n <namespace_name>
* kubectl describe lr <lr_name>
* kubectl describe lr <lr_name> -n <namespace_name>
* kubectl delete lr <lr_name> -n <namespace_name>

  
  
  
  
  
  
  
  
  
