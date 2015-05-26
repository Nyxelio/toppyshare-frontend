'use strict'

###*
 # @ngdoc function
 # @name testFrontEndApp.controller:TopCtrl
 # @description
 # # TopCtrl
 # Controller of the testFrontEndApp
###
app = angular.module 'testFrontEndApp'

app.controller 'TopCtrl', ($scope, $routeParams, $window,serviceAjax) ->

    deleteId = $routeParams.deleteId

    $scope.erreur = false
    $scope.saved = false
    $scope.category = false

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
        $scope.debJson = 'top':
          'title': ''
          'tags': '["#evasion"]'
          'category': 'voyage'
          'items': ''
        $scope.debJson.top.title = $scope.title
        $scope.debJson.top.items = $scope.tops


        serviceAjax.createTop($scope.debJson).success (data, status) ->
            console.log 'success',data, status
            if data.success == true
                $scope.saved = true
            return
        .error (data,status) ->
            console.log status
            $scope.erreur = true
            $scope.erreurMsg = data.error || data.info
            $scope.saved = false
            return


    $scope.checkForNameDelete = ($index) ->
        if $scope.tops[$index].title == ''
          $scope.tops.splice $index, 1

    $scope.removeCurrentItem = ($index) ->
        $scope.tops[$index].title = ''
        $scope.checkForNameDelete($index)



    serviceAjax.getCategories().success (data, status) ->
        $scope.categories = data || []
        console.log $scope.categories
        return
      .error (status) ->
        return
        
return
###
	$scope.checkForNameDelete = ($index) ->
		if $scope.tops[$index].val == ''
		  $scope.tops.splice $index, 1
	return

return
###




