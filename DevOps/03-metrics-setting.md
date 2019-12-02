Monitor Kubernetes apps with Splunk - Part 3 : Metrics
========================================================


### Filter Metrics

Please refer [metrics-information](https://github.com/splunk/fluent-plugin-kubernetes-metrics/blob/develop/metrics-information.md) for all supported metrics

It is recommand to customize the fluentd setting to collect minimal metrics that are required for monitoing.

Update the configMap in the splunk-kubernetes-metrics templates folder.

Add following filter before the `<match kube.**>` block.

```xml
<filter kube.container.**>
    @type grep
    <regexp>
    key metric_name
    pattern /(cpu.usage_rate|cpu.limit|memory.usage|memory.limit)/
    </regexp>
</filter>
<filter kube.pod.**>
    @type grep
    <regexp>
    key metric_name
    pattern /(cpu.load.average.10s|cpu.usage_rate|cpu.limit|memory.usage|memory.limit|memory.available_bytes|volume.available_bytes|volume.used_bytes)/
    </regexp>
</filter>
<filter kube.namespace.**>
    @type grep
    <regexp>
    key metric_name
    pattern /(usage|limit)/
    </regexp>
</filter>
<filter kube.node.**>
    @type grep
    <regexp>
    key metric_name
    pattern /(network.rx_bytes|network.tx_bytes|network.rx_errors|network.tx_errors|cpu.usage_rate|memory.usage|memory.capacity|memory.available_bytes)/
    </regexp>
</filter>

```



Verify on Splunk
----------------

Following splunk search can be used to check the supported dimensions of a metric:

| mcatalog values(_dims) WHERE indexk8s* AND metric_name="kube.pod.cpu.usage_rate"
