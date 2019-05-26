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
    <title>All Tasks</title>
</head>
<body>
        <table>
            <c:forEach items="${tasks}" var="t">
                <tr>
                    <td>${t.subject}</td>
                    <td>${t.date}</td>
                    <td>${t.project.name}</td>

                </tr>
            </c:forEach>

        </table>
</body>
</html>
