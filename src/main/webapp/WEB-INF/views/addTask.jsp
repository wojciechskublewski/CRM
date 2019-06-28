<%--
  Created by IntelliJ IDEA.
  User: wskublewski
  Date: 26.05.19
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="<c:url value="/webjars/jquery/3.0.0/jquery.min.js"/>"></script>
    <script src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"/>"></script>
    <link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet">

    <title>Title</title>
</head>
<body>
<%@include file="navbar.jspf" %>


<header class="bg-primary">
    <h1 class="text-center">Add TASK</h1>
</header>

<div class="container">
    <form:form modelAttribute="task" method="post">
        <div class="form-group row">
            <label for="nameID" class="col-sm-2 col-form-label">Subject</label>
            <div class="col-sm-7">
                <form:input path="subject" class="form-control" id="nameID" />
                <form:errors path="subject" element="div" cssClass="error"/>
        </div>
    </div>
        <div class="form-group row">
            <label for="dateID" class="col-sm-2 col-form-label">Date</label>
            <div class="col-sm-7">
                <form:input path="date" type="date" class="form-control" id="dateID" />
                <form:errors path="date" element="div" cssClass="error"/>
            </div>
        </div>

        <div class="form-group row">
            <label for="desID" class="col-sm-2 col-form-label">Description</label>
            <div class="col-sm-7">
                <form:textarea  path="description" class="form-control" id="desID" />
                <form:errors path="description" element="div" cssClass="error"/>
            </div>
        </div>

        <div class="form-group row">
            <label for="userID" class="col-sm-2 col-form-label">User</label>
            <div class="col-sm-3">
                <form:select items="${users}" path="user.id" id="userID" class="custom-select"  itemLabel="login" itemValue="id"/>
            </div>
        </div>

        <div class="form-group row">
            <label for="statusID" class="col-sm-2 col-form-label">Status</label>
            <div class="col-sm-3">
                <form:select path="status.id" id="statusID" class="custom-select" items="${statuses}" itemLabel="name" itemValue="id"/>
            </div>
        </div>

        <div class="form-group row">
            <label for="priorityID" class="col-sm-2 col-form-label">Priority</label>
            <div class="col-sm-3">
                <form:select class="custom-select" id="priorityID" path="priority.id" items="${priorities}" itemLabel="name" itemValue="id"/>
            </div>
        </div>

    <input class="btn btn-primary" type="submit" value="Save">

    </form:form>
</div>




</body>
</html>
