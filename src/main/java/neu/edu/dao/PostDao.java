package neu.edu.dao;

import neu.edu.entity.Post;

import java.sql.*;
import java.util.ArrayList;

public class PostDao {

    public ArrayList<Post> getAllRootPosts() throws SQLException {

        Connection conn = MysqlConnector.getInstance().getConnection();
        Statement stmt = conn.createStatement();
        ArrayList<Post> rootPosts = new ArrayList<>();
        String sql = "SELECT * FROM posts WHERE father_id IS NULL";
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            Post post = new Post(
                    rs.getString("id"),
                    rs.getString("father_id"),
                    rs.getString("from_name"),
                    rs.getString("to_name"),
                    rs.getString("datetime"),
                    rs.getString("content")
            );
            rootPosts.add(post);
        }
        rs.close();
        stmt.close();
        conn.close();
        return rootPosts;
    }

    public ArrayList<Post> getAllChildPosts(String father_id) throws SQLException {
        Connection conn = MysqlConnector.getInstance().getConnection();
        ArrayList<Post> commentsPosts = new ArrayList<>();
        String sql = "SELECT * FROM posts WHERE father_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, father_id);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            Post post = new Post(
                    rs.getString("id"),
                    rs.getString("father_id"),
                    rs.getString("from_name"),
                    rs.getString("to_name"),
                    rs.getString("datetime"),
                    rs.getString("content")
            );
            commentsPosts.add(post);
        }
        rs.close();
        pstmt.close();
        conn.close();
        return commentsPosts;
    }

    public Post getPostById(String id) throws SQLException {
        Connection conn = MysqlConnector.getInstance().getConnection();
        String sql = "SELECT * FROM posts WHERE id  = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        ResultSet rs = pstmt.executeQuery();
        Post post = null;
        if (rs.next()) {
            post = new Post(
                    rs.getString("id"),
                    rs.getString("father_id"),
                    rs.getString("from_name"),
                    rs.getString("to_name"),
                    rs.getString("datetime"),
                    rs.getString("content")
            );
        }
        return post;
    }

    public void addPost(String father_id, String from_name, String to_name, String content) throws SQLException {
        Connection conn = MysqlConnector.getInstance().getConnection();
        String sql = "INSERT INTO posts (father_id, from_name, to_name, content) VALUES (?, ?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, father_id);
        pstmt.setString(2, from_name);
        pstmt.setString(3, to_name);
        pstmt.setString(4, content);
        pstmt.executeUpdate();

    }


}
