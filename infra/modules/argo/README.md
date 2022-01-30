# ArgoCdN

This will perform ProArgoCDN installation installation

Fisrt admin password login

``` bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```


