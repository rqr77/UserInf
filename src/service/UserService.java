package service;

import domain.PageBean;
import domain.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    /**
     *
     * @return
     */
    public List<User> findAll();
    public void add(User user);
    public void del(int id);
    public User findById(int id);
    public void update(User user);
    public void delSelectUser(String[] boxes);
    public PageBean<User> findUserByPage(int currentPage, int rows, Map<String, String[]> map);

}
