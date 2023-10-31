package com.example.bai_tap_11_mvc.model;

public class Product {
    int id;
    String name;
    int quantity;
    String description;
    String manufacturer;

    public Product() {
    }

    public Product(int id, String name, int quantity, String description, String manufacturer) {
        this.id = id;
        this.name = name;
        this.quantity = quantity;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
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

