'use strict'

###*
 # @ngdoc function
 # @name testFrontEndApp.controller:UserCtrl
 # @description
 # # UserCtrl
 # Controller of the testFrontEndApp
###

angular.module 'testFrontEndApp'
  .controller 'UserCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]

#var app = angular.module('testFrontEndApp')
#app.controller('UserCtrl', function ($scope) {
#  	
# });