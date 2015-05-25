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
    
    $scope.tops = []
    
    $scope.$on "userLogged", (event, args) ->
       console.log 'userLogged'
       $scope.username = args.username
       $scope.email = args.email
       $scope.isLogged = args.isLoggin
       
    
    serviceAjax.getAllTop().success (data, status) ->
        $scope.tops = data || []
        $scope.i = 1
        if $scope.tops.length > 0 
          $scope.noTop = false
        else
          $scope.noTop = true
        return
      .error (status) ->
        console.log status
        $scope.noTop = true

        return