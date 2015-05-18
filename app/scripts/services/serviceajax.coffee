'use strict'

###*
 # @ngdoc service
 # @name testFrontEndApp.serviceAjax
 # @description
 # # serviceAjax
 # Factory in the testFrontEndApp.
###

angular.module('coursExoApp').factory 'serviceAjax', ($http, $q) ->
  {
    search: (query, page) ->
      $http.get 'http://localhost:3000/search?q=' + query + '&page=' + page

    login: (data) ->
      $http.post('http://localhost:3000/api/users', data)

  }

