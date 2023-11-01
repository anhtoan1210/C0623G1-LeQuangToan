package com.example.bai_tap_mvc_bai_11.service;

import com.example.bai_tap_mvc_bai_11.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();

    void add(Product product);

    void delete(int id);

    void edit(int id, Product product);

    Product detail(int id);

    List<Product> findByName(String name);
}
