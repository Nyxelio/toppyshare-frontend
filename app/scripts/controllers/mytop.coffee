'use strict'

###*
 # @ngdoc function
 # @name testFrontEndApp.controller:MytopCtrl
 # @description
 # # MytopCtrl
 # Controller of the testFrontEndApp
###
angular.module 'testFrontEndApp'
  .controller 'MytopCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]

#Gestion ListeGroup
$ ->
  $('.list-group-item').on 'mouseover', (event) ->
    event.preventDefault()
    $(this).closest('li').addClass 'open'
    return
  $('.list-group-item').on 'mouseout', (event) ->
    event.preventDefault()
    $(this).closest('li').removeClass 'open'
    return
  return