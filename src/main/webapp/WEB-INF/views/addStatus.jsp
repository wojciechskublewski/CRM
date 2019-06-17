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

<div class="container">
    <form:form modelAttribute="status" method="post">

        Name:<form:input path="name"/> <br>
        Active: <form:radiobutton path="activity" value="true"/>
        Not Active: <form:radiobutton path="activity" value="false"/> <br>
        Sorting: <form:input path="sorting"/> <br>
        <input type="submit" value="Save">
    </form:form>

</div>
</body>
</html>
