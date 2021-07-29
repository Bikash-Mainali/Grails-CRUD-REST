/*
var myApp = angular.module('myApp', []);

myApp.directive('fileModel', ['$parse', function ($parse) {
    return {
        restrict: 'A',
        link: function (scope, element, attrs) {
            var model = $parse(attrs.fileModel);
            var modelSetter = model.assign;

            element.bind('change', function () {
                scope.$apply(function () {
                    modelSetter(scope, element[0].files[0]);
                });
            });
        }
    };
}]);
myApp.service('fileUpload', ['$http', function ($http) {
    this.uploadFileToUrl = function (file, uploadUrl, post_data) {
        var fd = new FormData();

        var files = $('#file')[0].files[0];
        var formData = {}
        formData["joinDate"] = "test"
        formData["manager"] = "test"
        formData["firstName"] = "test"
        formData["department"] = "test"
        formData["lastName"] = "test"
        formData["joinDate"] = "test"
        formData["position"] = "test"
        formData["file"] = files
        alert(JSON.stringify(formData))
        $http.post(uploadUrl, JSON.stringify(formData))
    }
}]);
myApp.controller('employeeController', ['$scope', 'fileUpload', function ($scope, fileUpload) {
    $scope.uploadFile = function () {
        var file = $scope.myFile;
        console.log('file is ');
        console.dir(file);
        var uploadUrl = "/api/addEmployee";
        var postData = $('form').serializeArray()
        //alert(JSON.stringify(postData))
        var post_data = changeObjectToFormData(postData)

        fileUpload.uploadFileToUrl(file, uploadUrl, post_data);
    };
}]);

function changeObjectToFormData(object) {
    var fd = {};
    $.each(object, function (key, value) {
        fd[value.name] = value.value
    })
    return fd;
}*/
