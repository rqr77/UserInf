import domain.PageBean;
import domain.User;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Soundbank;
import java.io.IOException;
import java.util.Map;

@WebServlet("/FindUserByPageServlet")
public class FindUserByPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String currentPage = request.getParameter("currentPage");
        String rows = request.getParameter("rows");
        if (currentPage==null || currentPage.equals("")){
            currentPage="1";
        }
        if (rows==null || rows.equals("")){
            rows="5";
        }
        Map<String, String[]> map = request.getParameterMap();
        UserServiceImpl service = new UserServiceImpl();
        PageBean<User> pageBean = service.findUserByPage(Integer.parseInt(currentPage), Integer.parseInt(rows),map);
        request.setAttribute("pagebean",pageBean);
        request.setAttribute("map",map);
        request.getRequestDispatcher("/list.jsp").forward(request,response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
