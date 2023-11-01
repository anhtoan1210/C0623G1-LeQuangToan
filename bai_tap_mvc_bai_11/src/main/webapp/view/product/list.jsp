<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 01-11-2023
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <thead>
    <tr>
        <th>Tên</th>
        <th>Số lượng</th>
    </tr>
    </thead>
    <tbody>
    <tr>
<c:forEach var="p" items="${productList}">
    <td>${p.name}</td>
    <td>${p.quantity}</td>
</c:forEach>
    </tr>
    </tbody>
</table>
</body>
</html>
