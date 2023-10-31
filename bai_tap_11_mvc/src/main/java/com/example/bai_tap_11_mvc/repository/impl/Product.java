package com.example.bai_tap_11_mvc.repository.impl;

import com.example.bai_tap_11_mvc.repository.ProductRepository;

import java.util.ArrayList;
import java.util.List;

public class Product implements ProductRepository {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "Gạo", 200000, "gạo ngon", "Nhà máygạo", 1));
        productList.add(new Product(1, "Thuốc lá", 200000, "thơm ngon", "Công ty thuốc lá"));
        productList.add(new Product(1, "Dầu ăn", 200000, " béo", "Công ty dầu media"));
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
        for(Product product: productList){
            if(product.getName().contains(name)){
                searchList.add(product);
            }
        }
        return searchList;
    }
}
