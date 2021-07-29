<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>
<div id="add-employee" role="main">
    <g:form resource="${this.employee}" method="POST">
        <fieldset class="form">
            <f:all class="input-field" bean="employee"/>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="abc" class="btn btn-primary" action = "getAllEmployee" value="Add Employee"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>