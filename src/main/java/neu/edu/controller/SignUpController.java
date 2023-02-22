package neu.edu.controller;

import neu.edu.dao.UserDao;
import neu.edu.entity.AccountData;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/signup")
public class SignUpController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        RequestDispatcher rd = req.getRequestDispatcher("mainPage.jsp");
        rd.forward(req,resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        AccountData ad = new AccountData();
        ad.setFirstName(req.getParameter("firstName"));
        ad.setMiddleName(req.getParameter("middleName"));
        ad.setLastName(req.getParameter("lastName"));
        ad.setGender(req.getParameter("gender"));
        ad.setUsername(req.getParameter("username"));
        ad.setPassword(req.getParameter("password"));
        ad.setMobileNumber(req.getParameter("mobileNumber"));
        ad.setEmail(req.getParameter("email"));
        UserDao ud = new UserDao();
        try {
            if(ud.register(ad)){
                HttpSession session = req.getSession();
                session.setAttribute("username",ad.getUsername());
                req.getRequestDispatcher("/WEB-INF/registrationStatus.jsp").forward(req,resp);
                //resp.sendRedirect("/WEB-INF/registrationStatus.jsp");
            }
            else{
                req.setAttribute("errorType","duplicateUser");
                req.setAttribute("errorMsg","Username already exists");
                req.getRequestDispatcher("post").forward(req,resp);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
