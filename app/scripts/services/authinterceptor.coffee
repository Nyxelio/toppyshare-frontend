'use strict'

###*
 # @ngdoc service
 # @name testFrontEndApp.AuthInterceptor
 # @description
 # # AuthInterceptor
 # Factory in the testFrontEndApp.
###
app = angular.module('testFrontEndApp')
app.factory 'AuthInterceptor', ['$window', '$q', '$location', ($window, $q, $location) ->
{
	request:(config) ->
		config.headers = config.headers or {}
		if $window.sessionStorage.getItem('token')
			#Ajout du token dans le headers
			config.headers = 'X-User-Token': $window.sessionStorage.getItem 'token'
		return config or $q.when(config)
		

	reponse: (response) ->
      if response.status == 401
        # Redirection vers la page d'accueil
        $location.path '/'
      else
      response or $q.when(response)		
}

]


