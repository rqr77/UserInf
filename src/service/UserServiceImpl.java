package service;

import dao.Userdata;
import domain.PageBean;
import domain.User;

import java.util.List;
import java.util.Map;

public class UserServiceImpl implements UserService {
    private Userdata userdata=new Userdata();
    @Override
    public List<User> findAll() {
        //完成dao层

        return userdata.findAll();
    }

    @Override
    public void add(User user) {
        userdata.add(user);
    }
    @Override
    public void del(int id) {
        userdata.del(id);
    }
    @Override
    public User findById(int id) {
        return userdata.findById(id);
    }
    public void update(User user){
        userdata.update(user);
    }

    @Override
    public void delSelectUser(String[] boxes) {
        for (String box : boxes) {
            userdata.del(Integer.parseInt(box));

        }
    }

    @Override
    public PageBean<User> findUserByPage(int currentPage, int rows, Map<String, String[]> map) {
        PageBean<User> pageBean= new PageBean<>();
        pageBean.setCurrentPage(currentPage);
        pageBean.setRow(rows);
        int totalCount = userdata.findTotalCount(map);
        pageBean.setTotalCount(totalCount);
        int start = rows*(currentPage-1);
        List<User> list =  userdata.findByPage(start,rows,map);
        pageBean.setList(list);
        int totalPage =  (totalCount%rows)==0 ? (totalCount/rows): (totalCount/rows+1);
        System.out.println(totalPage);
        pageBean.setTotalPage(totalPage);
        return pageBean;
    }
}
