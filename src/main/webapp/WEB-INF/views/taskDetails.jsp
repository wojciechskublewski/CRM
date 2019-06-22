<%--
  Created by IntelliJ IDEA.
  User: wskublewski
  Date: 21.06.19
  Time: 17:43
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

    <title>Title</title>
</head>
<body>

<%@include file="navbar.jspf" %>

<header class="bg-primary">
    <h1 class="text-center">TASK Details</h1>
</header>



    <div class="card border-primary mx-auto" style="max-width: 30rem;">
        <div class="card-header">Task</div>
        <div class="card-body text-primary">
            <h4 class="card-title">Task deatils</h4>
            <p class="card-text">Subject: ${task.subject}</p>
            <p class="card-text">Description: ${task.description}</p>
            <p></p>
            <p class="card-text">Date: ${task.date}</p>
            <p class="card-text">User:${task.user.login}</p>
            <p class="card-text">Priority: ${task.priority.name}</p>
            <p class="card-text">Status: ${task.status.name}</p>
        </div>

        <a href="/task/update/${task.id}" class="mx-auto btn btn-success">Edit</a>  <a href="#" class="mx-auto btn btn-danger" onclick="confirmDeleteTask(${task.id}, '${task.subject}')">Delete</a>
</div>
</body>
</html>
