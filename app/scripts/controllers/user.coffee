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

  $scope.jsonLogin = {user: {email: "arnold@nodomain.tld", password: "azertyui12"}}
  $scope.jsonRegister = {"user": {"email": "arnold4@nodomain.tld", "password": "azertyui12", "password_confirmation": "azertyui12", 
  "name": "Arnold4"} }

  #TESTER ET FINI
  $scope.seConnecter = ->
    serviceAjax.login($scope.jsonLogin).success ((data, status) ->
      console.log status
      $window.sessionStorage.setItem 'token', data.user.authentication_token
      $window.sessionStorage.setItem 'email', data.user.email
      #$location.path '/'
      
    )

    #TESTER ET FINI
    serviceAjax.login($scope.jsonLogin).error ->
      $window.sessionStorage.removeItem 'token'
      $window.sessionStorage.removeItem 'email'
      # TODO: Show something like "Username or password invalid."
      console.log 'erreur'
      return

    # A FAIRE ET A TESTER
   $scope.register = ->
    serviceAjax.register($scope.jsonRegister).success (status) ->
      
      return
    return
return


 #Debut partie jen
app = angular.module('sample', []).directive('equalsTo', [ ->

  ###
  # <input type="password" ng-model="Password" />
  # <input type="password" ng-model="ConfirmPassword" equals-to="Password" />
  ###

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

 ##Fin partie jen


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