package neu.edu.controller;

import neu.edu.dao.PostDao;
import neu.edu.entity.Post;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/post")
public class MainPageController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Post> postList;
        try {
            postList = new PostDao().getAllRootPosts();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("posts", postList);
        request.getRequestDispatcher("/WEB-INF/mainPage.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {
        doGet(request, response);
    }

}
