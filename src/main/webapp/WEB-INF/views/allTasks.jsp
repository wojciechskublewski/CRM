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

    <title>All Tasks</title>
</head>
<body>
<%@include file="navbar.jspf" %>

        <table class="table table-striped">
            <c:forEach items="${tasks}" var="t">
                <tr>
                    <td>${t.subject}</td>
                    <td>${t.date}</td>
                    <td>${t.project.name}</td>
                    <td>${t.status.name}</td>
                    

                </tr>
            </c:forEach>

        </table>
</body>
</html>
