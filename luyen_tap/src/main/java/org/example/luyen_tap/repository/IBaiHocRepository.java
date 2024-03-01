package org.example.luyen_tap.repository;

import java.util.List;

public interface IBaiHocRepository {
    List<BaiHocDto> hienThiDanhSach();

    void themMoi(BaiHoc baiHoc);

    void xoa(int baiHoc);

    void capNhat(BaiHoc baiHoc);

    BaiHoc baiHoc(int maBaiHoc);

    List<BaiHocDto> timKiem(String ten);
}
