<html ng-app="myApp">
<head>
    <title>Grails Project</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <asset:javascript src="grails-crud/angular/angular.js"/>
    <asset:javascript src="grails-crud/application.config.js"/>
    <asset:javascript src="grails-crud/controller/employee-controller.js"/>
%{--
    <asset:javascript src="grails-crud/controller/test-controller.js"/>
--}%
    <asset:javascript src="grails-crud/services/link.service.js"/>
    <asset:javascript src="grails-crud/services/logger.service.js"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-smart-table/2.1.8/smart-table.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-router/1.0.29/angular-ui-router.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/1.3.1/js/toastr.js"></script>
    <asset:stylesheet src="/grails-crud/angular/datatables-1.10.10/media/css/dataTables.bootstrap.css"/>
    <asset:stylesheet src="/grails-crud/angulardatatables-1.10.10/extensions/Responsive/css/responsive.bootstrap.css"/>
    <asset:stylesheet src="/grails-crud/angulardatatables-1.10.10/extensions/Buttons/css/buttons.bootstrap.css"/>
    <asset:javascript src="/grails-crud/angular/datatables-1.10.10/media/js/jquery.dataTables.min.js"/>
    <asset:javascript src="/grails-crud/angular/datatables-1.10.10/media/js/dataTables.bootstrap.min.js"/>
    <asset:javascript src="/grails-crud/angular/datatables-1.10.10/extensions/Buttons/js/dataTables.buttons.min.js"/>
    <asset:javascript src="/grails-crud/angular/angular-toastr/angular-toastr.tpls.js"/>
    <asset:javascript src="/npm/bootstrap/js/bootstrap.min.js"/>
    <asset:javascript src="/npm/bootstrap/js/bootstrap.js"/>
    <asset:stylesheet src="/grails-crud/angular/angular-toastr/angular-toastr.css"/>
    <asset:stylesheet src="/npm/bootstrap/css/bootstrap.css"/>
    <asset:stylesheet src="/npm/bootstrap/css/bootstrap.min.css"/>

    <style type="text/css">
    body {
        font-size: 20px;
    }
/*

    . {
        color: red;
        font-weight: normal;
    }
*/

    #pre-loader {
        position: fixed;
        top: 50%;
        left: 50%;
        height: 40px;
        width: 40px;
        display: none;

    }

    * {
        box-sizing: border-box;
    }

    input[type=text], [type=date], select, textarea {
        width: 100%;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 4px;
        resize: vertical;
    }

    label {
        padding: 12px 12px 12px 0;
        display: inline-block;
    }

    .container {
        border-radius: 5px;
        background-color: #f2f2f2;
        padding: 20px;
    }

    .col-25 {
        float: left;
        width: 25%;
        margin-top: 6px;
    }

    .col-50 {
        float: left;
        width: 50%;
        margin-top: 6px;
    }

    /* Clear floats after the columns */
    .row:after {
        content: "";
        display: table;
        clear: both;
    }

    @media screen and (max-width: 600px) {
        .col-25, .col-50, input[type=submit] {
            width: 100%;
            margin-top: 0;
        }
    }

    </style>
</head>

<body ng-controller="employeeController">
<h1 class="text-center" style="margin-top: 40px;border-bottom: 2px solid #20c997">Employe Details Form</h1>
<a href="${request.contextPath}/employee/welcome" class="btn btn-info btn-lg  pull-right">
    <span class="glyphicon glyphicon-backward"></span> BACK
</a>

<div class="clearfix"></div>
<hr>

<div class="form-style-3">
    <div class="container">
        <form ng-submit="addEmployee()" id="add-employee-form">
            <div class="row">
                <div class="col-25">
                    <label for="first-name">First Name</label><span class="">*</span>
                </div>

                <div class="col-50">
                    <input  type="text" id="first-name" name="firstName" ng-model="firstName"
                           placeholder="first name..">
                </div>
            </div>

            <div class="row">
                <div class="col-25">
                    <label for="last-name">Last Name</label><span class="">*</span>
                </div>

                <div class="col-50">
                    <input  type="text" id="last-name" name="lastName" ng-model="lastName"
                           placeholder="last name..">
                </div>
            </div>

            <div class="row">
                <div class="col-25">
                    <label for="join-date">Join Date</label><span class="">*</span>
                </div>

                <div class="col-50">
                    <input  type="date" id="join-date" name="joinDate" ng-model="joinDate"
                           placeholder="Join Date..">
                </div>
            </div>

            <div class="row">
                <div class="col-25">
                    <label for="manager">Manager</label><span class="">*</span>
                </div>

                <div class="col-50">
                    <input  type="text" id="manager" name="manager" ng-model="manager"
                           placeholder="Manager..">
                </div>
            </div>

            <div class="row">
                <div class="col-25">
                    <label for="position">Position</label><span class="">*</span>
                </div>

                <div class="col-50">
                    <select  id="position" name="position" ng-model="position">
                        <option value=""></option>
                        <option value="Software engineer">Software engineer</option>
                        <option value="Senior Engineer">Senior Engineer</option>
                        <option value="Trainee">Trainee</option>
                        <option value="Project Manager">Project Manager</option>
                    </select>
                </div>
            </div>

            <div class="row">
                <div class="col-25">
                    <label for="position">Department</label><span class="">*</span>
                </div>

                <div class="col-50">
                    <select  id="department" name="department" ng-model="department">
                        <option value=""></option>
                        <option value="File Mapping">FM</option>
                        <option value="R & D">R & D</option>
                        <option value="DV">DV</option>
                    </select>
                </div>
            </div>

            <div class="row">
                <div class="col-25"></div>

                <div class="col-50">
                    <span class="btn btn-primary btn-lg col-md-3 pull-right reset" style="margin-left: 5px"><i
                            class="glyphicon glyphicon-repeat"></i>&nbsp;Reset
                    </span>
                    <input type="submit" class="btn btn-info btn-lg  col-md-3 pull-right" value="Submit">
                </div>
            </div>

        </form>
       <div class="row">
            <div class="col-25"><label vor="profile-image">Picture</label></div>

            <div class="col-50"><input type="file"  id="file" name ="file" file-model="myFile"/>
            </div>
        </div>
    </div>

</div>

<div ng-style="preLoader" id="pre-loader" class="spinner-border text-primary" role="status">
    <span class="sr-only pre-loader">Loading...</span>
</div>
<script>
    $(document).on("click", ".reset", function () {
        $("form")[0].reset()
    })

</script>
</body>
</html>