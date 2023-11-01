package com.example.bai_tap_mvc_bai_11.controller;

import com.example.bai_tap_mvc_bai_11.model.Product;
import com.example.bai_tap_mvc_bai_11.service.impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductController", value = "/product")
public class ProductController extends HttpServlet {
    private final ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showAddForm(request, response);
                break;
            case "searchId":
                searchId(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "searchName":
                searchName(request, response);
                break;
            case "delete":
                removeProduct(request, response);
                break;
            default:
                showAll(request, response);
                break;
        }
    }

    private void showAll(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.findAll();
        request.setAttribute("productList", productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/product/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void searchId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("name"));
        int index = getIndex(id);
        if (index != -1) {
            Product product = productService.findAll().get(index);
            request.setAttribute("product", product);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/product/search_by_id.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/product/not_found_product.jsp");
            requestDispatcher.forward(request, response);
        }

    }
    private void removeProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int index = getIndex(id);
        productService.delete(index);
        response.sendRedirect("/product");

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "add":
                add(request, response);
                break;
            case "edit":
                edit(request, response);
                break;


            default: showAll(request, response);
                break;
        }
    }


    private void edit(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name  = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        String description = request.getParameter("description");
        String manufacturer = request.getParameter("manufacturer");

        Product product = new Product(id,name,price,description,manufacturer);
        int index = getIndex(id);

        productService.edit(index, product);
        response.sendRedirect("/product");
    }


    private void add(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        String description = request.getParameter("description");
        String manufacturer = request.getParameter("manufacturer");
        productService.add(new Product(id, name, price, description, manufacturer));

        response.sendRedirect("/product");

    }


    private int getIndex(int id) {
        int index = -1;
        for (int i = 0; i < productService.findAll().size(); i++) {
            if (productService.findAll().get(i).getId() == id) {
                index = i;
                break;
            }
        }
        return index;
    }

    private void searchName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        List<Product> products = productService.findByName(name);
        if(products.size() != 0){
            request.setAttribute("product",products);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/product/search_by_name.jsp");
            requestDispatcher.forward(request, response);
        }else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/product/not_found_product.jsp");
            requestDispatcher.forward(request, response);
        }


    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int index = getIndex(id);
        Product product = productService.findAll().get(index);
        request.setAttribute("product",product);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/product/edit.jsp");
        requestDispatcher.forward(request, response);
    }


   


    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/product/add.jsp");
        requestDispatcher.forward(request, response);
    }

}
