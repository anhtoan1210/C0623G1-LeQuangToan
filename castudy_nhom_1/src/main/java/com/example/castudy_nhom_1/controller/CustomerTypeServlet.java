package com.example.castudy_nhom_1.controller;

import com.example.castudy_nhom_1.model.CustomerType;
import com.example.castudy_nhom_1.service.impl.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerTypeServlet", value = "/customerType")
public class CustomerTypeServlet extends HttpServlet {
    CustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showAddForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            default:
                getAll(request, response);
                break;
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        CustomerType customerType = customerService.customerTypeDetails(id);
        request.setAttribute("customerType", customerType);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customertype/edit.jsp");
        requestDispatcher.forward(request, response);
    }

    private void getAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CustomerType> customerType = customerService.getAll();
        request.setAttribute("customerType", customerType);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customertype/display.jsp");
        requestDispatcher.forward(request, response);
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        int endow = Integer.parseInt(request.getParameter("endow"));
        CustomerType customerType = new CustomerType(id, code, name, endow);
        customerService.edit(customerType);
        request.setAttribute("Thông báo", "Câp nhật thành công");
        response.sendRedirect("/customerType");
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customertype/create.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                add(request, response);
                break;
            case "edit":
                edit(request, response);
                break;
            default:
                getAll(request, response);
                break;
        }
    }

    private void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        int endow = Integer.parseInt(request.getParameter("endow"));
        CustomerType customerType = new CustomerType(code, name, endow);
        customerService.addCustomerType(customerType);
        response.sendRedirect("/customerType");
    }
}
