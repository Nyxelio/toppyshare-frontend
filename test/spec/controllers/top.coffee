'use strict'

describe 'Controller: TopCtrl', ->

  # load the controller's module
  beforeEach module 'testFrontEndApp'

  TopCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    TopCtrl = $controller 'TopCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
