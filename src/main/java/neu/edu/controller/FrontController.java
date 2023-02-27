package neu.edu.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/controller")
public class FrontController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if("admin".equals(req.getSession().getAttribute("loginUsername"))){
            req.getRequestDispatcher("admin").forward(req,resp);
        }
        else {
            req.getRequestDispatcher("post").forward(req,resp);
        }
    }
}
