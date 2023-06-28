package dao;

import Module.User;

import java.sql.SQLException;
import java.util.List;

public class UserDAO implements IUserDAO{
    private String jdbcURL = "jdbc:mysql://localhost:3306/movie?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456";
    // mấy cái này sang máy ai thì đổi sau nhé
    @Override
    public void insertUser(User user) throws SQLException {
    }

    @Override
    public User selectUser(int id) {
        return null;
    }

    @Override
    public List<User> selectAllUsers() {
        return null;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return false;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return false;
    }
}
