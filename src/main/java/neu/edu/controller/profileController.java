package neu.edu.controller;

import neu.edu.dao.UserDao;
import neu.edu.entity.AccountData;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/profile")
public class profileController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDao userDao = new UserDao();
        String username = req.getSession().getAttribute("loginUsername").toString();
        AccountData profile = null;
        try {
            profile=userDao.getUser(username);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        req.setAttribute("profile",profile);
        req.getRequestDispatcher("/WEB-INF/profile.jsp").forward(req,resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
