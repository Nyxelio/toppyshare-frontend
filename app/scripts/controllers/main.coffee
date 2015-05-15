'use strict'

###*
 # @ngdoc function
 # @name testFrontEndApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the testFrontEndApp
###
angular.module 'testFrontEndApp'
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]

    
