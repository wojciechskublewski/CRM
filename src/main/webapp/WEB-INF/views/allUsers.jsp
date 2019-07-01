<%--
  Created by IntelliJ IDEA.
  User: wskublewski
  Date: 25.05.19
  Time: 15:31
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
        function confirmDeleteUser(id, name) {
            if (confirm("Do you want to delete user '" + name + "'?")) {
                window.location.href = "/user/delete/" + id;
            }
        }
    </script>
    <title>All Users</title>
</head>
<body>
<%@include file="navbar.jspf" %>

<header class="bg-success">
    <h1 class="text-center">All USERS</h1>
</header>

    <div class="container">
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Login</th>
                <th scope="col">First Name</th>
                <th scope="col">Last Name</th>
            </tr>
            </thead>



            <c:forEach items="${userList}" var="userList">
                <tr scope="row">
                    <td>${userList.login}</td>
                    <td>${userList.firstName}</td>
                    <td>${userList.lastName}</td>
                    <td><a class="btn btn-primary" name="${userList.id}" href="/user/update/${userList.id}">Update</a>  <a name="${userList.id}" href="#" onclick="confirmDeleteUser(${userList.id}, '${userList.login}')" class="btn btn-danger" >Delete</a> </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
