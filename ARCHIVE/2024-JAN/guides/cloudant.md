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
curl https://account.cloudant.com/beta/da423f838b486a098d9b98e027bed195 -X PUT -H "Content-Type: application/json" -d '{"_rev": ___, "name":"bob", "age":20}'
```

Delete document

```
curl https://account.cloudant.com/beta/da423f838b486a098d9b98e027bed195?rev=___ -X DELETE -H
```

## Attachments

Base 64 encode a file, no wrap
```
base64 small.jpg -w 0
```

Create a JSON doc called my-data.json

```js
{
  "name": "sally",
  "age": 3,
  "_attachments":{
    "small.jpg":{
    "content_type":"image/jpeg",
    "data": "/9j/4AAQSkZJRgABAQ3JJPQc84eE8paThL//2Q=="
    }
  }
}
```

Create a new document with attached file

```
curl https://account.cloudant.com/beta -X POST -H "Content-Type: application/json" -d @my-data.json
```

Upload a new attachment on an existing document

```
curl https://account.cloudant.com/beta/doc_id/attachment_name?rev=___ -X PUT -H "Content-Type: image/jpeg" --data-binary @my-file.jpg 
```

## API

### Database API

- https://github.com/dscape/nano/blob/master/lib/nano.js
- https://github.com/cloudant/nodejs-cloudant/blob/master/cloudant.js

```js
cloudant {
  config:
    { url: '',
      requestDefaults: { headers: [Object], gzip: true },
      log: { [Function: disabled] enabled: false, namespace: 'nano' } 
    },
  db:
   { create: [Function: createDb],
     get: [Function: getDb],
     destroy: [Function: destroyDb],
     list: [Function: listDbs],
     use: [Function],
     scope: [Function: docModule],
     compact: [Function: compactDb],
     replicate: [Function: replicateDb],
     changes: [Function: changesDb],
     follow: [Function: followDb],
     followUpdates: [Function: followUpdates],
     updates: [Function: updates]
    },
  use: [Function],
  scope: [Function: docModule],
  request: [Function: relax],
  relax: [Function: relax],
  dinosaur: [Function: relax],
  auth: [Function: auth],
  session: [Function: session],
  updates: [Function: updates],
  followUpdates: [Function: followUpdates],
  _use: [Function: docModule],
  ping: [Function: ping],
  get_cors: [Function],
  set_cors: [Function],
  set_permissions: [Function],
  generate_api_key: [Function],
  get_virtual_hosts: [Function],
  add_virtual_host: [Function],
  delete_virtual_host: [Function]
}
```

### Document API

```js
{ info: [Function],
  replicate: [Function],
  compact: [Function],
  changes: [Function],
  follow: [Function],
  auth: [Function: auth],
  session: [Function: session],
  insert: [Function: insertDoc],
  get: [Function: getDoc],
  head: [Function: headDoc],
  copy: [Function: copyDoc],
  destroy: [Function: destroyDoc],
  bulk: [Function: bulksDoc],
  list: [Function: listDoc],
  fetch: [Function: fetchDocs],
  fetchRevs: [Function: fetchRevs],
  config:
   { url: '',
     db: 'superdb' },
  multipart:
   { insert: [Function: insertMultipart],
     get: [Function: getMultipart] },
  attachment:
   { insert: [Function: insertAtt],
     get: [Function: getAtt],
     destroy: [Function: destroyAtt] },
  show: [Function: showDoc],
  atomic: [Function: updateWithHandler],
  updateWithHandler: [Function: updateWithHandler],
  search: [Function: viewSearch],
  spatial: [Function: viewSpatial],
  view: { [Function: viewDocs] compact: [Function] },
  viewWithList: [Function: viewWithList],
  get_security: [Function],
  set_security: [Function],
  index: { [Function] del: [Function] },
  find: [Function] 
}
```
