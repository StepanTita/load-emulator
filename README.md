# Home task 2, Stepan Tytarenko
## IMPORTANT
###*Make sure your kubernetes-version=v1.15.0, or at least you have it installed (if not, I cannot guarantee success), because I have this version, and not sure how it works on different ones###

Use minikube to run the load-emulator

How to start

```bash
$ ./run.sh
```

It will run previously built, local docker container, with simple flask application
- starts minikube
- builds docker container
- runs the minikube from config: load-emulator.k8s.yaml
- autoscale from 1 to 3 pods
- exposes the port 5000
- runs the service, and automatically opens it in browser

_After the last command, you will get the ip address to access the page_
Example: http://172.17.0.2:30891 - basePath

## Endpoints:
{{basePath}}/ - basic page (returns "Hello, World" message)
{{basePath}}/health - page used to health check (returns "health" message)
{{basePath}}/ready - page used to ready check (returns "ready" message)
{{basePath}}/fibo/{int:n} - page used to calculate _n_ th Fibonacci number

How to break your PC (joke):

```bash
$ ./break-your-pc.sh n basePath
```

- Runs n parallel requests to fibo/100

(all 8 parts of the task are fulfilled)