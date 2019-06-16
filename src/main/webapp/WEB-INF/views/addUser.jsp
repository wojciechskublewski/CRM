<%--
  Created by IntelliJ IDEA.
  User: wskublewski
  Date: 25.05.19
  Time: 13:15
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

</head>
<body>
<%@include file="navbar.jspf" %>

    <form method="post">
        Login: <input type="text" name="login" placeholder="please insert login"><br>
        First name: <input type="text" name="firstName" placeholder="please insert first name"><br>
        Last name: <input type="text" name="lastName" placeholder="please insert last name"><br>
        Password: <input type="text" name="password" type="password" placeholder="please insert password"><br/>
        <input type="submit">
    </form>
</body>
</html>
