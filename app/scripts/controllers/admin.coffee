'use strict'

###*
 # @ngdoc function
 # @name testFrontEndApp.controller:AdminCtrl
 # @description
 # # AdminCtrl
 # Controller of the testFrontEndApp
###
angular.module 'testFrontEndApp'
  .controller 'AdminCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
