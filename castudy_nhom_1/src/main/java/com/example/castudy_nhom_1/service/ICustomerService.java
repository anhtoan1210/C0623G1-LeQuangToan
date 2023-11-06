package com.example.castudy_nhom_1.service;

import com.example.castudy_nhom_1.model.CustomerType;

import java.util.List;

public interface ICustomerService {
    List<CustomerType> getAll();

    void addCustomerType(CustomerType customerType);

    void deleteCustomerType(int id);

    void edit(CustomerType customerType);

    CustomerType customerTypeDetails(int id);

}
