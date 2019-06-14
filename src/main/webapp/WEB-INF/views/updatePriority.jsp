<%--
  Created by IntelliJ IDEA.
  User: wskublewski
  Date: 14.06.19
  Time: 16:42
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


<div class="form-check">

    <form:form modelAttribute="priority" method="post">
        Name: <form:input path="name" value="${priority.name}"/> <br>

        <c:if test="${priority.activity==Boolean.TRUE}">
            Active: <form:radiobutton path="activity" value="TRUE" checked="true"/>
            Not Active: <form:radiobutton path="activity" value="FALSE"/><br>
        </c:if>

        <c:if test="${priority.activity==Boolean.FALSE}">
            Active: <form:radiobutton path="activity" value="true" />
            Not Active: <form:radiobutton path="activity" value="false" checked="true"/><br>
        </c:if>
        <input type="submit" value="Save">

    </form:form>
</div>
</body>
</html>
