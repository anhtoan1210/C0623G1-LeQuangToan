package org.example.luyen_tap.service;

import java.util.List;

public interface IBaiHocService {
    List<BaiHocDto> hienThiDanhSach();

    void themMoi(BaiHoc baiHoc);

    void xoa(int maBaiHoc);

    BaiHoc chiTietBaiHoc(int maBaiHoc);

    void capNhat(BaiHoc baiHoc);

    List<BaiHocDto> timKiem(String ten);

}
