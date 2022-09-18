Monitor Kubernetes apps with Splunk - Part 2 : logging
=======================================================

Prerequisites
--------------

Download the lastest Helm package from [Splunk-connect-for-kubernetes](https://github.com/splunk/splunk-connect-for-kubernetes).



Update values.yaml for logging
-----------------------------

The minimal value example:

```YAML
splunk:
  hec:
    host: < splunk_host >
    port: 8088
    token: < splunk_hec_logging_token >
    indexName: < splunk_logging_indexname >
```

**Optional:** Customize buffer setting

``` YAML
buffer:
  "@type": memory
  total_limit_size: 2000m
  chunk_limit_size: 500m
  chunk_limit_records: 100000
  flush_at_shutdown: true
  flush_interval: 5s
  flush_thread_count: 10
  overflow_action: block
  retry_max_times: 3
  retry_wait: 60
```

**Optional:** Customize filter setting
```YAML
customFilters:
  SetNamespaceFilter:
    tag: "**"
    type: grep
    body: |
        <exclude>
                  key namespace
                  pattern /(kube-system)/
                </exclude>
                <exclude>
                  key sourcetype
                  pattern /(fluentd:monitor-agent|kube:container:calico-node)/
                </exclude>
```

Deplopy to Kubernetes Cluster
--------------------------------

You can deploy to kubernetes cluster via helm directly.
Or generate kubernetes yaml files via helm template command and then deploy via kubectl.

```bash
helm template --name-template=k8s --namespace splunk-connect --output-dir ${output_folder} splunk-kubernetes-logging/

kubectl apply -f ${output_folder}/splunk-kubernetes-logging/templates/
```


Verify on Splunk
----------------

```
index="k8s_<ENV>_logging"
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE1NTI4NjAzNDJdfQ==
-->