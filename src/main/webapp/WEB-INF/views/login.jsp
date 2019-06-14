<%--
  Created by IntelliJ IDEA.
  User: wskublewski
  Date: 09.06.19
  Time: 05:29
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


    <title>include</title>
</head>

<%@include file="navbar.jspf" %>

<c:if test="${isLogged == null}">
    <h1>Witaj zaloguj sie!</h1>
    <br><br>
</c:if>


<c:if test="${isLogged == true}">
    <h1>Witaj ${userSesion.login}</h1>
    <br><br>
</c:if>


<form method="post">
    <div class="form-group justify-content-md-center col-md-5">
        <label for="login">Login</label>
        <input type="login" name="login" class="form-control" id="login" placeholder="Enter login">

    </div>
    <div class="form-group justify-content-md-center col-md-5">
        <label for="exampleInputPassword1" >Password</label>
        <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
    </div>
    <div class="form-group form-check">
        <input type="checkbox" class="form-check-input" id="exampleCheck1">
        <label class="form-check-label" for="exampleCheck1">Check me out</label>
    </div>

    <c:if test="${isLogged == false}">
        <div class="error">Login failed</div>
        <br><br>
    </c:if>

    <button type="submit" class="btn btn-primary">Submit</button>
</form>


</html>
