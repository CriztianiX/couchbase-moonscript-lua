describe "CouchbaseCluster tests", ->
  local CouchbaseCluster
  local CouchbaseViewQuery

  setup ->
    CouchbaseCluster = require("couchbase-luascript.CouchbaseCluster")
    CouchbaseViewQuery = require("couchbase-luascript.CouchbaseViewQuery")

  it "Testing cluster", ->
    cluster = CouchbaseCluster "http://127.0.0.1"
    bucket = cluster\open_bucket "default"
    query = CouchbaseViewQuery\from "application_user", "rank_categories"
    query\group true
    res = bucket\query query
    import p from require "moon"
    p res
