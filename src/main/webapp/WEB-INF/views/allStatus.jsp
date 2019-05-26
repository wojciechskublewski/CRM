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
    <title>All statuses</title>
</head>
<body>
        <table>

        <c:forEach items="${statutes}" var="status">
            <td>${status.name}</td>
            <td>${status.activity}</td>
            <td>${status.sorting}</td>
        </c:forEach>

        </table>
</body>
</html>
