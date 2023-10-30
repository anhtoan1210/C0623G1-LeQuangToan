<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<form action="/Calculator" method="post">
    <input name="num1" placeholder="Enter number 1">
    <input name="num2" placeholder="Enter number 2">
    <button type="submit">Send</button>
</form>
</body>
</html>