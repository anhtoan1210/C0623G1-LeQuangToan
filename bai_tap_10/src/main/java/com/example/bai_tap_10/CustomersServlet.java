package com.example.bai_tap_10;

import com.example.bai_tap_10.Customers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "com.example.bai_tap_10.CustomersServlet", value = "/customers")
public class CustomersServlet extends HttpServlet {
    private static List<Customers> customersList = new ArrayList<>();

    static {
        customersList.add(new Customers("Mai Văn Hoàng", "1983-08-20", "Hà Nội", "https://i.imgur.com/DnpgUpt.jpg"));
        customersList.add(new Customers("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "https://i.imgur.com/DnpgUpt.jpg"));
        customersList.add(new Customers("Nguyễn Thái Hoà", "1983-08-22", "Nam Định", "https://i.imgur.com/DnpgUpt.jpg"));
        customersList.add(new Customers("Trần Văn Khoa", "1983-08-17", "Hà Tây", "https://i.imgur.com/DnpgUpt.jpg"));
        customersList.add(new Customers("Ngyễn Đình Thi", "1983-08-19", "Hà Nội", "https://i.imgur.com/DnpgUpt.jpg"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customersList", customersList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("list.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
