'use strict'

###*
 # @ngdoc function
 # @name testFrontEndApp.controller:UserCtrl
 # @description
 # # UserCtrl
 # Controller of the testFrontEndApp
###

app = angular.module('sample')
app.controller 'UserCtrl', ($scope, serviceAjax) ->
  email = $scope.email
  password = $scope.password

  $scope.connectionUser = ->
    serviceAjax.login().success (status) ->
      console.log status
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

#var app = angular.module('testFrontEndApp')
#app.controller('UserCtrl', function ($scope) {
#  	var email = $scope.email;
#	var password = $scope.password;
#	
#    $scope.connectionUser = function(){
#   	serviceAjax.info(id).success(function(status){
#   			console.log(status);
#    });
#}
# });