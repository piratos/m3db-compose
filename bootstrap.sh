#! /bin/bash
set -e
[ -z $1 ] && (echo "Usage: ./bootstrap.sh <coordinator_ip>"; exit 1)
curl -X POST http://$1:7201/api/v1/database/create -d '{
  "type": "cluster",
  "namespaceName": "test",
  "retentionTime": "168h",
  "numShards": "64",
  "replicationFactor": "3",
  "hosts": [
        {
            "id": "node01",
            "isolationGroup": "group1",
            "zone": "embedded",
            "weight": 100,
            "address": "node01",
            "port": 9000
        },
        {
            "id": "node02",
            "isolationGroup": "group2",
            "zone": "embedded",
            "weight": 100,
            "address": "node02",
            "port": 9000
        },
        {
            "id": "node3",
            "isolationGroup": "group3",
            "zone": "embedded",
            "weight": 100,
            "address": "node03",
            "port": 9000
        }
    ]
}'
