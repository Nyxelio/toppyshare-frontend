'use strict'

###*
 # @ngdoc function
 # @name testFrontEndApp.controller:DetailsCtrl
 # @description
 # # DetailsCtrl
 # Controller of the testFrontEndApp
###
angular.module 'testFrontEndApp'
  .controller 'DetailsCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
