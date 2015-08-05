describe "CouchbaseViewQuery tests", ->
  local CouchbaseViewQuery

  setup ->
    CouchbaseViewQuery = require("couchbase-lua.CouchbaseViewQuery")

  it "Testing  params in query", ->
    defaultViewQuery = CouchbaseViewQuery\from "my_desing", "my_view"
    defaultViewQuery\key "mama"
    defaultViewQuery\skip 10
    result = "/_design/my_desing/_view/my_view?key=mama&skip=10"

    assert.are.equal defaultViewQuery\to_string!, result
