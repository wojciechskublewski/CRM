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

    <script>
        function confirmDeleteTask(id, name) {
            if (confirm("Do you want to delete a task '" + name + "'?")) {
                window.location.href = "/task/delete/" + id;
            }
        }
    </script>

    <title>All Tasks</title>
</head>
<body>
<%@include file="navbar.jspf" %>

<div class="container">


        <table class="table table-light">

            <thead class="thead-dark">
            <tr>
                <th scope="col">Subject</th>
                <th scope="col">Date</th>
                <th scope="col">Description</th>
                <th scope="col">Priority</th>
                <th scope="col">Status</th>
                <th scope="col">Edit/Delete</th>
            </tr>
            </thead>


            <c:forEach items="${tasks}" var="t">
            <tbody>
                <tr class="table-success">
                    <td>${t.subject}</td>
                    <td>${t.date}</td>
                    <td>${t.description}</td>
                    <td>${t.priority.name}</td>
                    <td>${t.status.name}</td>
                    <td><a href="/task/update/${t.id}" class="btn btn-primary">Edit</a> / <a href="/task/delete/${t.id}" class="btn btn-danger" onclick="confirmDeleteTask(${t.id}, '${t.subject}')" >Delete</a> </td>

                </tr>
            </tbody>
            </c:forEach>

        </table>

</div>

</body>
</html>
