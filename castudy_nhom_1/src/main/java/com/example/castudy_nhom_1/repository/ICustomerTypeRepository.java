package com.example.castudy_nhom_1.repository;

import com.example.castudy_nhom_1.model.CustomerType;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerTypeRepository {
    List<CustomerType> getAll() throws SQLException;

    void addCustomerType(CustomerType customerType);

    void deleteCustomerType(int id);

    void editCustomerType(CustomerType customerType) throws SQLException;

    CustomerType customerType(int id);
}
