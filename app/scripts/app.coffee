'use strict'

###*
 # @ngdoc overview
 # @name testFrontEndApp
 # @description
 # # testFrontEndApp
 #
 # Main module of the application.
###
app = angular.module 'testFrontEndApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch']

app.config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/index.html'
        controller: 'MainCtrl'
      .when '/about',
        templateUrl: 'views/about.html'
        controller: 'AboutCtrl'
      .when '/user',
        templateUrl: 'views/user.html'
        controller: 'UserCtrl'
      .when '/top',
        templateUrl: 'views/top.html'
        controller: 'TopCtrl'
      .when '/myTop',
        templateUrl: 'views/mytop.html'
        controller: 'MytopCtrl'
      .when '/admin',
        templateUrl: 'views/admin.html'
        controller: 'AdminCtrl'
      .when '/login',
        templateUrl: 'views/login.html'
        controller: 'LoginCtrl'
      .when '/userInfo',
        templateUrl: 'views/userinfo.html'
        controller: 'UserinfoCtrl'
      .otherwise
        redirectTo: '/'


app.config ['$httpProvider', ($httpProvider) ->
  $httpProvider.interceptors.push ($window, $q, $location) ->
    {
      'request': (config) ->
        config.headers = config.headers or {}
        if $window.sessionStorage.getItem('token')
          #Headers 
          config.headers['X-User-Token'] = $window.sessionStorage.getItem 'token' 
          config.headers['X-User-Email'] = $window.sessionStorage.getItem 'email' 
          
        return config or $q.when(config)


      'response': (response) ->
        if response.status == 401
          # Redirection vers la page d'accueil
          $location.path '/'
        else
        response or $q.when(response)

    }
]
