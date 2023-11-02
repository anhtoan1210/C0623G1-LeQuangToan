package com.example.bai_tap_12.service.impl;

import com.example.bai_tap_12.model.User;
import com.example.bai_tap_12.repository.IUserRepository;
import com.example.bai_tap_12.repository.impl.UserRepository;
import com.example.bai_tap_12.service.IUserService;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    private IUserRepository userRepository = new UserRepository();
    @Override
    public void insertUser(User user) throws SQLException {
        userRepository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return userRepository.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) {
        return userRepository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) {
        return userRepository.updateUser(user);
    }

    @Override
    public List<User> searchCountry(String name) {
        return userRepository.selectAllUsersByCountry("%"+name+"%");
    }
}
