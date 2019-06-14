package dao;

import domain.User;

import java.util.List;
import java.util.Map;

public interface UserDao {
    public List<User> findAll();
    public void add(User user);
    public void del(int id);
    public User findById(int id);
    public void update(User user);
    public void delSelectUser(String[] boxes);
    public int findTotalCount(Map<String, String[]> map);
    public List<User> findByPage(int start, int rows, Map<String, String[]> map);
}
