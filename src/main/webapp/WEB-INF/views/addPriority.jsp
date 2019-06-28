<%--
  Created by IntelliJ IDEA.
  User: wskublewski
  Date: 26.05.19
  Time: 09:56
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


    <title>Add priority</title>
</head>
<body>

<%@include file="navbar.jspf" %>

<header class="bg-primary">
    <h4 class="mx-auto text-center">Add Priority </h4>
</header>

<div class="container">

<div class="form-check">

    <form:form modelAttribute="priority" method="post">
        <div class="form-group row">
            <label class="col-sm-1 col-form-label" for="nameID">Name</label>
        <div class="col-sm-5">
            <form:input class="form-control" path="name" id="nameID"/>
            <form:errors path="name" element="div" cssClass="error"/>
        </div>
        </div>

        <fieldset class="form-group">
            <div class="row">
                <legend class="col-form-label col-sm-1 pt-0">Activity</legend>
                <div class="col-sm-3">
                <div class="form-check">
                    <form:radiobutton path="activity" value="true" id="activityID1" class="form-check-input"/>
                    <label for="activityID1" class="form-check-lebel">Active</label>
                </div>
                <div class="form-check">
                    <form:radiobutton path="activity" value="false" id="activityID2" class="form-check-input"/>
                    <label for="activityID1" class="form-check-lebel">Not Active</label>
                </div>
                </div>
            </div>
        </fieldset>
        <input type="submit" value="Send" class="btn btn-primary">

    </form:form>
</div>

</div>
</body>
</html>
