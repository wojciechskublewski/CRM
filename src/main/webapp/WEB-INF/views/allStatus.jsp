<%--
  Created by IntelliJ IDEA.
  User: wskublewski
  Date: 26.05.19
  Time: 09:17
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

    <script>
        function confirmDeleteStatus(id, name) {
            if (confirm("Do you want to delete status '" + name + "'?")) {
                window.location.href = "/status/delete/" + id;
            }
        }
    </script>

    <title>All statuses</title>
</head>
<body>
<%@include file="navbar.jspf" %>

        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Item</th>
                <th scope="col">Value</th>
                <th scope="col">Sorting</th>
                <th scope="col">Edit</th>
            </tr>
            </thead>



        <c:forEach items="${statutes}" var="status">
            <tr scope="row">
                <td>${status.name}</td>
                <td>${status.activity}</td>
                <td>${status.sorting}</td>
                <td><a class="table-primary" name="${p.id}" href="/status/update/${status.id}">Update</a> / <a name="${status.id}" href="#" onclick="confirmDeleteStatus(${status.id}, '${status.name}')" class="btn btn-danger" >Delete</a> </td>
            </tr>

        </c:forEach>

        </table>
</body>
</html>
