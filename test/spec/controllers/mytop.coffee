'use strict'

describe 'Controller: MytopCtrl', ->

  # load the controller's module
  beforeEach module 'testFrontEndApp'

  MytopCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MytopCtrl = $controller 'MytopCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
