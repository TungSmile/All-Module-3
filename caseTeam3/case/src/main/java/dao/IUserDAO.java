package dao;
import Module.User;
import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
    public void insertUser(User user) throws SQLException;
    public User selectUser(int id);
    public List<User> selectAllUsers();
    public boolean updateUser(User user) throws SQLException;
    public boolean deleteUser(int id) throws SQLException;



}
