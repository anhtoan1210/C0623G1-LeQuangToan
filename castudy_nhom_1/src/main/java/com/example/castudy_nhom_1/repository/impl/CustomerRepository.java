package com.example.castudy_nhom_1.repository.impl;

import com.example.castudy_nhom_1.model.CustomerType;
import com.example.castudy_nhom_1.repository.BaseRepository;
import com.example.castudy_nhom_1.repository.ICustomerTypeRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerTypeRepository {
    private static final String GET_ALL = "select * from loai_khach";
    private static final String ADD = "insert into loai_khach(ma_loai_khach_hang,ten_loai_khach,phan_tram_uu_dai) values(?,?,?);";
    private static final String EDIT = "update loai_khach set ma_loai_khach_hang= ?,ten_loai_khach= ?, phan_tram_uu_dai= ? where id =?";
    private static final String DELETE = "select * from loai_khach";
    private static final String CUSTOMER_TYPE_DETAILS = "select loai_khach.ma_loai_khach_hang,loai_khach.ten_loai_khach,loai_khach.phan_tram_uu_dai from loai_khach where id = ?";


    @Override
    public List<CustomerType> getAll() throws SQLException {
        Connection connection = BaseRepository.getConnection();
        List<CustomerType> customerType = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(GET_ALL);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String code = resultSet.getString("ma_loai_khach_hang");
                String name = resultSet.getString("ten_loai_khach");
                int endow = resultSet.getInt("phan_tram_uu_dai");
                CustomerType customer = new CustomerType(id, code, name, endow);
                customerType.add(customer);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return customerType;
    }

    @Override
    public void addCustomerType(CustomerType customerType) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD);
            preparedStatement.setString(1, customerType.getCode());
            preparedStatement.setString(2, customerType.getName());
            preparedStatement.setInt(3, customerType.getEndow());
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void deleteCustomerType(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE ");
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void editCustomerType(CustomerType customerType) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(EDIT);
            preparedStatement.setString(1, customerType.getCode());
            preparedStatement.setString(2, customerType.getName());
            preparedStatement.setInt(3, customerType.getEndow());
            preparedStatement.setInt(4, customerType.getId());
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public CustomerType customerType(int id) {
        Connection connection = BaseRepository.getConnection();
        CustomerType customerType = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(CUSTOMER_TYPE_DETAILS);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String code = resultSet.getString("ma_loai_khach_hang");
                String name = resultSet.getString("ten_loai_khach");
                int endow = resultSet.getInt("phan_tram_uu_dai");
                customerType = new CustomerType(code,name,endow);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return customerType;
    }
}

