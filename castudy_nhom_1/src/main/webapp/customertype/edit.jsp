<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 04-11-2023
  Time: 12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="bootstrap-5.1.3/js/bootstrap.js"></script>
    <link rel="stylesheet" href=bootstrap-5.1.3/css/bootstrap.css>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>

<style>
    a {
        text-decoration: none;
    }

    .left1 {
        font-size: 14px;
        font-family: 'Roboto', sans-serif;
    }

    h3 {
        position: relative;
        border-bottom: 1px solid #e0e0e0;
        margin-bottom: 15px;
        display: block;
        color: #212529;
        transition: 0.3s linear;
        font-size: 22px;
        font-family: 'Roboto', sans-serif;
        text-transform: uppercase;
        font-weight: 600;
    }
    .b1{
        font-family: 'Roboto', sans-serif;
    }

</style>
<link rel="stylesheet" href="css_cs.css">

<script src="FBDBc3UVcAczrDS.jpeg"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-white px-5">
    <div class="container-fluid p-0">
        <div>
            <a class="navbar-brand" href="#">
                <img src="FBDBc3UVcAczrDS.jpeg" height="100" width="130"/></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
        <div style="margin: 0 auto">
            <div class="collapse navbar-collapse ">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li>
                        <a class="nav-link active" aria-current="page" href="#" style="color: black">Trang sức
                            bạc</a>
                    </li>
                    <li>
                        <a class="nav-link" href="#" style="color: black"> Trang sức vàng </a>
                    </li>
                    <li>
                        <a class="nav-link" href="#" style="color: black">Nhẫn cưới </a>
                    </li>
                    <li>
                        <a class="nav-link" href="#" style="color: black">Thành Viên </a>
                    </li>
                </ul>

            </div>

        </div>
        <div>

            <ul class="navbar-nav d-flex me-auto mb-2 mb-lg-0 right">
                <li>
                    <form class="d-flex" role="search">
                        <input class="form-control me-2" type="search" placeholder="Tìm kiếm" aria-label="Search">
                        <button class="btn " type="submit"><img src="icons8-search (1).gif" height="35" width="35"/>
                        </button>
                    </form>
                </li>
                <li class="nav-item " style="margin-right: 2%">
                    <img src="icons8-cart.gif" height="45" width="45"/>
                </li>
                <li class="nav-item " style="margin-right: 2%">
                    <img src="icons8-user-50.png" height="45" width="45"/></li>
            </ul>
        </div>
    </div>
</nav>

<div class="row m-4 ">
    <div class="col-md-2 col-sm-12 left1" style="background-color: #F5F4F4">
        <ul class="nav flex-column ">
            <li class="nav-item">
                <table>
                    <tr>
                        <td><img src="https://i.imgur.com/IERUO2e.png" height="15" width="14"/></td>
                        <td><a class="nav-link text-secondary" href="#">Thông tin tài khoản</a></td>
                    </tr>
                </table>
            </li>
            <li class="nav-item">
                <table>
                    <tr>
                        <td><img src="https://i.imgur.com/uvXA2cO.png" height="16" width="13"/></td>
                        <td><a class="nav-link text-secondary" href="#">Quản lý đơn hàng</a></td>
                    </tr>
                </table>
            </li>
            <li class="nav-item">
                <table>
                    <tr>
                        <td><img src="https://i.imgur.com/3tzjyCZ.png" height="16" width="13"/></td>
                        <td><a class="nav-link text-secondary" href="#">Giỏ hàng</a></td>
                    </tr>
                </table>
            </li>
            <li class="nav-item">
                <table>
                    <tr>
                        <td><img src="https://i.imgur.com/uvXA2cO.png" height="16" width="13"/></td>
                        <td><a class="nav-link text-secondary" href="#">Quản lý khách hàng</a></td>
                    </tr>
                </table>
            </li>
            <li class="nav-item">
                <table>
                    <tr>
                        <td><img src="https://i.imgur.com/uvXA2cO.png" height="16" width="13"/></td>
                        <td><a class="nav-link text-secondary" href="#">Quản lý sản phẩm</a></td>
                    </tr>
                </table>
            </li>
            <li class="nav-item">
                <table>
                    <tr>
                        <td><img src="https://i.imgur.com/vWZFj7q.png" height="16" width="13"/></td>
                        <td><a class="nav-link text-secondary" href="#">Loại sản phẩm</a></td>
                    </tr>
                </table>
            </li>
            <li class="nav-item">
                <table>
                    <tr>
                        <td><img src="https://i.imgur.com/vWZFj7q.png" height="16" width="13"/></td>
                        <td><a class="nav-link text-secondary" href="#">Quản lý chất liệu</a></td>
                    </tr>
                </table>
            </li>
            <li class="nav-item">
                <table>
                    <tr>
                        <td><img src="https://i.imgur.com/vWZFj7q.png" height="16" width="13"/></td>
                        <td><a class="nav-link text-secondary" href="#">Quản lý size</a></td>
                    </tr>
                </table>
            </li>


        </ul>
    </div>
    <div class="col-md-6 " style="float: right">
        <h3 style="margin-bottom: 10px">Chỉnh sửa loại khách</h3>
        <form method="post" class="b1">
            <div class="mb-3 row">
                <label class="col-sm-4 col-form-label" style="font-weight: bold">Mã loại khách<span
                        style="color: red">*</span></label>
                <div class="col-sm-8">
                    <p>${customerType.getCode()}</p>
                    <input name="code" value="${customerType.getCode()}" hidden="hidden">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="name" class="col-sm-4 col-form-label" style="font-weight: bold">Tên<span
                        style="color: red">*</span></label>
                <div class="col-sm-8">
                    <input type="text" name="name" value="${customerType.getName()}" class="form-control" id="name" required>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="des" class="col-sm-4 col-form-label" style="font-weight: bold">Ưu đãi<span
                        style="color: red">*</span></label>
                <div class="col-sm-8">
                    <input type="text" name="endow" value="${customerType.getEndow()}" class="form-control" id="des" style="height: 50px" required>
                </div>
            </div>

            <button type="submit" class="btn btn-danger" style="width: 23%; text-transform: uppercase;font-weight: 600 ; font-size: 12px;
            font-family: 'Roboto', sans-serif;">
                Lưu Chỉnh sửa
            </button>
        </form>
    </div>

</div>
</body>

</html>