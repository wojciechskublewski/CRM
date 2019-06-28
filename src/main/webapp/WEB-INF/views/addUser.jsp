<%--
  Created by IntelliJ IDEA.
  User: wskublewski
  Date: 25.05.19
  Time: 13:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="<c:url value="/webjars/jquery/3.0.0/jquery.min.js"/>"></script>
    <script src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"/>"></script>
    <link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet">

</head>
<body>
<%@include file="navbar.jspf" %>

<header class="bg-primary">
    <h1 class="mx-auto text-center">Add User</h1>
</header>
    <div class="container">
    <form:form method="post" modelAttribute="user" >
        <div class="form-group row">
            <label for="loginID" class="col-sm-2 col-form-label">Login</label>
            <div class="col-sm-6">
                <form:input path="login" type="text" name="login" class="form-control" id="loginID" placeholder="please insert login"/>
                <form:errors path="login" element="div" cssClass="error"/>
            </div>
        </div>
        <div class="form-group row">
            <label for="firstNameID" class="col-sm-2 col-form-label">First Name</label>
            <div class="col-sm-6">
                <form:input path="firstName" type="text" name="firstName" class="form-control" id="firstNameID" placeholder="please insert first name"/>
                <form:errors path="firstName" element="div" cssClass="error"/>
            </div>
        </div>
        <div class="form-group row">
            <label for="lastNameID" class="col-sm-2 col-form-label">Last Name</label>
            <div class="col-sm-6">
                <form:input path="lastName" type="text" name="lastName" class="form-control" id="lastNameID" placeholder="please insert last name"/>
                <form:errors path="lastName" element="div" cssClass="error"/>
            </div>
        </div>
        <div class="form-group row">
            <label for="passwordID" class="col-sm-2 col-form-label">Password</label>
            <div class="col-sm-6">
                <form:password path="password" name="password" class="form-control" id="passwordID" placeholder="please insert password"/>
                <form:errors path="password" element="div" cssClass="error"/>
            </div>
        </div>
        <input type="submit" value="Submit" class="btn btn-primary">
    </form:form>
    </div>
</body>
</html>
