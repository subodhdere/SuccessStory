# SuccessStory

# Commands :

* kubectl api-resources

* kubectl create -f <file_name>.yaml
* kubectl apply -f <file_name>.yaml
* kubectl apply -f ./my1.yaml -f ./my2.yaml
* kubeadm token create --print-join-command    => to join worker node to master node

## Node

* kubectl get nodes
* kubectl describe node <nodename>
* kubectl get nodes -o wide  

## Pod

* kubectl get pods
* kubectl get pods --show-labels
* kubectl get pods -o wide
* kubectl describe pod <pod_name>
* kubectl delete pod --all

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
* aws ecr get-login OR docker login -u username -p password
* kubectl create secret docker-registry regcred --docker-server=https://index.docker.io/v1/ --docker-username=subodhdere77 --docker-password=****** --docker-email=subodhdere77@gmail.com
  
## ResourceQuota
* kubectl get quota -n <namespace_name>
* kubectl describe quota <ResourceQuota_name>
* kubectl describe quota <ResourceQuota_name> -n <namespace_name>
* kubectl delete quota <ResourceQuota_name> -n <namespace_name>
  
## LimitRange
* kubectl describe limits -n <namespace_name>
* kubectl describe limits <LimitRange_name>
* kubectl describe limits <LimitRange_name> -n <namespace_name>
* kubectl delete limits <LimitRange_name> -n <namespace_name>

## Namespace
* kubectl get ns
* kubectl describe ns <ns_name>
* kubectl config set-context --current --namespace=sd
* curl servicename.nsname.svc.cluster.local  => access service from different ns  

## ServiceAccount
* kubectl get sa
* kubectl describe sa <sa_name>
* curl -v --cacert /var/run/secrets/kubernetes.io/serviceaccount/ca.crt -H "Authorization: Bearer $token" https://10.43.0.1:443/api/v1/namespaces/default/pods/nginx
* secret location : /var/run/secrets/kubernetes.io/serviceaccount

## Role
* kubectl auth can-i delete pod -n test --as system:serviceaccount:default:default
* kubectl create role roledel -n test --verb delete --resource pod
* kubectl get role
* kubectl describe role <role_name>
* kubectl delete role <role_name>
* kubectl create rolebinding rb1 -n test --role roledel --serviceaccount default:default  
* kubectl get rolebinding
* kubectl describe rolebinding <rolebinding_name>
* kubectl delete rolebinding <rolebinding_name>
* kubectl create clusterrole cr1 --verb delete --resource pod
* kubectl create clusterrolebinding crb1 --clusterrole cr1 --serviceaccount default:default
  
## Config
* openssl genrsa -out santosh.key 2048
* openssl req -new -key santosh.key -out santosh.csr -subj "/CN=santosh/O=devops"
* scp root@kmaster:/etc/kubernetes/pki/ca.{crt,key} .
* openssl x509 -req -in santosh.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out santosh.crt -days 365
* kubectl --kubeconfig santosh.kubeconfig config set-cluster kubernetes --server https://172.16.16.100:6443 --certificate-authority=ca.crt
* kubectl --kubeconfig santosh.kubeconfig config set-credentials santosh --client-certificate santosh.crt --client-key santosh.key
* kubectl --kubeconfig santosh.kubeconfig config set-context santosh-kubernetes --namespace test --user santosh --cluster kubernetes
* kubectl config use-context john-kubernetes --kubeconfig santosh.kubeconfig

## Scheduling
* kubectl taint node minikube subodh=dere:NoSchedule|PreferNoSchedule|NoExecute
* kubectl taint node minikube subodh=dere:NoSchedule-

## Job / Cronjob
* kubectl create job job1 --image nginx
* kubectl get job
* kubectl describe job <job_name>
* kubectl delete job <job_name>
* kubectl get cj
* kubectl describe cj <cj_name>
* kubectl delete cj <cj_name>
  
