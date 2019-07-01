<%--
  Created by IntelliJ IDEA.
  User: wskublewski
  Date: 25.05.19
  Time: 16:03
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

    <title>All projects</title>
</head>
<body>
<%@include file="navbar.jspf" %>

<header class="bg-success">
    <h1 class="text-center">All Projects</h1>
</header>

<div class="container">
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">Project name</th>
            <th scope="col">Project description</th>
            <th scope="col">Http</th>
            <th scope="col">Users</th>
            <th scope="col">Tasks</th>
            <th scope="col">Status</th>
            <th scope="col">Edit/Delete</th>
        </tr>
        </thead>

    <c:forEach items="${projects}" var="projects">
        <tbody>
        <tr>
            <td>${projects.name}</td>
            <td>${projects.description}</td>
            <td>${projects.web}</td>
            <td>
                <c:forEach items="${projects.users}" var="u">
                    ${u.login}<br/>
                </c:forEach>
            </td>
            <td>
                <c:forEach items="${projects.tasks}" var="t">
                    <a href="/task/${t.id}" class="badge badge-primary">${t.subject}</a> <br/>
                </c:forEach>

            </td>
            <td>${projects.active}</td>
            <td><a href="/project/update/${projects.id}" class="btn btn-primary">Edit</a>  <a href="#" class="btn btn-danger" onclick="confirmDeleteProject(${projects.id}, '${projects.name}')" >Delete</a> </td>

        </tr>
        </tbody>

    </c:forEach>
    </table>
</div>
</body>
</html>
