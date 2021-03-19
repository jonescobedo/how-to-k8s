#install cert-manager plugin
$ curl -L -o kubectl-cert-manager.tar.gz https://github.com/jetstack/cert-manager/releases/download/v1.1.0/kubectl-cert_manager-linux-amd64.tar.gz
$ tar xzf kubectl-cert-manager.tar.gz
$ sudo mv kubectl-cert_manager /usr/local/bin
# change to target k8s context
cluster_name='my-k8s-context-name'
kubectl config use-context $cluster_name
# pull existing certificate secret into variable
cert_name='tls-secret'
secret_name=$(kubectl get certificate -A | grep $cert_name | awk '{print $4}')
# trigger manual update
kubectl cert-manager renew $secret_name
