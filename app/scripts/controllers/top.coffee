'use strict'

###*
 # @ngdoc function
 # @name testFrontEndApp.controller:TopCtrl
 # @description
 # # TopCtrl
 # Controller of the testFrontEndApp
###
app = angular.module 'testFrontEndApp'

app.controller 'TopCtrl', ($scope, serviceAjax) ->
	
	$scope.names = [
	  { val: 'bob' }
	  { val: 'lucy' }
	  { val: 'john' }
	  { val: 'luke' }
	  { val: 'han' }
	]
 
	$scope.tops = [
	]


	$scope.tempo = ''

	$scope.add = ->
		if $scope.tempo == ''
		  return
		$scope.tops.push title: $scope.tempo
		$scope.tempo = ''
	
		
	

	$scope.enregistrer = ->
		$scope.debJson = 'tops':
		  'title': ''
		  'tags': '["#evasion"]'
		  'category': 'voyage'
		  'items': ''
		$scope.debJson.tops.title = $scope.title
		$scope.debJson.tops.items = $scope.tops
		
		
		serviceAjax.createTop($scope.debJson).success (data, status) ->
			console.log status
			return
		.error (status) ->
			console.log status
			return
		

	$scope.checkForNameDelete = ($index) ->
		if $scope.tops[$index].title == ''
		  $scope.tops.splice $index, 1
	


return
###
	$scope.checkForNameDelete = ($index) ->
		if $scope.tops[$index].val == ''
		  $scope.tops.splice $index, 1
	return

return
###




