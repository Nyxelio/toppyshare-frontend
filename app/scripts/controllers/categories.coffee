'use strict'

###*
 # @ngdoc function
 # @name testFrontEndApp.controller:CategoriesCtrl
 # @description
 # # CategoriesCtrl
 # Controller of the testFrontEndApp
###
angular.module 'testFrontEndApp'
  .controller 'CategoriesCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
