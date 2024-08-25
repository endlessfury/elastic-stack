# elastic-stack install steps
- Install ECK operator 2.8 (or other)
```
helm repo add elastic https://helm.elastic.com
helm repo update
helm install elastic-operator elastic/eck-operator -n elastic-system --create-namespace --version 2.8
```
- Deploy Elasticsearch 7.10.0 (or other)
```
apiVersion: elasticsearch.k8s.elastic.co/v1
kind: Elasticsearch
metadata:
  name: quickstart-7
spec:
  version: 7.10.0
  nodeSets:
  - name: default
    count: 1
    config:
      node.store.allow_mmap: false
```
- Deploy Kibana 7.10.0 (or other)
```
apiVersion: kibana.k8s.elastic.co/v1
kind: Kibana
metadata:
  name: quickstart-7
spec:
  version: 7.10.0
  count: 1
  elasticsearchRef:
    name: quickstart-7
```
- Deploy fluent-bit as forwarder with proper values
```
helm repo add fluent https://fluent.github.io/helm-charts
helm install fluent-bit -n elastic-system fluent/fluent-bit -f values-fluentbit.yaml
```
- Deploy fluentd as aggregator
```
helm install my-release oci://registry-1.docker.io/bitnamicharts/fluentd --version 6.5.12 -f values-fluentd.yaml
```
