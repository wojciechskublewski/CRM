<%--
  Created by IntelliJ IDEA.
  User: wskublewski
  Date: 16.06.19
  Time: 07:14
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
    <h1 class="text-center">EDIT Tasks</h1>
</header>


<div class="container">

    <form:form modelAttribute="task" method="post">
        <div class="row form ">
            <label class="col-2" for="subjectID">Subject</label>
            <form:input class="form-control col-3" path="subject" id="subjectID" value="${task.subject}"/>
        </div>
        <div class="form-group row">
            <label class="col-2" for="dateID">Date</label>
            <form:input class="form-control col-3" type="date" path="date" id="dateID" value="${task.date}"/>
        </div>
        <div class="row form-group">
            <label class="col-2" for="descriptionID">Description</label>
            <form:textarea class="form-control col-3" path="description" id="descriptionID" value="${task.description}"/>
        </div>
        <div class="row form-group">
            <label class="col-2" for="statusID">Status</label>
            <form:select class="custom-select col-3" path="status.id" items="${statuses}" itemLabel="name" itemValue="id" id="statusID"/>
        </div>
        <div class="row form-group">
            <label class="col-2" for="priorityID">Priority</label>
            <form:select class="custom-select col-3" path="priority.id" id="priorityID">

                <form:options items="${priorities}" itemLabel="name" itemValue="id"/>
            </form:select>
        </div>

        <div class="form-group row">
            <label for="userID" class="col-sm-2 col-form-label">User</label>
            <div class="col-sm-3">
                <form:select name="userCheck" path="user.id" id="userID" class="custom-select"  itemLabel="login" itemValue="id">

                    <form:options items="${users}" itemLabel="login" itemValue="id"/>
                </form:select>
            </div>
        </div>


        <button type="submit" class="btn btn-primary">Submit</button>
    </form:form>


</div>

</body>
</html>
