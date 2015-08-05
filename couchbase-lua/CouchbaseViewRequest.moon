http = require "socket.http"
ltn12 = require "ltn12"
cjson = require "cjson"

class CouchbaseViewRequest
  execute: (path) =>
    response = {}
    save = ltn12.sink.table(response)

    ok, code, headers  = http.request{
      url: path,
      method: 'GET',
      sink: save
    }

    if not ok
      return false

    return cjson.decode(table.concat(response))
