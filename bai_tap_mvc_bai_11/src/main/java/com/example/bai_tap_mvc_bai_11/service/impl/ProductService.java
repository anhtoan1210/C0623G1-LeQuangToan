package com.example.bai_tap_mvc_bai_11.service.impl;

import com.example.bai_tap_mvc_bai_11.model.Product;
import com.example.bai_tap_mvc_bai_11.repository.IProductRepository;
import com.example.bai_tap_mvc_bai_11.repository.impl.ProductRepository;
import com.example.bai_tap_mvc_bai_11.service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private final IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public void add(Product product) {
        productRepository.add(product);
    }

    @Override
    public void delete(int id) {
        productRepository.delete(id);
    }

    @Override
    public void edit(int id, Product product) {
        productRepository.edit(id,product);
    }

    @Override
    public Product detail(int id) {
        return productRepository.detail(id);
    }

    @Override
    public List<Product> findByName(String name) {
        return productRepository.findByName(name);
    }
}
