<%--
  Created by IntelliJ IDEA.
  User: wskublewski
  Date: 26.05.19
  Time: 08:57
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

    <title>Add status</title>
</head>
<body>
<%@include file="navbar.jspf" %>

<header class="bg-primary">
    <h4 class="mx-auto text-center">Add Status </h4>
</header>

<div class="container">

    <form:form modelAttribute="status" method="post">
    <div class="form-group row">
        <label for="nameID" class="col-sm-1 col-form-label">Name</label>
        <div class="col-sm-3">
        <form:input path="name" id="nameID" class="form-control"/>
        </div>
    </div>

        <fieldset class="form-group">
            <div class="row">
                <legend class="col-form-label col-sm-1 pt-md-1">Activity</legend>
                <div class="col-sm-3">
                    <div class="form-check">
                        <form:radiobutton path="activity" value="true" class="form-check-input" name="gridRadios" id="gridRadios1" />
                        <label class="form-check-label" for="gridRadios1">
                            Active
                        </label>
                    </div>
                    <div class="form-check">
                        <form:radiobutton path="activity" value="false" class="form-check-input" name="gridRadios" id="gridRadios2" />
                        <label class="form-check-label" for="gridRadios2">
                            Not Active
                        </label>
                    </div>

                </div>
            </div>
        </fieldset>


        <div class="form-group row">
            <label for="sortingID" class="col-sm-1 col-form-label">Sorting</label>
            <div class="col-sm-3">
         <form:input path="sorting" type="number" id="sortingID" min="0" max="30" class="form-control"/>
            </div>
        </div>
        <input type="submit" value="Send" class="btn btn-primary">
    </form:form>

</div>
</body>
</html>
