package com.example.bai_tap_11_mvc.service;

import com.example.bai_tap_11_mvc.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();
    void add(Product product);
    void delete(int id);
    void edit(int id,Product product);
    Product detail (int id);
    List<Product>findByName(String name);

}
