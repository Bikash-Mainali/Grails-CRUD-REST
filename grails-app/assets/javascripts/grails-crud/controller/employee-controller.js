angular.module('myApp', [])
    .controller('employeeController', employeeController)

/*

angular.module('myApp', [])
    .directive('fileModel', ['$parse', function ($parse) {
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
*/

function homeController($scope) {
    alert("......")
    $scope.message = "This is Home Page"
}

function employeeController($scope, $http, $log, linkService) {
    $scope.getAllEmployee = function () {
        $scope.preLoader = {
            "display": "block"
        }
        linkService.getEmployee().then(function (response) {
            $scope.employee = response.data
            if (response.isSuccess) {
                $scope.preLoader = {
                    "display": "none"
                }
                toastr.success(response.responseMessage, {
                    "timeOut": "0",
                    "extendedTImeout": "0"
                });
            }
        })
    }

    $scope.editEmployee = function (index) {
        $scope.employee.forEach(function (item) {
            item.showUpdateButtonOnly = false
            item.updating = false
            item.updateText = "update data"
        })

        $scope.employee[index].updating = true
        $scope.employee[index].showUpdateButtonOnly = true

        $scope.submitUpdatedData = function (emp) {
            var data = {
                "id": emp.id,
                "joinDate": emp.joinDate,
                "manager": emp.manager,
                "firstName": emp.firstName,
                "department": emp.department,
                "lastName": emp.lastName,
                "position": emp.position
            }
            linkService.updateEmployee(data).then(function (response) {
                    if (response.isSuccess && response.responseCode == 201) {
                        toastr.success(response.responseMessage, {
                            "timeOut": "0",
                            "extendedTImeout": "0"
                        });
                        $scope.employee[index].updateBtn = {
                            "background-color": "20C997",
                            "color": "white",
                        }
                        $scope.employee[index].updateText = "updated"
                    }
                }
            )
        }
    }

    $scope.deleteEmployee = function (currentEmployee) {
        linkService.deleteEmployeeById(currentEmployee.id).then(function (response) {
            if (response.isSuccess) {
                toastr.success(response.responseMessage, {
                    "timeOut": "0",
                    "extendedTImeout": "0"
                });
            }
            $scope.preLoader = {
                "display": "block"
            }
            linkService.getEmployee().then(function (response) {
                $scope.employee = response.data
                if (response.isSuccess) {
                    $scope.preLoader = {
                        "display": "none"
                    }
                }
            })
        })
    }


    $scope.addEmployee = function () {
        var postData = $('form').serializeArray()
        $scope.preLoader = {
            "display": "block"
        }
        linkService.submitEmployeeData(postData)
        $scope.preLoader = {
            "display": "block"
        }
        linkService.getEmployee().then(function (response) {
            $scope.employee = response.data
            if (response.isSuccess) {
                $scope.preLoader = {
                    "display": "none"
                }
            }
        })

        linkService.getEmployee().then(function (response) {
            $scope.employee = response.data
        })
    }


    //for sorting table
    $scope.sortColumn = "";
    $scope.reverseSort = false;
    $scope.sortData = function (column) {
        $scope.reverseSort = ($scope.sortColumn == column) ? !$scope.reverseSort : false
        $scope.sortColumn = column;
    }
    $scope.getSortClass = function (column) {
        if ($scope.sortColumn == column) {
            return $scope.reverseSort ? '.arrow-down' : '.arrow-up'
        }
        return ""
    }


    //confirmation dialogue
    $scope.confirmationDialogConfig = {};
    var currentEmployee = null;
    $scope.confirmationDialog = function (emp) {
        currentEmployee = emp
        $scope.showDiv = false

        $scope.confirmationDialogConfig = {
            title: "Caution!!!",
            message: "Are you sure you want to delete?",
            buttons: [{
                label: "Delete",
                action: "delete"
            }]
        };
        $scope.title = {
            "color": "red"
        }
        $scope.footerBtn = {
            "background-color": "#d9534f",
        }
        $scope.showDialog(true);
        $("#updateIndividual").hide()
    };

    $scope.modalToShowData = function (emp) {
        currentEmployee = emp;
        $scope.showDiv = true
        $scope.confirmationDialogConfig = {
            title: "Employee Details",
            empId: emp.id,
            firstName: emp.firstName,
            lastName: emp.lastName,
            position: emp.position,
            manager: emp.manager,
            department: emp.department,
            joinDate: emp.joinDate,
            buttons: [{
                label: "Edit",
                action: "editData",

            },
            ],
        };
        $scope.title = {
            "color": "black",
            "text-align": "center"
        }
        $scope.footerBtn = {
            "background-color": "#337ab7",
        }
        $scope.showDialog(true);
    }
    $scope.printData = function () {
        var printContents = document.getElementById("particular-data").innerHTML;
        var popupWin = window.open('', '_blank', 'width=300,height=300');
        popupWin.document.open();
        popupWin.document.write('<html><head><title>Employee Details</title><link rel="stylesheet" type="text/css" href="style.css" /></head><body onload="window.print()">' + printContents + '</body></html>');
        popupWin.document.close();
    }

    $scope.editData = function () {
        $scope.updateSingleEmployee = true
        $scope.emp_id = currentEmployee.id
        $scope.firstName = currentEmployee.firstName
        $scope.lastName = currentEmployee.lastName
        $scope.position = currentEmployee.position
        $scope.department = currentEmployee.department
        $scope.manager = currentEmployee.manager
        $scope.joinDate = currentEmployee.joinDate
        $('#updateIndividual').show();
        $scope.footerBtn = {
            "display": "none"
        }
    }


    $scope.executeDialogAction = function (action) {
        if (typeof $scope[action] === "function") {
            $scope[action]();
        }
    };


    $scope.delete = function () {
        console.log("Deleting...");
        $scope.showDialog();
        $scope.deleteEmployee(currentEmployee)
    };
    $scope.updateIndividual = function () {
        var data = {
            "id": $scope.emp_id,
            "joinDate": $scope.joinDate,
            "manager": $scope.manager,
            "firstName": $scope.firstName,
            "department": $scope.department,
            "lastName": $scope.lastName,
            "position": $scope.position
        }
        linkService.updateEmployee(data).then(function (response) {
                if (response.isSuccess && response.responseCode == 201) {
                    toastr.success(response.responseMessage, {
                        "timeOut": "0",
                        "extendedTImeout": "0"
                    });
                    $scope.getAllEmployee()
                }
            }
        )
    }


    $scope.showDialog = function (flag) {
        jQuery("#confirmation-dialog .modal").modal(flag ? 'show' : 'hide');
    };

}


/*

//using angular model
$scope.addEmployee = function () {
    //fancy grid
    //data grid
    var data = {
        "joinDate": $scope.joinDate,
        "manager": $scope.manager,
        "firstName": $scope.firstName,
        "department": $scope.department,
        "lastName": $scope.lastName,
        "position": $scope.position
    }
    linkService.submitEmployeeData(data).then(function (response) {
        linkService.getEmployee().then(function (response) {
            $scope.employee = response.data
        })
    })

}
*/

