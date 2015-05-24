'use strict'

###*
 # @ngdoc function
 # @name testFrontEndApp.controller:LoginCtrl
 # @description
 # # LoginCtrl
 # Controller of the testFrontEndApp
###
app = angular.module 'testFrontEndApp'
app.controller 'LoginCtrl', ($scope, $location, $window, serviceAjax) ->

  #Initialisation de la erreur d'affiché une erreur lors de l'inscription
  $scope.erreur = false
  $scope.isLogin = false
  
  $scope.seConnecter = ->
    #Creation de l'objet json 
    $scope.jsonLogin = {user: {email: $scope.email, password: $scope.password}}
    
    #Appelle au service accès au données et stockage de l'id, du token et du mail
    serviceAjax.login($scope.jsonLogin).success ((data, status) ->
      #Stockage des données dans les variables fenetre session
      $window.sessionStorage.setItem 'id', data.user.id
      $window.sessionStorage.setItem 'token', data.user.authentication_token
      $window.sessionStorage.setItem 'email', data.user.email
      $window.sessionStorage.setItem 'isLogin', true
      
      $location.path '/'
    )
    .error((status) ->
      #On enleve les données qui aurait être stocké
      $window.sessionStorage.removeItem 'id'
      $window.sessionStorage.removeItem 'token'
      $window.sessionStorage.removeItem 'email'
      
      
      if $window.sessionStorage.getItem 'isLogin'
      	$scope.isLogin = true
      else
      	$scope.erreur = true
      )