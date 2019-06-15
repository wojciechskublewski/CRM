<%--
  Created by IntelliJ IDEA.
  User: wskublewski
  Date: 15.06.19
  Time: 06:40
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

<form:form modelAttribute="status" method="post">
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Name</label>
        <div class="col-sm-10">
            <form:input name="name" path="name" value="${status.name}"/>
        </div>
    </div>

    <fieldset class="form-group">
        <div class="row">
            <legend class="col-form-label col-sm-2 pt-0">Status</legend>
            <div class="col-sm-5">
                <div class="form-check">
                    <form:radiobutton class="form-check-input" path="activity" name="activity" id="gridRadios1" value="TRUE" checked="true"/>
                    <label class="form-check-label" for="gridRadios1">
                        Active
                    </label>
                </div>
                <div class="form-check">
                    <form:radiobutton class="form-check-input" path="activity"  name="activity" id="gridRadios2" value="FALSE"/>
                    <label class="form-check-label" for="gridRadios2">
                        Not Active
                    </label>
                </div>
            </div>
        </div>
    </fieldset>

    <div class="form-group row">
        <label for="inputSorting" class="col-sm-2 col-form-label">Sorting</label>
        <div class="col-sm-10">
            <form:input type="text" name="sorting" path="sorting" class="form-control" id="inputSorting" placeholder="${status.sorting}"/>
        </div>
    </div>

    <div class="form-group row">
        <div class="col-sm-5">
            <button type="submit" class="btn btn-primary">Save</button>
        </div>
    </div>
</form:form>

</body>
</html>
