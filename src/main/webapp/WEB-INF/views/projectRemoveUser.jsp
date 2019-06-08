<%--
  Created by IntelliJ IDEA.
  User: wskublewski
  Date: 30.05.19
  Time: 06:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

            ${project.name}: <br>
            <c:forEach items="${users}" var="users">

                ${users.login} <a href="/project/delete/user/${project.id}/${users.id}" name="${users.id}" > Delete </a><br/>  <br/>


            </c:forEach>

</body>
</html>
