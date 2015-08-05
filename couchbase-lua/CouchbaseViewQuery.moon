class _CouchbaseViewQuery
  ddoc: ''
  name: ''
  options: {}

  _to_string: (typed) =>
    path = '/_design/' .. @ddoc .. '/' .. typed .. '/' .. @name
    args = {}

    for option, value in pairs @options
      arg = option .. '=' .. value
      table.insert(args, arg)

    path ..= '?' .. table.concat(args, "&")
    return path

class CouchbaseDefaultViewQuery extends _CouchbaseViewQuery
  key: (key) =>
    @options["key"] = key
    return @

  group: (group) =>
    @options["group"] = tostring(group)
    return @

  skip: (skip) =>
    @options["skip"] = '' .. skip
    return @

  to_string: =>
    @_to_string('_view')

class CouchbaseViewQuery
  @from: (ddoc, name) =>
    res = with CouchbaseDefaultViewQuery!
      .ddoc = ddoc
      .name = name
    return res

CouchbaseViewQuery
