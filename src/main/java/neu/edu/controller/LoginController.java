package neu.edu.controller;

import neu.edu.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;


@WebServlet("/login")
public class LoginController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        UserDao ud = new UserDao();
        try {
            if(ud.login(request.getParameter("username"),request.getParameter("password"))){
                request.getSession().setAttribute("loginUsername",request.getParameter("username"));
                response.sendRedirect("controller");
            }
            else{
                request.setAttribute("errorType","loginError");
                request.setAttribute("errorMsg","Wrong username or password");
                request.getRequestDispatcher("post").forward(request,response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        doGet(request,response);
    }

}
