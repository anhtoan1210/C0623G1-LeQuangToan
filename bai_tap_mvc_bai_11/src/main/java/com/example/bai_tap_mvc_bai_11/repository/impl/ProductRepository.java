package com.example.bai_tap_mvc_bai_11.repository.impl;

import com.example.bai_tap_mvc_bai_11.model.Product;
import com.example.bai_tap_mvc_bai_11.repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;


public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "Wave", 20000000, "Ít hao xăng", "honda"));
        productList.add(new Product(2, "Sh", 100000000, "Ít hao xăng", "honda"));
        productList.add(new Product(3, "Lead", 40000000, "Ít hao xăng", "honda"));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void add(Product product) {
        productList.add(product);
    }

    @Override
    public void delete(int id) {
        productList.remove(id);
    }

    @Override
    public void edit(int id, Product product) {
        productList.set(id, product);
    }

    @Override
    public Product detail(int index) {
        return productList.get(index);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> searchList = new ArrayList<>();
        for (Product product:productList) {
            if(product.getName().contains(name)){
                searchList.add(product);
            }
        }
        return searchList;
    }
}
