import dao.Userdata;
import domain.User;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/UserListServlet")
public class UserListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Userdata userdata =new Userdata();
        List<User> list=userdata.findAll();
        System.out.println(list);
  /*      request.setCharacterEncoding("text/html;charset=utf-8");*/
        request.setAttribute("users",list);
        request.getRequestDispatcher("/list.jsp").forward(request,response);




    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
