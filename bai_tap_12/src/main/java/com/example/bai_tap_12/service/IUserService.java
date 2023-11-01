package com.example.bai_tap_12.service;

import com.example.bai_tap_12.model.User;

import java.util.List;

public interface IUserService {
    public void insertUser(User user);

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id);

    public boolean updateUser(User user);
}
