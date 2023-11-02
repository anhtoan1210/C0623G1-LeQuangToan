package com.example.bai_tap_12.repository;

import com.example.bai_tap_12.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUsers();
    public List<User> selectAllUsersByCountry(String nameCountry);

    public boolean deleteUser(int id);

    public boolean updateUser(User user);
}
