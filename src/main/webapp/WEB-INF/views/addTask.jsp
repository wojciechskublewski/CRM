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
    <title>Title</title>
</head>
<body>
    <form:form modelAttribute="task" method="post">
        <form:input path="subject"/>
        <form:select path="status.id" items="${statuses}" itemLabel="name" itemValue="id"/>
        <form:select path="priority.id" items="${priorities}" itemLabel="name" itemValue="id"/>
        <input type="submit" value="Save">
    </form:form>
</body>
</html>
