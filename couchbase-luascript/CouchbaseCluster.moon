CouchbaseBucket = require "couchbase-luascript.CouchbaseBucket"
class CouchbaseCluster
  _dsn: ''

  new: (dsn = 'http://127.0.0.1', username = '', password = '') =>
    @_dsn = dsn
    return @

  get_dsn: =>
    return @_dsn

  open_bucket: (name = 'default', password = '') =>
    bucketDsn = @_dsn
    return CouchbaseBucket(bucketDsn, name, password)
