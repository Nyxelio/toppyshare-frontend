'use strict'

###*
 # @ngdoc function
 # @name testFrontEndApp.controller:UserCtrl
 # @description
 # # UserCtrl
 # Controller of the testFrontEndApp
###

app = angular.module('testFrontEndApp')
app.controller 'UserCtrl', ($scope, $location, $window, serviceAjax) ->

  #Initialisation de la erreur d'affiché une erreur lors de l'inscription
  $scope.erreur = false
  $scope.isLogin = $window.sessionStorage.getItem 'isLogin'

    # Probleme 
  $scope.register = ->
    #Creation de l'objet json 
    #$scope.jsonRegister = {"user": {"email": "arnold4@nodomain.tld", "password": "azertyui12", "password_confirmation": "azertyui12", "name": "Arnold4"} }
    $scope.jsonRegister = 
      {"user": {"email": $scope.email, "password": $scope.password, "password_confirmation": $scope.password,"name": $scope.pseudo}}
    
    serviceAjax.register($scope.jsonRegister).success (data,status) ->
      $window.sessionStorage.setItem 'id', data.id
      $window.sessionStorage.setItem 'token', data.authentication_token
      $window.sessionStorage.setItem 'email', data.email

      $location.path '/login'
      return
    .error (data, status) ->
      $scope.erreur = true
      $scope.erreurMsg = data
    
    return
  



 #Verification password confirm
app.directive('equalsTo', [ ->
  {
    restrict: 'A'
    scope: true
    require: 'ngModel'
    link: (scope, elem, attrs, control) ->

      check = ->
        #Valeur du champs courant 
        v1 = scope.$eval(attrs.ngModel)
        # attrs.ngModel = “ConfirmPassword”
        #valeur du champ à comparer
        v2 = scope.$eval(attrs.equalsTo).$viewValue
        # attrs.equalsTo = “Password”
        v1 == v2

      scope.$watch check, (isValid) ->
        # Défini si le champ est valide
        control.$setValidity 'equalsTo', isValid
        return
      return

  }
 ])
return



