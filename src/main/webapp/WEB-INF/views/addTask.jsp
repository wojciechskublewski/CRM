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


<header class="bg-primary">Add task</header>

<form:form modelAttribute="task" method="post">
    Subject: <form:input path="subject"/><br>
    Date: <form:input path="date" placeholder="mm/dd/yyyy"/>
    Description: <form:input path="description"/>
    <form:select path="status.id" items="${statuses}" itemLabel="name" itemValue="id"/>
    <form:select path="priority.id" items="${priorities}" itemLabel="name" itemValue="id"/>
    <input type="submit" value="Save">
</form:form>



</body>
</html>
