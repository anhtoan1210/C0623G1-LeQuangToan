package org.example.luyen_tap.controller;

import org.example.luyen_tap.model.BaiHoc;
import org.example.luyen_tap.model.BaiHocDto;
import org.example.luyen_tap.service.BaiHocService;
import org.example.luyen_tap.service.IBaiHocService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "BaiHocServlet", value = "/Bai-Hoc")
public class BaiHocServlet extends HttpServlet {
    private IBaiHocService baiHocService = new BaiHocService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "them":
                hienThiThem(req, resp);
                break;
            case "capnhat":
                hienThiCapNhat(req, resp);
                break;
            case "timkiem":
                timKiem(req, resp);
                break;
            default:
                hienThiDanhSach(req, resp);
                break;
        }
    }

    private void timKiem(HttpServletRequest req, HttpServletResponse resp) {
        String ten = req.getParameter("ten");
        List<BaiHocDto> baiHocDto = baiHocService.timKiem(ten);
        req.setAttribute("baiHocDto", baiHocDto);
        req.setAttribute("ten", ten);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/display.jsp");
        try {
            requestDispatcher.forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void hienThiDanhSach(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<BaiHocDto> baiHocDto = baiHocService.hienThiDanhSach();
        req.setAttribute("baiHocDto", baiHocDto);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("display.jsp");
        requestDispatcher.forward(req, resp);

    }

    private void hienThiCapNhat(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int maBaiHoc = Integer.parseInt(req.getParameter("maBaiHoc"));
        BaiHoc baiHoc = baiHocService.chiTietBaiHoc(maBaiHoc);
        req.setAttribute("baiHoc", baiHoc);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/update.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void hienThiThem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/create.jsp");
        requestDispatcher.forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "them":
                themMoiBaiHoc(req, resp);
                break;
            case "xoa":
                xoaBaiHoc(req, resp);
                break;
            case "capnhat":
                capNhatBaiHoc(req, resp);
                break;
        }
    }

    private void capNhatBaiHoc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int maBaiHoc = Integer.parseInt(req.getParameter("maBaiHoc"));
        int maLoaiBaiHoc = Integer.parseInt(req.getParameter("maLoaiBaiHoc"));
        int doKho = Integer.parseInt(req.getParameter("doKho"));
        int module = Integer.parseInt(req.getParameter("module"));
        String link = req.getParameter("link");
        BaiHoc baiHoc = new BaiHoc(maBaiHoc, maLoaiBaiHoc, doKho, module, link);
        baiHocService.capNhat(baiHoc);
        req.setAttribute("thong bao", "cap nhat thanh cong");
        req.setAttribute("baiHoc", baiHoc);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/update.jsp");
        requestDispatcher.forward(req, resp);

    }

    private void xoaBaiHoc(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int maBaiHoc = Integer.parseInt(req.getParameter("maBaiHoc"));
        baiHocService.xoa(maBaiHoc);
        req.setAttribute("thong bao", "xoa thanh cong");
        resp.sendRedirect("/Bai-Hoc");
    }

    private void themMoiBaiHoc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int maLoaiBaiHoc = Integer.parseInt(request.getParameter("maLoaiBaiHoc"));
        int doKho = Integer.parseInt(request.getParameter("doKho"));
        int module = Integer.parseInt(request.getParameter("module"));
        String link = request.getParameter("link");
        BaiHoc baiHoc = new BaiHoc(maLoaiBaiHoc, doKho, module, link);
        baiHocService.themMoi(baiHoc);
        request.setAttribute("thongBao", "Thêm mới thành công");
        request.setAttribute("baiHoc", baiHoc);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/create.jsp");
        requestDispatcher.forward(request, response);
    }
}

