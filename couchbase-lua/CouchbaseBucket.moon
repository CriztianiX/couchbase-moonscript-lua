CouchbaseViewRequest = require "couchbase-lua.CouchbaseViewRequest"

class CouchbaseBucket
  dsn: ''
  name: ''
  password: ''

  new: (dsnStr, name, password) =>
    @dsn = dsnStr
    @name = name
    @password = password

  query: (query) =>
    @_view(query)

  _view: (query_obj) =>
    path =  @dsn .. ":8092" .. "/" .. @name ..  query_obj\to_string!
    couchbaseViewReq = CouchbaseViewRequest!
    return couchbaseViewReq\execute path
