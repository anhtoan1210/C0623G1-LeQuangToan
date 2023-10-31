package com.example.bai_tap_11_mvc.controller;

import com.example.bai_tap_11_mvc.model.Product;
import com.example.bai_tap_11_mvc.service.IProductService;
import com.example.bai_tap_11_mvc.service.impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProductController", value = "/ProductController")
public class ProductController extends HttpServlet {
    private final IProductService productService=new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
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
                delete(request, response);
                break;
            default: showAll(request, response);
                break;
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int index = getIndex(id);
        productService.delete(id);
        response.sendRedirect("/products");
    }


    private void searchId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("name"));
        int index = getIndex(id);
        if(index != -1){
            Product product = productService.findAll().get(index);
            request.setAttribute("product",product);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("");
            requestDispatcher.forward(request,response);
        }

    }


    @Override
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

    }

    private int getIndex(int id){
        return id;
    }


    private void add(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {


    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void showAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



    }
    private void searchName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }


}