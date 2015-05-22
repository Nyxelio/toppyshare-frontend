'use strict'

###*
 # @ngdoc function
 # @name testFrontEndApp.controller:MytopCtrl
 # @description
 # # MytopCtrl
 # Controller of the testFrontEndApp
###
angular.module 'testFrontEndApp'
  .controller 'MytopCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
