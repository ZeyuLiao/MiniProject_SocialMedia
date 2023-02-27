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
import java.util.ArrayList;

@WebServlet("/admin")
public class AdminController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        UserDao ud = new UserDao();
        ArrayList<AccountData> accountlist = null;
        try {
            accountlist = ud.getAllUsers();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("accountlist",accountlist);
        request.getRequestDispatcher("/WEB-INF/admin.jsp").forward(request,response);
    }
}
