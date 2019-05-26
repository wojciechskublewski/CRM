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
    <title>All projects</title>
</head>
<body>
    <c:forEach items="${projects}" var="projects">
        ${projects.name}
    </c:forEach>
</body>
</html>
