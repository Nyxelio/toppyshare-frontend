'use strict'

###*
 # @ngdoc function
 # @name testFrontEndApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the testFrontEndApp
###
angular.module 'testFrontEndApp'
  .controller 'AboutCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
