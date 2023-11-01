<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 01-11-2023
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/product?action=edit" method="post">
    <table>
        <tr>
            <td>ID</td>
            <td><input type="text" name = "id" value="${product.getId()}" readonly></td>
        <tr>
            <td>Name: </td>
            <td><input type="text" name="name" id="name" value="${product.getName()}"></td>
        </tr>
        <tr>
            <td>Price: </td>
            <td><input type="number" name="price" id="price" value="${product.getQuantity}"></td>
        </tr>
        <tr>
            <td>Description: </td>
            <td><input type="text" name="description" id="description" value="${product.getDescription()}"></td>
        </tr>
        <tr>
            <td>Manufacturer: </td>
            <td><input type="text" name="manufacturer" id="manufacturer" value="${product.getManufacturer()}"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Edit product"></td>
        </tr>
    </table>
</form>
</body>
</html>
