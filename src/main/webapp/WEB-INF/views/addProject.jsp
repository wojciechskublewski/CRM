<%--
  Created by IntelliJ IDEA.
  User: wskublewski
  Date: 25.05.19
  Time: 16:06
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
    <h1 class="text-center">Add PROJECT</h1>
</header>

<div class="container">

    <form:form method="post" modelAttribute="project">
        <div class="form-group row">
            <label for="nameID" class="col-sm-2 col-form-label">Project Name</label>
            <div class="col-sm-7">
                <form:input path="name" class="form-control" id="nameID" />
                <form:errors path="name" element="div" cssClass="error"/>
            </div>
        </div>

        <div class="form-group row">
            <label for="desID" class="col-sm-2 col-form-label">Project Desctrition</label>
                <div class="col-sm-7">
                    <form:textarea path="description" class="form-control" id="desID" />
                    <form:errors path="description" element="div" cssClass="error"/>
                </div>
        </div>

        <div class="form-group row">
            <label for="webID" class="col-sm-2 col-form-label">Project WebSite</label>
            <div class="col-sm-7">
                <form:input path="web" class="form-control" id="webID" placeholder="http:\\...." />
                <form:errors path="web" element="div" cssClass="error"/>
            </div>
        </div>

        <div class="form-group row">
            <label for="usersID" class="col-sm-2 col-form-label">USERS</label>
            <div class="col-sm-7">
                <form:select class="form-control" id="usersID" multiple="true" itemValue="id" itemLabel="login" path="users" items="${users}"/>
            </div>
        </div>

        <div class="form-group row">
            <label for="tasksID" class="col-sm-2 col-form-label">TASKS</label>
            <div class="col-sm-7">
                <form:select class="form-control" id="tasksID" path="tasks" itemValue="id" itemLabel="subject" items="${tasks}"/>
            </div>
        </div>

        <fieldset class="form-group">
            <div class="row">
                <legend class="col-form-label col-sm-1 pt-0">Project Status</legend>
                <div class="col-sm-3">
                    <div class="form-check">
                        <form:radiobutton path="active" value="true" id="activityID1" class="form-check-input"/>
                        <label for="activityID1" class="form-check-lebel">Active</label>
                    </div>
                    <div class="form-check">
                        <form:radiobutton path="active" value="false" id="activityID2" class="form-check-input"/>
                        <label for="activityID1" class="form-check-lebel">Not Active</label>
                    </div>
                </div>
            </div>
        </fieldset>


        <input type="submit" class="btn btn-primary" value="Save">
    </form:form>
</div>

</body>
</html>
