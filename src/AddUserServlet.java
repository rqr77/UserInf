import domain.User;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //获取参数
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        int age = Integer.parseInt(request.getParameter("age")) ;
        String birthplace = request.getParameter("birthplace");
        String qq = request.getParameter("qq");
        String email = request.getParameter("email");
        User newuser = new User();
        newuser.setName(name);
        newuser.setGender(gender);
        newuser.setAge(age);
        newuser.setAddress(birthplace);
        newuser.setQq(qq);
        newuser.setEmail(email);
        UserServiceImpl service=new UserServiceImpl();
        service.add(newuser);
        /*Map<String, String[]> map = request.getParameterMap();*/
        response.sendRedirect(request.getContextPath()+"/UserListServlet");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
