import domain.User;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        int id =Integer.parseInt(request.getParameter("id")) ;
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        int age = Integer.parseInt(request.getParameter("age")) ;
        String address = request.getParameter("address");
        String qq = request.getParameter("qq");
        String email = request.getParameter("email");


        User updateuser = new User();

        updateuser.setId(id);
        updateuser.setName(name);
        updateuser.setGender(gender);
        updateuser.setAge(age);
        updateuser.setAddress(address);
        updateuser.setQq(qq);
        updateuser.setEmail(email);
        UserServiceImpl service=new UserServiceImpl();
        service.update(updateuser);
        response.sendRedirect(request.getContextPath()+ "/UserListServlet");




    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
