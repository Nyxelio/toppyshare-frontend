'use strict'

###*
 # @ngdoc function
 # @name testFrontEndApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the testFrontEndApp
###

app = angular.module 'testFrontEndApp'
app.controller 'MainCtrl', ($scope, $location, $window, serviceAjax) ->

