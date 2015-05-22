'use strict'

describe 'Controller: DashboardctrlCtrl', ->

  # load the controller's module
  beforeEach module 'testFrontEndApp'

  DashboardctrlCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    DashboardctrlCtrl = $controller 'DashboardctrlCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
