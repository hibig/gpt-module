
# Module `module`

Provider Requirements:
* **kubernetes:** (any version)

## Input Variables
* `app_name` (required)
* `image` (required)
* `port` (default `80`)
* `replicas` (default `1`)

## Managed Resources
* `kubernetes_deployment.app` from `kubernetes`

