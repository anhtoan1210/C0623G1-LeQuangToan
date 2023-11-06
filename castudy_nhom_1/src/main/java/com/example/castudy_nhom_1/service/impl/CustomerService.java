package com.example.castudy_nhom_1.service.impl;

import com.example.castudy_nhom_1.model.CustomerType;
import com.example.castudy_nhom_1.repository.ICustomerTypeRepository;
import com.example.castudy_nhom_1.repository.impl.CustomerRepository;
import com.example.castudy_nhom_1.service.ICustomerService;

import java.sql.SQLException;
import java.util.List;

public class CustomerService implements ICustomerService {
    private ICustomerTypeRepository customerTypeRepository = new CustomerRepository();

    @Override
    public List<CustomerType> getAll() {
        try {
            return customerTypeRepository.getAll();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void addCustomerType(CustomerType customerType) {
        customerTypeRepository.addCustomerType(customerType);

    }

    @Override
    public void deleteCustomerType(int id) {
        customerTypeRepository.deleteCustomerType(id);
    }

    @Override
    public void edit(CustomerType customerType) {
        try {
            customerTypeRepository.editCustomerType(customerType);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public CustomerType customerTypeDetails(int id) {
        return customerTypeRepository.customerType(id);
    }
}
