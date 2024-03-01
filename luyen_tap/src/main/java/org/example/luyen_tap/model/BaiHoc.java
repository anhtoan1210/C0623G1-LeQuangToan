package org.example.luyen_tap.model;

public class BaiHoc {
    private Integer maBaiHoc;
    private Integer maLoaiBaiHoc;

    private Integer doKho;
    private Integer module;
    private String link;

    public BaiHoc() {
    }

    public BaiHoc(Integer maLoaiBaiHoc, Integer doKho, Integer module, String link) {
        this.maLoaiBaiHoc = maLoaiBaiHoc;
        this.doKho = doKho;
        this.module = module;
        this.link = link;
    }

    public BaiHoc(Integer maBaiHoc, Integer maLoaiBaiHoc, Integer doKho, Integer module, String link) {
        this.maBaiHoc = maBaiHoc;
        this.maLoaiBaiHoc = maLoaiBaiHoc;
        this.doKho = doKho;
        this.module = module;
        this.link = link;
    }

    public Integer getMaBaiHoc() {
        return maBaiHoc;
    }

    public void setMaBaiHoc(Integer maBaiHoc) {
        this.maBaiHoc = maBaiHoc;
    }

    public Integer getMaLoaiBaiHoc() {
        return maLoaiBaiHoc;
    }

    public void setMaLoaiBaiHoc(Integer maLoaiBaiHoc) {
        this.maLoaiBaiHoc = maLoaiBaiHoc;
    }

    public Integer getDoKho() {
        return doKho;
    }

    public void setDoKho(Integer doKho) {
        this.doKho = doKho;
    }

    public Integer getModule() {
        return module;
    }

    public void setModule(Integer module) {
        this.module = module;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }
}
