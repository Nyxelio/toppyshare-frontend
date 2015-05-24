'use strict'

describe 'Controller: UserinfoCtrl', ->

  # load the controller's module
  beforeEach module 'testFrontEndApp'

  UserinfoCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    UserinfoCtrl = $controller 'UserinfoCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
