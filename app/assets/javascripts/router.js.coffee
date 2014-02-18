window.TemplatesData ||= {}
Frozen = angular.module('Frozen', ['ngRoute'])

$ ->
  angular.bootstrap($("html"), ["Frozen"])

Frozen.config(['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode(true)  
  $routeProvider.when '/',
    template: TemplatesData['main']
    controller: 'FrozenCtrl'
  $routeProvider.when '/js-compiled',
    template: TemplatesData['js_compiled']
    controller: 'FrozenCtrl'
  $routeProvider.when '/html-embedded',
    template: document.getElementById("html-embedded").innerHTML
    controller: 'FrozenCtrl'
  $routeProvider.when '/xhr',
    templateUrl: 'assets/xhr.html'
    controller: 'FrozenCtrl'
  $routeProvider.otherwise
    redirectTo: '/'
])

Frozen.controller "FrozenCtrl", ["$scope", ($scope) ->
  $scope.meow = "123"
]

Frozen.controller "HeaderCtrl", ["$scope", ($scope) ->
  $scope.meow = "123"
]