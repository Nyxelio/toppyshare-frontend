'use strict'

###*
 # @ngdoc function
 # @name testFrontEndApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the testFrontEndApp
###

app = angular.module 'testFrontEndApp'
app.controller 'MainCtrl', ($scope, $location, $window, serviceAjax) ->

    $scope.username = $window.sessionStorage.getItem 'name'
    $scope.email = $window.sessionStorage.getItem 'email'
    $scope.isLogged = $window.sessionStorage.getItem 'isLogin'
    console.log 'main', $scope.username, $window.sessionStorage.getItem 'isLogin', $scope.isLogged
    
    $scope.$on "userLogged", (event, args) ->
       console.log 'userLogged'
       $scope.username = args.username
       $scope.email = args.email
       $scope.isLogged = args.isLoggin