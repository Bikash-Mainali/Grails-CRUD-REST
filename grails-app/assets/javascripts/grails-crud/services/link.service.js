angular
    .module('myApp')
    .factory('linkService', linkService);

linkService.$inject = ['$http'];

function linkService($http) {

    var service = {
        getEmployee: getEmployee,
        deleteEmployeeById: deleteEmployeeById,
        submitEmployeeData: submitEmployeeData,
        updateEmployee: updateEmployee
    };
    return service;

    function getEmployee() {
        return getData("/api/getAllEmployee")
    }


    function deleteEmployeeById(id) {
        return deleteData("/api/deleteById" + "/" + id)
    }

    function submitEmployeeData(data) {
        return saveData("/api/addEmployee", data)
    }

    function updateEmployee(data) {
        return updateData("/api/updateEmployeeById/"+data.id, data)
    }


    function getData(url) {
        return $http.get(url)
            .then(getComplete)
            .catch(getFailed)
    }


    function deleteData(url) {
        return $http.delete(url)
            .then(getComplete)
            .catch(getFailed);
    }

    function updateData(url, postData) {
        return $http.post(url, postData)
            .then(getComplete)
            .catch(getFailed);
    }

    function saveData(url, data) {
        post_data = changeObjectToFormData(data)
        $http.post(url, post_data)
            .then(getComplete)
            .catch(getFailed)
        $('form')[0].reset()
    }


    function getComplete(response) {
        localStorage.setItem("responseData", JSON.stringify(response.data))
        //toastr.warning(response.data.message);
        return response.data;
    }

    function getFailed(error) {
        return error.data;
    }

    function changeObjectToFormData(object) {
        var fd = {};
        $.each(object, function (key, value) {
            fd[value.name] = value.value
        })
        return fd;
    }

    function clearForm() {
        $('form')[0].reset();
        return "Success"
    }


}


//using angular js
//$scope.clearForm()
/*
$scope.clearForm = function () {
    $scope.joinDate = '';
    $scope.manager = '';
    $scope.firstName = '';
    $scope.department = '';
    $scope.lastName = '';
    $scope.position = '';
}

*/

