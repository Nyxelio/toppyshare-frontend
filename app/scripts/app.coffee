'use strict'

###*
 # @ngdoc overview
 # @name testFrontEndApp
 # @description
 # # testFrontEndApp
 #
 # Main module of the application.
###
angular
  .module 'testFrontEndApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch'
  ]
  .config ($routeProvider) ->
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
      .otherwise
        redirectTo: '/'

