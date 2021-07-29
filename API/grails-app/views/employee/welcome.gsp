<%--
  Created by IntelliJ IDEA.
  User: Bikash.Mainali
  Date: 2021-03-10
  Time: 12:18
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<h1>Welcome to Cedargate</h1>
<div id="show-employee" class="content scaffold-show" role="main">
    <f:display bean="employee" />
    <g:form resource="${this.employee}" method="DELETE">
        <fieldset class="buttons">
            <g:link class="btn btn-primary list" action="getAllEmployee">Show Employee list</g:link>
        </fieldset>
    </g:form>
</div>
<body>

</body>
</html>