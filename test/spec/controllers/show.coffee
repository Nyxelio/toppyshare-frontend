'use strict'

describe 'Controller: ShowCtrl', ->

  # load the controller's module
  beforeEach module 'testFrontEndApp'

  ShowCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ShowCtrl = $controller 'ShowCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
