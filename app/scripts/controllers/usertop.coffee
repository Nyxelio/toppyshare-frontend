'use strict'

###*
 # @ngdoc function
 # @name testFrontEndApp.controller:UsertopCtrl
 # @description
 # # UsertopCtrl
 # Controller of the testFrontEndApp
###
angular.module 'testFrontEndApp'
  .controller 'UsertopCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
