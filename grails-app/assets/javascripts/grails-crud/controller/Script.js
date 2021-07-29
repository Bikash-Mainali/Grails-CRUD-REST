var app = angular.module("myApp", ['ui.router'])
    .config(function ($stateProvider, $locationProvider) {
        $stateProvider
            .state("test", {
                url: "/test",
                templateUrl: "templates/test"
            })
    })