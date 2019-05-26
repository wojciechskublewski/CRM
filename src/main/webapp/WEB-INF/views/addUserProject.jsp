<%--
  Created by IntelliJ IDEA.
  User: wskublewski
  Date: 26.05.19
  Time: 12:40
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
        <form method="post">
            <form:select path="projectList" itemValue="id" itemLabel="name" items="${projectList}"/>
            <form:select path="users" items="${users}" itemLabel="login" itemValue="id"/>
            <input type="submit" value="Save">
        </form>
</body>
</html>
