Monitor Kubernetes apps with Splunk - Part 2 : logging
=========================================================

Update values for logging
-------------------------

``` YAML
buffer:
  "@type": memory
  total_limit_size: 8000m
  chunk_limit_size: 500m
  chunk_limit_records: 100000000
  flush_at_shutdown: true
  flush_interval: 5s
  flush_thread_count: 10
  overflow_action: block
  retry_max_times: 3
  retry_wait: 60
```

Generate yaml files
```bash
 helm template --values ./values.yaml \
  -n ${folder_name} \
  --output-dir ${outputDir} ./
```


Verify on Splunk
----------------
