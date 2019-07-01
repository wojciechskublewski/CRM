<%--
  Created by IntelliJ IDEA.
  User: wskublewski
  Date: 30.06.19
  Time: 07:17
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

    <title>Start Page</title>
</head>
<body>
<%@include file="navbar.jspf" %>

<div class="row">
    <div class="col-sm-6">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">PROJECTS
                </h5>
                <p class="card-text">Active projects</p>
                <c:forEach items="${project}" var="p">
                <a href="/project/update/${p.id}" class="btn btn-primary">${p.name}</a><br/>
                    <br/>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">PROJECTS</h5>
                <p class="card-text">Not Active projects</p>
                <c:forEach  items="${project1}" var="p">
                <a href="/project/update/${p.id}" class="btn btn-primary">${p.name}</a><br/>
                    <br/>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

</body>
</html>
