'use strict'

describe 'Service: isLogin', ->

  # load the service's module
  beforeEach module 'testFrontEndApp'

  # instantiate service
  isLogin = {}
  beforeEach inject (_isLogin_) ->
    isLogin = _isLogin_

  it 'should do something', ->
    expect(!!isLogin).toBe true
