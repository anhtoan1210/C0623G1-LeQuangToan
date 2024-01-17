package com.example.bai_tap_12.repository.impl;

import com.example.bai_tap_12.model.User;
import com.example.bai_tap_12.repository.BaseRepository;
import com.example.bai_tap_12.repository.IUserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class
UserRepository implements IUserRepository {
    private static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, country) VALUES (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
    private static final String SELECT_ALL_USERS = "select * from users order by users.name";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";
    private static final String FIND_USERS_COUNTRY_SQL = "select * from users where users.country like ?";
    private static final String DELETE_USERS_SP_SQL = "call delete_by_id(?)";
    private static final String UPDATE_USERS_SP_SQL = "call update_user(?,?,?,?)";
    private static final String SELECT_ALL_SP_USERS = "call get_all()";


    @Override
    public void insertUser(User user) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        Connection connection = BaseRepository.getConnectDB();
        try (

                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();

            //sử dụng commit và rollback
            CallableStatement callableStatement1 = connection.prepareCall(INSERT_USERS_SQL);
            callableStatement1.setInt(1, user.getId());
            callableStatement1.executeUpdate();
            connection.commit();

        } catch (SQLException e) {
            try {
                connection.rollback();

            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
        }
    }


    @Override
    public User selectUser(int id) {
        User user = null;
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnectDB();

             CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_SP_USERS);) {
            System.out.println(callableStatement);
            ResultSet rs = callableStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return users;
    }

//    @Override
//    public List<User> selectAllUsers() {
//        List<User> users = new ArrayList<>();
//        try (Connection connection = BaseRepository.getConnectDB();
//
//             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
//            System.out.println(preparedStatement);
//            ResultSet rs = preparedStatement.executeQuery();
//
//            while (rs.next()) {
//                int id = rs.getInt("id");
//                String name = rs.getString("name");
//                String email = rs.getString("email");
//                String country = rs.getString("country");
//                users.add(new User(id, name, email, country));
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return users;
//    }

    @Override
    public List<User> selectAllUsersByCountry(String nameCountry) {
        List<User> users = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(FIND_USERS_COUNTRY_SQL)) {
            preparedStatement.setString(1, nameCountry);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                User user = new User(id, name, email, country);
                users.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return users;
    }

    @Override
    public boolean deleteUser(int id) {
        boolean rowDeleted;
        try (Connection connection = BaseRepository.getConnectDB();
             CallableStatement callableStatement = connection.prepareCall(DELETE_USERS_SP_SQL);) {
            callableStatement.setInt(1, id);
            rowDeleted = callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowDeleted;
    }

    @Override
    public boolean updateUser(User user) {
        boolean rowUpdated;
        try (Connection connection = BaseRepository.getConnectDB();
             CallableStatement callableStatement = connection.prepareCall(UPDATE_USERS_SP_SQL);) {
            callableStatement.setInt(1, user.getId());
            callableStatement.setString(2, user.getName());
            callableStatement.setString(3, user.getEmail());
            callableStatement.setString(4, user.getCountry());
            rowUpdated = callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowUpdated;
    }
}

//    @Override
//    public boolean deleteUser(int id) {
//        boolean rowDeleted;
//        try (Connection connection = BaseRepository.getConnectDB();
//             PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
//            statement.setInt(1, id);
//            rowDeleted = statement.executeUpdate() > 0;
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return rowDeleted;
//    }

//    @Override
//    public boolean updateUser(User user) {
//        boolean rowUpdated;
//        try (Connection connection = BaseRepository.getConnectDB(); PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
//            statement.setString(1, user.getName());
//            statement.setString(2, user.getEmail());
//            statement.setString(3, user.getCountry());
//            statement.setInt(4, user.getId());
//
//            rowUpdated = statement.executeUpdate() > 0;
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return rowUpdated;
//    }
//}
