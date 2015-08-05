# Cloudant

## Databases

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

## Documents

Create document

```
curl https://account.cloudant.com/beta -X POST -H "Content-Type: application/json" -d '{"name":"bob", "age":20}'
```

Get document

```
curl https://account.cloudant.com/beta/da423f838b486a098d9b98e027bed195 -X
```

Update document

```
curl https://account.cloudant.com/beta/da423f838b486a098d9b98e027bed195 -X PUT -H "Content-Type: application/json" -d '{"_rev": ______, "name":"bob", "age":20}'
```
