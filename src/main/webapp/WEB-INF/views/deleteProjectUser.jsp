<%--
  Created by IntelliJ IDEA.
  User: wskublewski
  Date: 30.05.19
  Time: 06:00
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

        <form:form modelAttribute="projects" method="post">

                <c:forEach items="${projects}" var="projects">

                    Project: ${projects.name} <form:select itemValue="id" itemLabel="login" path="empty" name="user.id" items="${projects.users}"/> <a href="/project/delete/user/${projects.id}" name="${projects.id}" > Update </a><br/>  <br/>



                </c:forEach>
            <input type="submit" value="remove"/>

        </form:form>
</body>
</html>
