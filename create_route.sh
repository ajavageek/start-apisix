#!/bin/sh
docker run --network start-apisix_default --rm curlimages/curl:7.81.0 -v -i http://apisix:9080/apisix/admin/routes -H 'X-API-KEY: edd1c9f034335f136f87ad84b625c8f1' -X POST -d '
{
  "name": "Route to httpbin",
  "uris": ["/*"],
  "upstream": {
    "type": "roundrobin",
    "nodes": {
      "httpbin.org": 1
    }
  }
}'