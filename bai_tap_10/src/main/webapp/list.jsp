<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 30-10-2023
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        img{
            width: 50px;
            height: 50px;
        }
    </style>
</head>
<body>
<h1>Danh sách khách hàng</h1>
<table class="table table-stripped">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>dateOfBirth</th>
        <th>address</th>
        <th>image</th>
    </tr>
<c:forEach items="${customersList}" var="customers" varStatus="status">
<tr>
    <td>${status.count}</td>
    <td>${customers.name}</td>
    <td>${customers.dateOfBirth}</td>
    <td>${customers.address}</td>
    <td><img src="${customers.image}" alt=""></td>
</tr>

</c:forEach>
</table>
</body>
</html>
