# Monitoring shards allocation
The Compact and aligned text (CAT) APIs allocation query (https://www.elastic.co/guide/en/elasticsearch/reference/current/cat-allocation.html) can be used to verify the shards allocation
```bash
oc exec elasticsearch-cdm-x5yvd5zn-2-679799c6fc-fm4k2 -c elasticsearch -- es_util --query="_cat/allocation?format=yaml" -XGET
```
The output, see below, shows:
- **shards**, the number of active shard
- **disk.indices**, the size of the indexes
- **disk.used**, used storage as per OS
- **disk.avail**, available storage as per OS
- **disk.total**, total storage as per OS
- **disk.percent**, used/total storage 
- **host**, node hostname
- **ip**, node ip
- **node**, node name
Unallocated shards are marked as `UNASSIGNED`.

```yaml
---
- shards: "125"
  disk.indices: "337.1gb"
  disk.used: "341.4gb"
  disk.avail: "1.5tb"
  disk.total: "1.9tb"
  disk.percent: "17"
  host: "10.131.1.211"
  ip: "10.131.1.211"
  node: "elasticsearch-cdm-x5yvd5zn-3"
- shards: "121"
  disk.indices: "358.1gb"
  disk.used: "362.3gb"
  disk.avail: "1.5tb"
  disk.total: "1.9tb"
  disk.percent: "18"
  host: "10.131.0.31"
  ip: "10.131.0.31"
  node: "elasticsearch-cdm-x5yvd5zn-2"
- shards: "27"
  disk.indices: "21.7gb"
  disk.used: "23.2gb"
  disk.avail: "1.8tb"
  disk.total: "1.9tb"
  disk.percent: "1"
  host: "10.129.2.56"
  ip: "10.129.2.56"
  node: "elasticsearch-cdm-x5yvd5zn-1"
- shards: "97"
  disk.indices: null
  disk.used: null
  disk.avail: null
  disk.total: null
  disk.percent: null
  host: null
  ip: null
  node: "UNASSIGNED"
```

# Change recovery bandwith limitation
```bash
oc exec elasticsearch-cdm-x5yvd5zn-2-679799c6fc-fm4k2 -c elasticsearch -- es_util --query="_cluster/settings" -XPUT -d '{ "persistent": { "indices.recovery.max_bytes_per_sec" : "120mb" } }'
```