package neu.edu.dao;

import neu.edu.entity.AccountData;
import neu.edu.entity.Post;
import java.sql.*;
import java.util.ArrayList;

public class UserDao {

    public boolean register(AccountData ad) throws SQLException {

        Connection conn = DatabaseConnector.getInstance().getConnection();
        String sql = "insert into users(firstName, middleName, lastName, gender, username, password, mobileNumber, email) values(?,?,?,?,?,md5(?),?,?)";

       try(PreparedStatement pstmt = conn.prepareStatement(sql)){
           pstmt.setString(1, ad.getFirstName());
           pstmt.setString(2, ad.getMiddleName());
           pstmt.setString(3, ad.getLastName());
           pstmt.setString(4, ad.getGender());
           pstmt.setString(5, ad.getUsername());
           pstmt.setString(6, ad.getPassword());
           pstmt.setString(7, ad.getMobileNumber());
           pstmt.setString(8, ad.getEmail());
           pstmt.executeUpdate();
       }catch (SQLException e){
           System.out.println(e.getMessage());
           conn.close();
           return false;
        }
        conn.close();
        return true;
    }

    public boolean login(String userName, String password) throws SQLException {
        Connection conn = DatabaseConnector.getInstance().getConnection();
        boolean status = false;
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
            ps.setString(1, userName);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            status = rs.next();
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
}
