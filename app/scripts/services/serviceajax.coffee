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
    #User
    login: (dataJson) ->
      $http.post('http://toppyshare-backend.herokuapp.com/api/sessions', dataJson)

    register: (dataJson) ->
      $http.post('http://toppyshare-backend.herokuapp.com/api/users', dataJson)

    getUserInfo:() ->
      $http.get('http://toppyshare-backend.herokuapp.com/api/users') 

    updateUser:(dataJson) ->
      $http.put('http://toppyshare-backend.herokuapp.com/api/users', dataJson)
      
    #Top
    createTop: (dataJson) ->
      $http.post('http://toppyshare-backend.herokuapp.com/api/tops', dataJson)   	

    updateTop: (dataJson, id) ->
      $http.post('http://toppyshare-backend.herokuapp.com/api/tops/'+ id, dataJson)

    getAllTop: () ->
      $http.get('http://toppyshare-backend.herokuapp.com/api/tops')

    getOneTop:(id) ->
      $http.get('http://toppyshare-backend.herokuapp.com/api/tops/' + id)

    deleteTop:(id) ->
      $http.delete('http://toppyshare-backend.herokuapp.com/api/tops/' + id)

    getAllTopDateFilter: (dateDeb, dateFin) ->
      $http.get('http://toppyshare-backend.herokuapp.com/api/tops?filters[start_date]=' + dateDeb + '&filters[end_date]=' + dateFin)

    getAllTopUser: (id) ->
      $http.get('http://toppyshare-backend.herokuapp.com/api/tops?filters[user_id]=' + id)

    forked: (dataJson) ->
      $http.post('http://toppyshare-backend.herokuapp.com/api/tops', dataJson)

    #Follow
    followUser: (dataJson) ->
      $http.post('http://toppyshare-backend.herokuapp.com/api/followings', dataJson)

    getAllFollowerCurrentUser: () ->
      $http.get('http://toppyshare-backend.herokuapp.com/api/followings')

    getAllFollowerOfUser:() ->
      $http.get('http://toppyshare-backend.herokuapp.com/api/followers')

    getCategories:() ->
      $http.get('http://toppyshare-backend.herokuapp.com/api/categories')
        

  }


