'use strict'

###*
 # @ngdoc function
 # @name testFrontEndApp.controller:MytopCtrl
 # @description
 # # MytopCtrl
 # Controller of the testFrontEndApp
###
app = angular.module 'testFrontEndApp'
app.controller 'UsertopCtrl', ($scope, $routeParams, $window,serviceAjax) ->
  id = $routeParams.idUser

  #Partie init mes tops
  serviceAjax.getAllTopUser(id).success((data, status) ->
    $scope.myTops = data
    $scope.i = 1
    if $scope.myFollowers
      $scope.noTop = false
    else
      $scope.noTop = true

  ).error ((status) ->
    console.log status
  )

  #Partie user favorie 
  serviceAjax.getAllFollowerCurrentUser().success((data, status) -> 
    $scope.userFav = data

    if $scope.userFav
      $scope.noUser = false
    else
      $scope.noUser = true
         
  ).error ((status) ->
    console.log status
  )

  #Partie mes Followers
  serviceAjax.getAllFollowerOfUser().success((data, status) ->
    $scope.myFollowers = data 
     
    if $scope.myFollowers
      $scope.notFollow = false
    else
      $scope.notFollow = true

  ).error ((status) ->
    console.log status
  ) 

#Gestion ListeGroup
$ ->
  $('.list-group-item').on 'mouseover', (event) ->
    event.preventDefault()
    $(this).closest('li').addClass 'open'
    return
  $('.list-group-item').on 'mouseout', (event) ->
    event.preventDefault()
    $(this).closest('li').removeClass 'open'
    return
  return