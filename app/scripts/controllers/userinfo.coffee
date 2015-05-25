'use strict'

###*
 # @ngdoc function
 # @name testFrontEndApp.controller:UserinfoCtrl
 # @description
 # # UserinfoCtrl
 # Controller of the testFrontEndApp
###
app = angular.module 'testFrontEndApp'
app.controller 'UserinfoCtrl', ($scope, serviceAjax, $window, $location) ->

	serviceAjax.getUserInfo().success((data, status) ->
		$scope.info = data
	).error (status) ->
		$scope.error = true
		$scope.erreurInfo = status.error

	$scope.updateInfo = ->
		serviceAjax.updateUser($scope.info).success((data, status) ->
			console.log status
			$location.path '/'
		).error (status) ->
			console.log status

