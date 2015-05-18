'use strict'

describe 'Service: serviceAjax', ->

  # load the service's module
  beforeEach module 'testFrontEndApp'

  # instantiate service
  serviceAjax = {}
  beforeEach inject (_serviceAjax_) ->
    serviceAjax = _serviceAjax_

  it 'should do something', ->
    expect(!!serviceAjax).toBe true
