package com.example.bai_tap_mvc_bai_11.repository.impl;

import com.example.bai_tap_mvc_bai_11.model.Product;
import com.example.bai_tap_mvc_bai_11.repository.IProductRepository;

import java.util.List;


public class ProductRepository implements IProductRepository {

    @Override
    public List<Product> findAll() {
        return null;
    }

    @Override
    public void add(Product product) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public void edit(int id, Product product) {

    }

    @Override
    public Product detail(int id) {
        return null;
    }

    @Override
    public List<Product> findByName(String name) {
        return null;
    }
}
