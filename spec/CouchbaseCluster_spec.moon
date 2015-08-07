describe "CouchbaseCluster tests", ->
  local CouchbaseCluster
  local CouchbaseViewQuery

  setup ->
    CouchbaseCluster = require("couchbase-luascript.CouchbaseCluster")
    CouchbaseViewQuery = require("couchbase-luascript.CouchbaseViewQuery")

  it "Testing cluster configuration", ->
    cluster = CouchbaseCluster "http://192.168.0.1"
    result = cluster\get_dsn!
    assert.are.equal "http://192.168.0.1", result

  it "Testing group level 1", ->
    cluster = CouchbaseCluster "http://127.0.0.1"
    bucket = cluster\open_bucket "beer-sample"
    query = CouchbaseViewQuery\from "beer", "by_location"
    query\group_level 1
    res = bucket\query query
    assert.are.equal 63, table.getn(res.rows)

  it "Testing group level 3", ->
    cluster = CouchbaseCluster "http://127.0.0.1"
    bucket = cluster\open_bucket "beer-sample"
    query = CouchbaseViewQuery\from "beer", "by_location"
    query\group_level 3
    res = bucket\query query
    assert.are.equal 1044, table.getn(res.rows)

  it "Testing key", ->
    cluster = CouchbaseCluster "http://127.0.0.1"
    bucket = cluster\open_bucket "beer-sample"
    query = CouchbaseViewQuery\from "beer", "brewery_beers"
    query\key { "21st_amendment_brewery_cafe" }
    res = bucket\query query
    assert.are.equal  "21st_amendment_brewery_cafe", res["rows"][1]["id"]
