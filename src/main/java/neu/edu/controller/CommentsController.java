package neu.edu.controller;

import neu.edu.dao.PostDao;
import neu.edu.entity.Post;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/comment")
public class CommentsController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, java.io.IOException {

        ArrayList<Post> commentsList;
        try {
            commentsList = new PostDao().getAllChildPosts(request.getParameter("father_id"));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        Post post;
        try {
            post = new PostDao().getPostById(request.getParameter("father_id"));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        HttpSession session = request.getSession();
        session.setAttribute("primaryPost", post);
        session.setAttribute("comments", commentsList);
        request.getRequestDispatcher("/WEB-INF/comment.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            new PostDao().addPost(request.getParameter("father_id"), request.getParameter("from_name"), request.getParameter("to_name"), request.getParameter("content"));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        String father_id = request.getParameter("father_id");
        response.sendRedirect("comment?father_id=" + father_id);
    }
}
