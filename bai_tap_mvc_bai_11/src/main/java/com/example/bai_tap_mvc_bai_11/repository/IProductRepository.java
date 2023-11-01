package com.example.bai_tap_mvc_bai_11.repository;

import com.example.bai_tap_mvc_bai_11.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();

    void add(Product product);


    void delete(int id);

    void edit(int id, Product product);


    Product detail(int index);

    List<Product> findByName(String name);

}
