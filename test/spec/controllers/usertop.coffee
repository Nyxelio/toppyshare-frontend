'use strict'

describe 'Controller: UsertopCtrl', ->

  # load the controller's module
  beforeEach module 'testFrontEndApp'

  UsertopCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    UsertopCtrl = $controller 'UsertopCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
