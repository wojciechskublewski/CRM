<%--
  Created by IntelliJ IDEA.
  User: wskublewski
  Date: 29.05.19
  Time: 06:10
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
      <form:form method="post" modelAttribute="project">
            <form:input path="name"/>
            <input type="submit" value="Save">
      </form:form>
</body>
</html>
