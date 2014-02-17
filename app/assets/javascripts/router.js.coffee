window.TemplatesData ||= {}
Frozen = angular.module('Frozen', ['ngRoute'])

$ ->
  angular.bootstrap($("html"), ["Frozen"])

Frozen.config(['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode(true)
  $routeProvider.when '/',
    template: TemplatesData['main']
    controller: 'FrozenCtrl'
  $routeProvider.otherwise
    redirectTo: '/'
])

Frozen.controller "FrozenCtrl", ["$scope", ($scope) ->
  $scope.meow = "123"
]