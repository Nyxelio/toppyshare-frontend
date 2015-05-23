'use strict'

###*
 # @ngdoc service
 # @name testFrontEndApp.isLogin
 # @description
 # # isLogin
 # Factory in the testFrontEndApp.
###
app = angular.module 'testFrontEndApp'
app.factory 'isLogin',($scope) ->
{
	#Verifie si 
	login: (data) ->
		if data
			$scope.log = true
		else
			$scope.log = false
		
}
