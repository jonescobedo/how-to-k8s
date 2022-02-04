
## variables
containerName='microservice1-api'
namespace='my-deployment-namespace'

kubectl -n $namespace exec -it $(kubectl get pods -n $namespace | grep $containerName | awk '{print $1}') -c $containerName -- /bin/bash