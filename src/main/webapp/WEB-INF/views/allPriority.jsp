<%--
  Created by IntelliJ IDEA.
  User: wskublewski
  Date: 26.05.19
  Time: 10:05
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
        function confirmDeletePriority(id, name) {
            if (confirm("Do you want to delete a priority '" + name + "'?")) {
                window.location.href = "/priority/delete/" + id;
            }
        }
    </script>


    <title>All Priority</title>
</head>
<body>

        <table class="table table-striped">

            <thead>
            <tr>
                <th scope="col">Item</th>
                <th scope="col">Value</th>
                <th scope="col">Update</th>
            </tr>
            </thead>

            <c:forEach items="${priorities}" var="p">
                <tr scope="row">
                    <td>${p.name}</td>
                    <td>${p.activity}</td>
                    <td><a class="table-primary" name="${p.id}" href="/priority/update/${p.id}">Update</a> / <a name="${p.id}" href="#" onclick="confirmDeletePriority(${p.id}, '${p.name}')" class="btn btn-danger" >Delete</a> </td>
                </tr>
            </c:forEach>

        </table>

</body>
</html>
