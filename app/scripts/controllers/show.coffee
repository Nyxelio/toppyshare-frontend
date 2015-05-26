'use strict'

###*
 # @ngdoc function
 # @name testFrontEndApp.controller:ShowCtrl
 # @description
 # # ShowCtrl
 # Controller of the testFrontEndApp
###
angular.module 'testFrontEndApp'
  .controller 'ShowCtrl', ($scope,  $routeParams, $window,serviceAjax) ->
    id = $routeParams.topId
    
    serviceAjax.getOneTop(id).success((data, status) ->
        $scope.top = data

        console.log $scope.top

      ).error ((status) ->
        console.log status
      )