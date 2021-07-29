<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Grails MVC Project</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
    table {
        width: 100%;

    }

    table, th, td {
        border: 1px solid black;
        border-collapse: collapse;
    }

    th, td {
        padding: 8px;
        text-align: left;
    }
    </style>
</head>

<body>
<div class="nav" role="navigation">
    <h1 class="text-center">Cedargate Employee List</h1>

    <div class="clearfix"></div>
    <hr/>
    <g:link class="btn btn-primary pull-right" action="addEmployee">Add Employee</g:link>
    <hr/>
    <h3>TABLE 1</h3>
    <table class='table' border="2px">
        <thead>
        <tr style="background-color: #20c997">
            <th>Employee ID</th>
            <th>FIRST NAME</th>
            <th>LAST NAME</th>
            <th>POSITION</th>
            <th>DEPARTMENT</th>
            <th>MANAGER</th>
            <th>JOIN DATE</th>
            <th>ACTION</th>

        </tr>
        </thead>
        <tbody>
        <g:each var="employee" in="${employeeList}" status="i">
            <tr>
                <td>
                    ${employee.id}
                </td>
                <td>
                    ${employee.firstName}
                </td>
                <td>
                    ${employee.lastName}
                </td>
                <td>
                    ${employee.position}
                </td>
                <td>
                    ${employee.department}
                </td>
                <td>
                    ${employee.manager}
                </td>
                <td>
                    ${employee.joinDate}
                </td>
                <td><g:link class="btn btn-primary update" action="updateEmployee">update</g:link>&nbsp;<a class="btn btn-danger"
                                                                                                           href="Delete">delete</a></td>
            </tr>

        </g:each>
        </tbody>

    </table>
    <script>
        $(document).off("click",".update").on("click",".update",function(){
            var row = $(this).closest('tr').find('td').text();
            alert(row);
        })
    </script>

</div>

<h3>TABLE 2</h3>
<div id="list-student">
    <f:table collection="${employeeList}"
             properties="[
                     'id',
                     'firstName',
                     'lastName',
                     'position',
                     'department',
                     'joinDate',
                     'manager'
             ]" />

</div>
</body>
</html>