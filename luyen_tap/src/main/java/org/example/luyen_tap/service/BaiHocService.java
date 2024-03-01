package org.example.luyen_tap.service;

import java.util.List;

public class BaiHocService implements IBaiHocService {
    private IBaiHocRepository baiHocRepository = new BaiHocRepository();

    @Override
    public List<BaiHocDto> hienThiDanhSach() {
        return baiHocRepository.hienThiDanhSach();
    }

    @Override
    public void themMoi(BaiHoc baiHoc) {
        baiHocRepository.themMoi(baiHoc);
    }

    @Override
    public void xoa(int maBaiHoc) {
        baiHocRepository.xoa(maBaiHoc);
    }

    @Override
    public BaiHoc chiTietBaiHoc(int maBaiHoc) {
        return baiHocRepository.baiHoc(maBaiHoc);
    }

    @Override
    public void capNhat(BaiHoc baiHoc) {
        baiHocRepository.capNhat(baiHoc);
    }

    @Override
    public List<BaiHocDto> timKiem(String ten) {
       return baiHocRepository.timKiem("%"+ten+"%");
    }


}
