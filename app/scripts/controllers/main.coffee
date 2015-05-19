'use strict'

###*
 # @ngdoc function
 # @name testFrontEndApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the testFrontEndApp
###

app = angular.module('testFrontEndApp')
app.controller 'MainCtrl', ($scope, serviceAjax) ->
  email = $scope.email
  password = $scope.password

  $scope.seConnecter = ->
    serviceAjax.login().success (status) ->
      console.log status
      return
    return

  return

    
