## make sure linkerd is present
which linkerd
## setup your namespace variable
namespace='my-deployment-namespace'
## uniject all deployments/pods
kubectl -n $namespace get deploy -o yaml | linkerd uninject - | kubectl apply -f -
## uninstall service mesh
linkerd uninstall | kubectl delete -f -
