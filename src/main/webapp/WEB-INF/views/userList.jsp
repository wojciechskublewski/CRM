<%--
  Created by IntelliJ IDEA.
  User: wskublewski
  Date: 14.06.19
  Time: 10:04
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
    <h1 class="text-center">User projects & tasks</h1>
</header>
<div class="row">
<div class="card mx-auto" style="width: 18rem;">
    <div class="card-header">
        Projects
    </div>
    <c:forEach items="${projects}" var="u">
    <ul class="list-group list-group-flush">

        <li class="list-group-item">${u.name}</li>

    </ul>
    </c:forEach>
</div>

    <div class="card mx-auto" style="width: 18rem;">
        <div class="card-header">
            Task
        </div>
        <c:forEach items="${tasks}" var="u">
            <ul class="list-group list-group-flush">

                <li class="list-group-item">${u.subject}</li>

            </ul>
        </c:forEach>
    </div>
</div>




</body>
</html>
