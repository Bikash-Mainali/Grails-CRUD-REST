<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
<div class="nav" role="navigation">
</div>
<div id="show-employee" class="content scaffold-show" role="main">
    <f:display bean="employee" />
    <g:form resource="${this.employee}" method="DELETE">
        <fieldset class="buttons">
            <input class="btn btn-danger list"type="submit" value="Remove Employee" />
            <g:link class="btn btn-primary list" action="getAllEmployee">Show Employee list</g:link>

        </fieldset>
    </g:form>
</div>
<div class="clearfix"></div>

</body>
</html>   -