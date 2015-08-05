# Cloudant

Create database beta with 2 replicas and 32 partitions

```
curl https://account.cloudant.com/beta?n=2&q=32 -X PUT
```

Get info about 1 or all databases 

```
curl https://account.cloudant.com/beta
curl https://account.cloudant.com/_all_dbs
```

Get documents

```
curl https://account.cloudant.com/beta/_all_docs?descending=a&endkey=b&include_docs=c&inclusive_end=d&key=e&limit=f&skip=g&startkey=h
```

Get changes

```
curl https://account.cloudant.com/beta/_changes?descending=a&feed=b&filter=c&heartbeat=d&include_docs=e&limit since=f&style=g&timeout=h
```

Delete database

```
curl https://account.cloudant.com/beta -X DELETE
```
