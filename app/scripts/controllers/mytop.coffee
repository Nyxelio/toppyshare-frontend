'use strict'

###*
 # @ngdoc function
 # @name testFrontEndApp.controller:MyTopCtrl
 # @description
 # # MyTopCtrl
 # Controller of the testFrontEndApp
###
app = angular.module 'testFrontEndApp'
app.controller 'MyTopCtrl', ($scope, $window, $cookies, serviceAjax) ->
  id = $window.sessionStorage.getItem 'id'
  
  #Partie init mes tops
  serviceAjax.getAllTopUser(id).success (data, status) ->
    $scope.myTops = data || []
    $scope.i = 1
    if $scope.myTops.length > 0 
      $scope.noTop = false
    else
      $scope.noTop = true
    return
  .error (status) ->
    console.log status
    $scope.noTop = true
        
    return
  
  #Partie user favorie 
  serviceAjax.getAllFollowerCurrentUser().success (data, status) -> 
    $scope.userFav = data || []

    if $scope.userFav.length > 0 
      $scope.noUser = false
    else
      $scope.noUser = true
         
  .error (status) ->
    console.log status
    $scope.noUser = true
    return
  

  #Partie mes Followers
  serviceAjax.getAllFollowerOfUser().success (data, status) ->
    $scope.myFollowers = data || []
     
    if $scope.myFollowers.length > 0 
      $scope.notFollow = false
    else
      $scope.notFollow = true

  .error (status) ->
    console.log status
    $scope.notFollow = true
    
    #à l'arrache
    if $cookies.authenticated == undefined
        window.location = '/#/login'
    return
    
  return

#Gestion ListeGroup
###$ ->
  $('.list-group-item').on 'mouseover', (event) ->
    event.preventDefault()
    $(this).closest('li').addClass 'open'
    return
  $('.list-group-item').on 'mouseout', (event) ->
    event.preventDefault()
    $(this).closest('li').removeClass 'open'
    return
  return###