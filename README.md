# ArcGIS DataStore on Docker

```sh
docker run --tty --interactive --hostname agdatastore.local \
  --name agdatastore \
  --publish 2443:2443 \
  beginor/agdatastore:10.6.1
```
