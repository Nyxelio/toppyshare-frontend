'use strict'

###*
 # @ngdoc function
 # @name testFrontEndApp.controller:UsertopCtrl
 # @description
 # # UsertopCtrl
 # Controller of the testFrontEndApp
###
app = angular.module 'testFrontEndApp'
app.controller 'UsertopCtrl', ($scope, $routeParams, serviceAjax) ->
	id = $routeParams.idUser
	    

	#Partie init mes tops
	serviceAjax.getAllTopUser(id).success(data, status) ->
		$scope.myTops = data
		$scope.i = 1
		if $scope.myFollowers
		  $scope.noTop = false
		else
		  $scope.noTop = true
		return
	.error (status) ->
		console.log status

	return

	#Partie user favorie 
	serviceAjax.getAllFollowerCurrentUser().success(data, status) -> 
		$scope.userFav = data

		if $scope.userFav
		  $scope.noUser = false
		else
		  $scope.noUser = true
		return
	.error (status) ->
		console.log status

	return

	#Partie mes Followers
	serviceAjax.getAllFollowerOfUser().success(data, status) ->
		$scope.myFollowers = data 
		 
		if $scope.myFollowers
		  $scope.notFollow = false
		else
		  $scope.notFollow = true
		return
	.error (status) ->
		console.log status

	return
