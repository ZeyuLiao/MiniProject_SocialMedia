package neu.edu.controller;

import com.mongodb.MongoClient;
import neu.edu.dao.LikeDaoMongoDB;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/like")
public class LikeController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        ServletContext application = request.getServletContext();
        MongoClient mongoClient = (MongoClient) application.getAttribute("mongodbClient");
        LikeDaoMongoDB likeDao = new LikeDaoMongoDB(mongoClient);
        if(("like").equals(request.getParameter("action"))){
            likeDao.addLike(request.getParameter("userName"),request.getParameter("like_id"));
        }
        else likeDao.unlike(request.getParameter("userName"),request.getParameter("like_id"));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        doGet(request, response);
    }

}
