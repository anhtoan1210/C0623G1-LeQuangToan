package com.example.bai_tap_11_mvc.service.impl;

import com.example.bai_tap_11_mvc.model.Product;
import com.example.bai_tap_11_mvc.repository.ProductRepository;
import com.example.bai_tap_11_mvc.service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private final ProductRepository productRepository = new ProductRepository() {
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
            productRepository.edit(id, product);
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
}
