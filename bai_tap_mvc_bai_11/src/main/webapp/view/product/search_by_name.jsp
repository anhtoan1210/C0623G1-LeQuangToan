<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 01-11-2023
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table class="table table-striped" >
<tr>
    <th>ID</th>
    <th>Tên</th>
    <th>Giá</th>
    <th>Mô Tả</th>
    <th>Nguồn gốc</th>
    <th>Edit</th>
    <th>Delete</th>
</tr>
<c:forEach items="${products}" var="product">
    <tr>
    <td>${product.id}</td>
    <td>${product.name}</td>
    <td>${product.price}</td>
    <td>${product.description}</td>
    <td>${product.manufacturer}</td>
    <td><a href="/product?action=edit&id=${product.getId()}">
        <button>Edit</button>
    </a></td>
        <td><a href="/product?action=delete&id=${product.getId()}">
            <button>Delete</button>
        </a></td>
    </tr>
</c:forEach>
</table>
<button type="button"><a href="/product">Back</a></button>
</body>
</html>
