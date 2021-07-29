<html ng-app="myApp">
    <title>Grails Project</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<asset:javascript src="grails-crud/controller/angular.js"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-router/0.2.15/angular-ui-router.js"></script>
<asset:javascript src="grails-crud/application.config.js"/>
<asset:javascript src="grails-crud/controller/employee-controller.js"/>
<asset:javascript src="grails-crud/services/link.service.js"/>
<asset:javascript src="grails-crud/services/logger.service.js"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-smart-table/2.1.8/smart-table.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/1.3.1/js/toastr.js"></script>
<asset:stylesheet src="/grails-crud/angular/datatables-1.10.10/media/css/dataTables.bootstrap.css"/>
<asset:stylesheet src="/grails-crud/angulardatatables-1.10.10/extensions/Responsive/css/responsive.bootstrap.css"/>
<asset:stylesheet src="/grails-crud/angulardatatables-1.10.10/extensions/Buttons/css/buttons.bootstrap.css"/>
<asset:javascript src="/grails-crud/angular/datatables-1.10.10/media/js/dataTables.bootstrap.min.js"/>
<asset:javascript src="/grails-crud/angular/angular-toastr/angular-toastr.tpls.js"/>
<asset:javascript src="/npm/bootstrap/js/bootstrap.min.js"/>
<asset:javascript src="/npm/bootstrap/js/bootstrap.js"/>
<asset:stylesheet src="/grails-crud/angular/angular-toastr/angular-toastr.css"/>
<asset:stylesheet src="/npm/bootstrap/css/bootstrap.css"/>
<asset:stylesheet src="/npm/bootstrap/css/bootstrap.min.css"/>
<style>
body th {
    background-color: rgb(211, 243, 212);
    cursor: pointer;

}

body tr:nth-child(even) {
    background-color: #f2f2f2;
}

body tr:hover {
    background-color: #ddd;
}

.loader {
    border: 5px solid #a39d9a;
    border-radius: 50%;
    border-right: 7px solid deepskyblue;
    border-left: 7px solid #57dce3;
    -webkit-animation: spin 2s linear infinite;
    animation: spin 2s linear infinite;
    position: fixed;
    top: 50%;
    left: 50%;
    height: 50px;
    width: 50px;
    display: none;

}

@-webkit-keyframes spin {
    0% {
        -webkit-transform: rotate(0deg);
    }
    100% {
        -webkit-transform: rotate(360deg);
    }
}

@keyframes spin {
    0% {
        transform: rotate(0deg);
    }
    100% {
        transform: rotate(360deg);
    }
}

.glyphicon-sort {
    font-size: 12px
}

.particular {
    background-color: rgb(211, 243, 212);
    margin: 20px;
    padding-top: 20px;
}

.particular > label {
    background-color: darkgray;
    height: 20px
}

.confirmation-dialog {
    display: none
}
</style>

</head>

<h1 class="text-center" style="margin-top: 40px;border-bottom: 2px solid #20c997">Employe List</h1>

<body>
<div ng-controller="employeeController">
    <div class="btns text-center">
        <a type="button" class="btn btn-primary" href="${request.contextPath}/addEmployee">Add Employee</a>
<button class="btn btn-info" ng-click="getAllEmployee()">Find Employee</button>
</div>

<div class="clearfix"></div>
<hr/>

<div class="container">
    <input type="checkbox" ng-model="hideSN">Hide SN Column
    <input type="checkbox" ng-model="hideEmployeeId">Hide Emp Id Column
    <table ng-style="employee-table" class="table table-striped table-bordered">
        <thead>
        <tr>
            <th ng-hide="hideSN">SN</th>
            <th ng-hide="hideEmployeeId" ng-click="sortData('firstName')">Emp Id<i
                    class="glyphicon glyphicon-sort"></i>

                <div ng-class="getSortClass('firstName')"></div>
                <input type="text" ng-model="searchText.id" placeholder="search emp id"
                       style="border: none;background-color: #ECEAEA;font-size:15px"/>
            </th>
            <th>Image</th>
            <th ng-click="sortData('firstName')">First Name<i class="glyphicon glyphicon-sort"></i>

                <div ng-class="getSortClass('firstName')"></div>
                <input type="text" ng-model="searchText.firstName" placeholder="search first name"
                       style="border: none;background-color: #ECEAEA;font-size:15px"/>
            </th>
            <th ng-click="sortData('lastName')">Last Name<i class="glyphicon glyphicon-sort"></i>

                <div ng-class="getSortClass('lastName')"></div>
                <input type="text" ng-model="searchText.lastName" placeholder="search last name"
                       style="border: none;background-color: #ECEAEA;font-size:15px"/>
            </th>
            <th ng-click="sortData('position')">Position<i class="glyphicon glyphicon-sort"></i>

                <div ng-class="getSortClass('position')"></div>
                <input type="text" ng-model="searchText.position" placeholder="search position"
                       style="border: none;background-color: #ECEAEA;font-size:15px"/>
            </th>
            <th ng-click="sortData('manager')">Manager<i class="glyphicon glyphicon-sort"></i>

                <div ng-class="getSortClass('manager')"></div>
                <input type="text" ng-model="searchText.manager" placeholder="search manager"
                       style="border: none;background-color: #ECEAEA;font-size:15px"/>

            </th>
            <th ng-click="sortData('department')">Department<i class="glyphicon glyphicon-sort"></i>

                <div ng-class="getSortClass('department')"></div>
                <input type="text" ng-model="searchText.department" placeholder="search department"
                       style="border: none;background-color: #ECEAEA;font-size:15px"/>
            </th>
            <th ng-click="sortData('joinDate')">Join Date<i class="glyphicon glyphicon-sort"></i>

                <div ng-class="getSortClass('joinDate')"></div>
                <input type="text" ng-model="searchText.joinDate" placeholder="search join date"
                       style="border: none;background-color: #ECEAEA;font-size:15px"/>

            </th>
            <th>Action</th>
        </tr>
        <tr>
            <th colspan="10">
                <input st-search ng-model="searchText" placeholder="global search" class="input-sm form-control"
                       type="search"/>
            </th>
        </tr>
        </thead>
        <tbody>
        <tr ng-repeat="emp in employee | orderBy:sortColumn:reverseSort | filter:searchText">
            <td ng-hide="hideSN">{{$index+1}}</td>
            <td ng-hide="hideEmployeeId">{{emp.id}}</td>
            <td><asset:image alt="image" src="{{emp.id}}-profileImage.jpg" style="width: 50px; height: 50px;"/></td>
            <td><span ng-hide="emp.updating">{{emp.firstName}}</span><input ng-show="emp.updating" type="text"
                                                                            ng-model="emp.firstName"></td>
            <td><span ng-hide="emp.updating">{{emp.lastName}}</span><input ng-show="emp.updating" type="text"
                                                                           ng-model="emp.lastName"></td>
            <td><span ng-hide="emp.updating">{{emp.position}}</span><input ng-show="emp.updating" type="text"
                                                                           ng-model="emp.position"></td>
            <td><span ng-hide="emp.updating">{{emp.manager}}</span><input ng-show="emp.updating" type="text"
                                                                          ng-model="emp.manager"></td>

            <td><span ng-hide="emp.updating">{{emp.department}}</span><input ng-show="emp.updating" type="text"
                                                                             ng-model="emp.department"></td>

            <td><span ng-hide="emp.updating">{{emp.joinDate}}</span><input ng-show="emp.updating" type="text"
                                                                           ng-model="emp.joinDate"></td>
            <td ng-hide="emp.showUpdateButtonOnly">
                <a title="show" type="button" ng-click="modalToShowData(emp)" class="btn btn-sm btn-info">
                    <i class="glyphicon glyphicon-eye-open"></i>
                </a>
                <a title="update" type="button" class="btn btn-sm btn-primary" ng-click="editEmployee($index)"
                   class="btn btn-sm btn-primary updateText">Update
                </a>
                <a title="delete" type="button" ng-click="confirmationDialog(emp)"
                   class="btn btn-sm btn-danger">Delete
                </a>
            </td>
            <td ng-show="emp.showUpdateButtonOnly">
                <a type="button" ng-click="submitUpdatedData(emp)"
                   class="btn btn-info updateText" ng-style="emp.updateBtn">{{emp.updateText}}
                </a>
            </td>
        </tr>
        </tbody>
    </table>

</div>

<div ng-style="preLoader" class="spinner-border text-primary loader" role="status">
    <span class="sr-only pre-loader">Loading...</span>
</div>

<div id="confirmation-dialog">
    <div class="modal fade confirmation-dialog" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" ng-style="title">{{confirmationDialogConfig.title}}</h4>
                </div>

                <div class="modal-body">
                    <div class="span5">{{confirmationDialogConfig.message}}</div>
                </div>

                <div id="particular-data" ng-show="showDiv">
                    <div class="modal-body particular">
                        <label class="col-md-6">Employee Id</label><span class="col-md-6"
                                                                         ng-hide="updateSingleEmployee">{{confirmationDialogConfig.empId}}</span><span
                            ng-show="updateSingleEmployee"><input type="text" ng-model="emp_id"
                                                                  value={{confirmationDialogConfig.empId}}></span>
                    </div>

                    <div class="modal-body particular">
                        <label class="col-md-6">First Name</label><span class="col-md-6"
                                                                        ng-hide="updateSingleEmployee">{{confirmationDialogConfig.firstName}}</span><span
                            ng-show="updateSingleEmployee"><input type="text" ng-model="firstName"
                                                                  value={{confirmationDialogConfig.firstName}}>
                    </span>
                    </div>

                    <div class="modal-body particular">
                        <label class="col-md-6">Last Name</label><span class="col-md-6"
                                                                       ng-hide="updateSingleEmployee">{{confirmationDialogConfig.lastName}}</span><span
                            ng-show="updateSingleEmployee"><input type="text" ng-model="lastName"
                                                                  value={{confirmationDialogConfig.lastName}}>
                    </span>
                    </div>

                    <div class="modal-body particular">
                        <label class="col-md-6">Position</label><span class="col-md-6"
                                                                      ng-hide="updateSingleEmployee">{{confirmationDialogConfig.position}}</span><span
                            ng-show="updateSingleEmployee"><input type="text" ng-model="position"
                                                                  value={{confirmationDialogConfig.position}}>
                    </span>
                    </div>

                    <div class="modal-body particular">
                        <label class="col-md-6">Department</label><span class="col-md-6"
                                                                        ng-hide="updateSingleEmployee">{{confirmationDialogConfig.department}}</span><span
                            ng-show="updateSingleEmployee"><input type="text" ng-model="department"
                                                                  value={{confirmationDialogConfig.department}}>
                    </span>
                    </div>

                    <div class="modal-body particular">
                        <label class="col-md-6">Manager</label><span class="col-md-6"
                                                                     ng-hide="updateSingleEmployee">{{confirmationDialogConfig.manager}}</span><span
                            ng-show="updateSingleEmployee"><input type="text" ng-model="manager"
                                                                  value={{confirmationDialogConfig.manager}}></span>
                    </div>

                    <div class="modal-body particular">
                        <label class="col-md-6">Join Date</label><span class="col-md-6"
                                                                       ng-hide="updateSingleEmployee">{{confirmationDialogConfig.joinDate}}</span><span
                            ng-show="updateSingleEmployee"><input type="text" ng-model="joinDate"
                                                                  value={{confirmationDialogConfig.joinDate}}>
                    </span>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                    <button type="button" ng-style="footerBtn"
                            ng-repeat="button in confirmationDialogConfig.buttons"
                            ng-click="executeDialogAction(button.action)" class="btn btn-primary">{{button.label}}
                    </button>
                    <button type="button" ng-click="updateIndividual()" id="updateIndividual" style="display: none"
                            class="btn btn-primary">Update Data</button>
                </div>
            </div>

        </div>
    </div>
</div>
</div>
</div>

<div>
    <a ui-sref="test">AngularJS Project</a>
</div>
</body>

</html>


