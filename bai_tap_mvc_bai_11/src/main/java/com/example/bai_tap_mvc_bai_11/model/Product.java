package com.example.bai_tap_mvc_bai_11.model;

public class Product {
    int id;
    String name;
    int price;
    String description;
    String manufacturer;

    public Product() {
    }

    public Product(int id, String name, int price, String description, String manufacturer) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.manufacturer = manufacturer;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int quantity) {
        this.price = quantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }
}
