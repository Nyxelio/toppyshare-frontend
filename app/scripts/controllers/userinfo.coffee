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
		console.log status

	$scope.updateInfo = ->
		console.log "pseudo " + $scope.info.user.name
		console.log "mail " + $scope.info.user.email
		console.log "pays " + $scope.info.user.country
		console.log "langue " + $scope.info.user.lang
		serviceAjax.updateUser($scope.info).success((data, status) ->
			console.log status
			$location.path '/'
		).error (status) ->
			console.log status
