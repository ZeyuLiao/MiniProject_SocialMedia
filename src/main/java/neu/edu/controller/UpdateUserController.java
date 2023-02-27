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

@WebServlet("/updateAccountData")
public class UpdateUserController extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if("updateProfile".equals(req.getParameter("case")) ){
            AccountData ad = new AccountData();
            ad.setFirstName(req.getParameter("firstName"));
            ad.setMiddleName(req.getParameter("middleName"));
            ad.setLastName(req.getParameter("lastName"));
            ad.setGender(req.getParameter("gender"));
            ad.setMobileNumber(req.getParameter("mobileNumber"));
            ad.setEmail(req.getParameter("email"));
            ad.setUsername(req.getParameter("username"));

            UserDao userDao = new UserDao();
            try {
                userDao.updateUser(ad);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            resp.sendRedirect("profile");

        }else {
            UserDao userDao = new UserDao();
            try {
                userDao.resetPassword(req.getParameter("username"),req.getParameter("password"));
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            resp.sendRedirect("logout");
        }
    }


    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
