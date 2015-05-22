'use strict'

###*
 # @ngdoc service
 # @name testFrontEndApp.serviceAjax
 # @description
 # # serviceAjax
 # Factory in the testFrontEndApp.
###

angular.module('testFrontEndApp').factory 'serviceAjax', ($http, $q) ->
  {
    search: (query, page) ->
      $http.get 'http://localhost:3000/search?q=' + query + '&page=' + page


    #User
    login: (dataJson) ->
      $http.post('http://localhost:3000/api/sessions', dataJson)

    register: (dataJson) ->
      $http.post('http://localhost:3000/api/users', dataJson)

    getUserInfo:() ->
      $http.get('http://localhost:3000/api/users') 

    updateUser:(dataJson) ->
      $http.put('http://localhost:3000/api/users', dataJson)
      
    #Top
    createTop: (dataJson) ->
      $http.post('http://localhost:3000/api/tops', dataJson)   	

    updateTop: (dataJson, id) ->
      $http.post('http://localhost:3000/api/tops/'+ id, dataJson)

    getAllTop: () ->
      $http.get('http://localhost:3000/api/tops')

    getOneTop:(id) ->
      $http.get('http://localhost:3000/api/tops/' + id)

    deleteTop:(id) ->
      $http.delete('http://localhost:3000/api/tops/' + id)

    getAllTopDateFilter: (dateDeb, dateFin) ->
      $http.get('http://localhost:3000/api/tops?filters[start_date]=' + dateDeb + '&filters[end_date]=' + dateFin)

    getAllTopUser: (id) ->
      $http.get('http://localhost:3000/api/tops?filters[user_id]=' + id)

    forked: (dataJson) ->
      $http.post('http://localhost:3000/api/tops', dataJson)

    #Follow
    followUser: (dataJson) ->
      $http.post('http://localhost:3000/api/followings', dataJson)

    getAllFollowerCurrentUser: () ->
      $http.get('http://localhost:3000/api/followings')

    getAllFollowerOfUser:() ->
      $http.get('http://localhost:3000/api/followers')


  }


