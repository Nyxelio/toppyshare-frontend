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
  email = $scope.email
  password = $scope.password

  #Initialisation de la erreur d'affiché une erreur lors de l'inscription
  $scope.erreur = false
  
  $scope.seConnecter = ->
    #Creation de l'objet json 
    #A FINIR AU NIV DE LA CREATION DU JSON EN FONCTION DU FORMULAIRE
    $scope.jsonLogin = {user: {email: "arnold4@nodomain.tld", password: "azertyui12"}}

    #Appelle au service accès au données et stockage de l'id, du token et du mail
    serviceAjax.login($scope.jsonLogin).success ((data, status) ->
      #Stockage des données dans les variables fenetre session
      $window.sessionStorage.setItem 'id', data.user.id
      $window.sessionStorage.setItem 'token', data.user.authentication_token
      $window.sessionStorage.setItem 'email', data.user.email
      #$location.path '/'
    )
    serviceAjax.login($scope.jsonLogin).error((status) ->
      #On enleve les données qui aurait être stocké
      $window.sessionStorage.removeItem 'id'
      $window.sessionStorage.removeItem 'token'
      $window.sessionStorage.removeItem 'email'
      # TODO: Show something like "Username or password invalid."
      $scope.erreur = true
      )
      
    # Probleme 
   $scope.register = ->
    #Creation de l'objet json 
    #$scope.jsonRegister = {"user": {"email": "arnold4@nodomain.tld", "password": "azertyui12", "password_confirmation": "azertyui12", "name": "Arnold4"} }
    $scope.jsonRegister = 
      {"user": {"email": $scope.email, "password": $scope.password, "password_confirmation": $scope.password,"name": $scope.pseudo}}
    
    serviceAjax.register($scope.jsonRegister).success (status) ->
      $window.sessionStorage.setItem 'id', data.user.id
      $window.sessionStorage.setItem 'token', data.user.authentication_token
      $window.sessionStorage.setItem 'email', data.user.email
      console.log status

    serviceAjax.register($scope.jsonRegister).error (status) ->
      console.log status
      $scope.erreur = true
      return 
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



#Exemple en js
#var app = angular.module('testFrontEndApp')
#app.controller('UserCtrl', function ($scope) {
#   var email = $scope.email;
# var password = $scope.password;
# 
#    $scope.connectionUser = function(){
#     serviceAjax.info(id).success(function(status){
#         console.log(status);
#    });
#}
# });