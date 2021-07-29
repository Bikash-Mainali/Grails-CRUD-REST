'use strict'

angular.module('myApp')
.directive('index', function () {
    return {
        templateUrl: 'templates/index.html',
        controller: 'userCtrl',
        replace: true
    }
})