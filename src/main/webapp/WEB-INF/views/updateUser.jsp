<%--
  Created by IntelliJ IDEA.
  User: wskublewski
  Date: 18.06.19
  Time: 16:35
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
    <title>Title</title>
</head>
<body>
<%@include file="navbar.jspf" %>

<header class="bg-primary">
    <h1 class="mx-auto text-center">EDIT User</h1>
</header>
<div class="container">
    <form:form method="post" modelAttribute="user" >
        <div class="form-group row">
            <label for="loginID" class="col-sm-2 col-form-label">Login</label>
            <div class="col-sm-4">
                <form:input path="login" value="${user.login}" name="login" class="form-control" id="loginID"/>
            </div>
        </div>
        <div class="form-group row">
            <label for="firstNameID" class="col-sm-2 col-form-label">First Name</label>
            <div class="col-sm-4">
                <form:input path="firstName" value="${user.firstName}" name="firstName" class="form-control" id="firstNameID" />
            </div>
        </div>
        <div class="form-group row">
            <label for="lastNameID" class="col-sm-2 col-form-label">Last Name</label>
            <div class="col-sm-4">
                <form:input path="lastName" value="${user.lastName}" name="lastName" class="form-control" id="lastNameID" />
            </div>
        </div>
        <div class="form-group row">
            <label for="passwordID" class="col-sm-2 col-form-label">Password</label>
            <div class="col-sm-4">
                <form:password path="password" value="${user.password}" name="password" class="form-control" id="passwordID" />
            </div>
        </div>
        <input type="submit" value="Submit" class="btn btn-primary">
    </form:form>
</div>
</body>
</html>
