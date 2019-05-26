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
    <title>All Priority</title>
</head>
<body>
        <table>
            <c:forEach items="${priorities}" var="p">
                <tr>
                    <td>${p.name}</td>
                    <td>${p.activity}</td>
                </tr>

            </c:forEach>

        </table>

</body>
</html>
