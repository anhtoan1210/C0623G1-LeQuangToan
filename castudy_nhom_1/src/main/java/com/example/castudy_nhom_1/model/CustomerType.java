package com.example.castudy_nhom_1.model;

public class CustomerType {
    private int id;
    private String code;
    private String name;
    private int endow;

    public CustomerType() {
    }

    public CustomerType(String code, String name, int endow) {
        this.code = code;
        this.name = name;
        this.endow = endow;
    }

    public CustomerType(int id, String code, String name, int endow) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.endow = endow;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getEndow() {
        return endow;
    }

    public void setEndow(int endow) {
        this.endow = endow;
    }
}
