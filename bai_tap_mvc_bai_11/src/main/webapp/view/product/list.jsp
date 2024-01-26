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
<%--<table>--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--        <th>Tên</th>--%>
<%--        <th>Số lượng</th>--%>
<%--        <th>Giá</th>--%>
<%--        <th>Mô tả</th>--%>
<%--        <th>Nguồn gốc</th>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <tbody>--%>

<%--<c:forEach var="p" items="${productList}">--%>
<%--<tr>--%>
<%--    <td>${p.id}</td>--%>
<%--    <td>${p.name}</td>--%>
<%--    <td>${p.price}</td>--%>
<%--    <td>${p.description}</td>--%>
<%--    <td>${p.manufacturer}</td>--%>
<%--</tr>--%>
<%--</c:forEach>--%>

<%--    </tbody>--%>
<%--</table>--%>
<body>
<button type="button"><a href="/product?action=add">Add new Product</a></button>
<br>
<form action="/product">
    <table class="table table-striped">
        <tr>
            <td><input hidden="hidden" type="text" name="action" value="searchId"></td>
            <td><input type="text" name="name">
                <button>Details By ID</button>
            </td>
        </tr>
    </table>
</form>
<form action="/product">
    <table class="table table-striped">
        <tr>
            <td><input hidden="hidden" type="text" name="action" value="searchName"></td>

            <td><input type="text" name="name">
                <button>Search By Name</button>
            </td>
        </tr>
    </table>
</form>
<br>
<table class="table table-striped">
    <tr>
        <th>Stt</th>
        <th>Mã</th>
        <th>Tên</th>
        <th>Số lượng</th>
        <th>Giá</th>
        <th>Mô tả</th>
        <th>Nguồn gốc</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items="${Product}" var="product" varStatus="toan">
        <tr>
            <td>${toan.count}</td>
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
</body>
</html>
</body>
</html>
