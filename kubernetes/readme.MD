# Pod Management
## Delete all pod from a subsets
Delete all pod istances with `log-collector` in the name
```shell
kubectl get pod | grep log-collector | awk '{print $1}' | while read line ; do oc delete pod $line ; done
```
