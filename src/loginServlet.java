import dao.Userdata;
import domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String checkcode = request.getParameter("vercode");
        request.getSession().removeAttribute("vercode");
        String ground_truth = (String) request.getSession().getAttribute("verCode");
/*        System.out.println(username);
        System.out.println(checkcode );
        System.out.println(ground_truth );*/
        if (checkcode!=null && checkcode.equalsIgnoreCase(ground_truth)){
            Userdata userdata =new Userdata();
            List<User> list=userdata.findAll();
            for (User user : list) {
                System.out.println(user);
                String userUsername = user.getUsername();
                System.out.println(userUsername);
                if (userUsername!= null && userUsername.equals(username)){
                    //数据库中有该用户名
                    String userpassword = user.getPassword();
                    System.out.println(userpassword);
                    if (userpassword.equals(password)){
                        //数据库中有对应用户的密码
                        request.getSession().setAttribute("user",user);
                        response.sendRedirect(request.getContextPath()+ "/success.jsp");
                    }else{
                        request.setAttribute("msg_login","用户名或密码错误错误");
                        request.getRequestDispatcher(request.getContextPath()+ "/login.jsp");
                }

                }else{
                    request.setAttribute("msg_login","用户名或密码错误错误");
                    request.getRequestDispatcher( request.getContextPath()+ "/login.jsp");
                }

        }
        }else {
            request.setAttribute("msg_check","验证码错误");
            request.getRequestDispatcher(request.getContextPath()+ "/login.jsp");

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
