package dao;

import domain.User;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import dao.utils.JDBCutils;

import javax.sound.midi.Soundbank;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class Userdata implements UserDao {

    private JdbcTemplate mytemplate =new JdbcTemplate(JDBCutils.getDs());
    @Override
    public List<User> findAll() {
        String sql ="select * from userinf";
        List<User> list = mytemplate.query(sql, new BeanPropertyRowMapper<User>(User.class));
        return list;
    }

    @Override
    public void add(User user) {

        String sql ="insert into userinf values(null,?,?,?,?,?,?, null,null)";
        mytemplate.update(sql,user.getName(),user.getGender(),user.getAge(),user.getAddress()
        ,user.getQq(),user.getEmail());
    }

    @Override
    public void del(int id) {
        String sql ="delete from userinf where id=?";
        mytemplate.update(sql,id);
    }

    @Override
    public User findById(int id) {
        String sql ="select * from userinf where id=?";
        return mytemplate.queryForObject(sql,  new BeanPropertyRowMapper<User>(User.class),id);
    }

    @Override
    public void update(User user) {
        String sql ="update userinf set name=?,gender=?,age=?,address=?,qq=?,email=? where id =?";
        mytemplate.update(sql,user.getName(),user.getGender(),user.getAge(),user.getAddress(),user.getQq(),user.getEmail(),user.getId());
    }

    @Override
    public void delSelectUser(String[] boxes) {
        for (String box : boxes) {
            int box_id = Integer.parseInt(box);
            String sql ="select * from userinf where id=?";
            mytemplate.update(sql,box_id);

        }
    }

    @Override
    public int findTotalCount(Map<String, String[]> map) {
        String sql="select count(*) from userinf where 1=1 ";
        StringBuilder sb =new StringBuilder(sql);
        Set<String> keySet = map.keySet();
        List<Object> params = new ArrayList<Object>();
        System.out.println(keySet);
        for (String key : keySet) {
            if ("currentPage".equals(key) || "rows".equals(key)){
                continue;
            }
            String value = map.get(key)[0];
            System.out.println(value);
            if (value!=null && !"".equals(value)){
                sb.append(" and "+key+" like ? ");
                params.add( "%"+value+"%");
            }
        }
        System.out.println(sb);
        System.out.println(params);

        return mytemplate.queryForObject(sb.toString(),Integer.class,params.toArray());
    }

    public List<User> findByPage(int start, int rows, Map<String, String[]> map) {
        String sql ="select * from userinf  where 1 =1 ";
        StringBuilder sb=new StringBuilder(sql);
        Set<String> keySet = map.keySet();
        List<Object> params = new ArrayList<Object>();
        for (String key : keySet) {
            if ("currentPage".equals(key) || "rows".equals(key)){
                continue;
            }
            String value = map.get(key)[0];
            if (value!=null && !"".equals(value)){
                sb.append(" and "+key+" like ? ");
                params.add( "%"+value+"%");
            }
        }
        sb.append(" limit ?,? ");
        params.add(start);
        params.add(rows);
/*        System.out.println(params);
        System.out.println(sb);*/
        return mytemplate.query(sb.toString(), new BeanPropertyRowMapper<User>(User.class),params.toArray());



    }
}
