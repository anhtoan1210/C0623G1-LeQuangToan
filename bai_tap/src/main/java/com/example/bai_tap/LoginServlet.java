package com.example.bai_tap;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if ("admin".equals(username) && "123abc".equals(password)) {
            LocalDateTime time= LocalDateTime.now();
            request.setAttribute("time", time);
           RequestDispatcher requestDispatcher = request.getRequestDispatcher("success.jsp");
           requestDispatcher.forward(request, response);
        } else {
            response.sendRedirect("/index.jsp");

        }
    }
    }
//    String error="Đăng nhập thất bại";
//            request.setAttribute("error",error);
//                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("false.jsp");
//                    requestDispatcher.forward(request, response);

