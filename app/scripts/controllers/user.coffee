'use strict'

###*
 # @ngdoc function
 # @name testFrontEndApp.controller:UserCtrl
 # @description
 # # UserCtrl
 # Controller of the testFrontEndApp
###

app = angular.module('testFrontEndApp')
app.controller 'UserCtrl', ($scope, serviceAjax) ->
  email = $scope.email
  password = $scope.password

  $scope.connectionUser = ->
    serviceAjax.login().success (status) ->
      console.log status
      return
    return

  return

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