[![CircleCI](https://circleci.com/gh/giantswarm/efk-logging-app.svg?style=shield)](https://circleci.com/gh/giantswarm/efk-logging-app)

# This application is deprecated, please use https://github.com/giantswarm/opendistro-app

# EFK-logging-app chart

Giant Swarm offers a EFK logging Managed App which can be installed in tenant clusters.
Here we define the EFK logging chart with its templates and default configuration.

# Documentation
FluentD is configured to ignore the following namespaces:
- default
- efk
- giantswarm
- kube-node-lease
- kube-system
- kube-public

Curator will delete Elasticsearch indices older than 3 days by default.

If you wish to ignore the logs created by this stack, deploy in efk namespace.

# Sample Values File
```
elasticsearch:
  replicas: 3

  resources:
    requests:
      cpu: "1000m"
      memory: "8Gi"
    limits:
      cpu: "4000m"
      memory: "12Gi"

  volumeClaimTemplate:
    resources:
      requests:
        storage: 30Gi

kibana:
  ingress:
    enabled: true
    hosts:
        - kibana.cluster.g8s
```

## Credit

* [Elasticsearch](https://github.com/elastic/helm-charts/tree/master/elasticsearch)
* [FluentD](https://github.com/helm/charts/tree/master/stable/fluentd-elasticsearch)
* [Kibana](https://github.com/elastic/helm-charts/tree/master/kibana)
* [Elasticsearch Curator](https://github.com/helm/charts/tree/master/stable/elasticsearch-curator)
* [Elasticsearch Exporter](https://github.com/helm/charts/tree/master/stable/elasticsearch-exporter)
