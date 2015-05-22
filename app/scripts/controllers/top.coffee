'use strict'

###*
 # @ngdoc function
 # @name testFrontEndApp.controller:TopCtrl
 # @description
 # # TopCtrl
 # Controller of the testFrontEndApp
###
app = angular.module 'testFrontEndApp'
app.controller 'TopCtrl', ($scope, $window, serviceAjax) ->

	 $scope.createTop = ->
	 	serviceAjax.success (data)->

