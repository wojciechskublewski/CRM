<%--
  Created by IntelliJ IDEA.
  User: wskublewski
  Date: 30.06.19
  Time: 07:58
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
        function confirmDeleteProject(id, name) {
            if (confirm("Do you want to delete a project '" + name + "'?")) {
                window.location.href = "/project/delete/" + id;
            }
        }
    </script>

    <title>Title</title>
</head>
<body>

<%@include file="navbar.jspf" %>


<div class="card border-primary mx-auto" style="max-width: 30rem;">
    <div class="card-header">Project</div>
    <div class="card-body text-primary">
        <h4 class="card-title">Project deatils</h4>
        <p class="card-text">Name: ${project.name}</p>
        <p class="card-text">Description: ${project.description}</p>
        <p></p>
        <p class="card-text">Date: ${project.date}</p>
        <p class="card-text">User:${project.users.login}</p>
        <p> class="card-text">Task:${project.tasks.subject}</p>
        <p class="card-text">Http: ${project.web}</p>
        <p class="card-text">Active: ${project.active}</p>
    </div>

    <a href="/project/update/${projects.id}" class="btn btn-primary">Edit</a>  <a href="#" class="btn btn-danger" onclick="confirmDeleteProject(${projects.id}, '${projects.name}')" >Delete</a>
</div>

</body>
</html>
