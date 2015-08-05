CouchbaseBucket = require "couchbase-lua.CouchbaseBucket"
class CouchbaseCluster
  _dsn: ''

  new: (dsn = 'http://127.0.0.1', username = '', password = '') =>
    @_dsn = dsn
    return @

  open_bucket: (name = 'default', password = '') =>
    bucketDsn = @_dsn
    return CouchbaseBucket(bucketDsn, name, password)
