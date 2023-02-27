package neu.edu.dao;

import neu.edu.entity.AccountData;

import java.sql.*;
import java.util.ArrayList;

public class UserDao {

    public boolean register(AccountData ad) throws SQLException {

        Connection conn = MysqlConnector.getInstance().getConnection();
        String sql = "insert into users(firstName, middleName, lastName, gender, username, password, mobileNumber, email) values(?,?,?,?,?,?,?,?)";

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, ad.getFirstName());
            pstmt.setString(2, ad.getMiddleName());
            pstmt.setString(3, ad.getLastName());
            pstmt.setString(4, ad.getGender());
            pstmt.setString(5, ad.getUsername());
            pstmt.setString(6, ad.getPassword());
            pstmt.setString(7, ad.getMobileNumber());
            pstmt.setString(8, ad.getEmail());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            conn.close();
            return false;
        }
        conn.close();
        return true;
    }

    public boolean login(String username, String password) throws SQLException {
        Connection conn = MysqlConnector.getInstance().getConnection();
        boolean status = false;
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            status = rs.next();
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }

    public AccountData getUser(String username) throws SQLException {
        Connection conn = MysqlConnector.getInstance().getConnection();
        String sql = "SELECT firstName, middleName, lastName, gender, username, password, mobileNumber, email FROM users WHERE username = ?";
        AccountData ad = null;
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                String firstName = rs.getString("firstName");
                String middleName = rs.getString("middleName");
                String lastName = rs.getString("lastName");
                String gender = rs.getString("gender");
                String mobileNumber = rs.getString("mobileNumber");
                String email = rs.getString("email");
                ad = new AccountData(firstName, middleName, lastName, gender, username, null, mobileNumber, email);
            }
        }
        return ad;
    }

    public ArrayList<AccountData> getAllUsers() throws SQLException {
        Connection conn = MysqlConnector.getInstance().getConnection();
        ArrayList<AccountData> accountList = new ArrayList<>();
        String query = "SELECT * FROM users";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        while (rs.next()) {
            AccountData accountData = new AccountData();
            accountData.setFirstName(rs.getString("firstName"));
            accountData.setMiddleName(rs.getString("middleName"));
            accountData.setLastName(rs.getString("lastName"));
            accountData.setGender(rs.getString("gender"));
            accountData.setUsername(rs.getString("username"));
            accountData.setMobileNumber(rs.getString("mobileNumber"));
            accountData.setEmail(rs.getString("email"));
            accountList.add(accountData);
        }
        return accountList;
    }

    public void deleteUserByUsername(String username) throws SQLException {
        Connection conn = MysqlConnector.getInstance().getConnection();
        String query = "DELETE FROM users WHERE username = ?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, username);
        stmt.executeUpdate();
    }

    public void updateUser(AccountData ad) throws SQLException {
        Connection conn = MysqlConnector.getInstance().getConnection(); // get connection
        PreparedStatement pstmt = conn.prepareStatement("UPDATE users SET firstName = ?, middleName = ?, lastName = ?, gender = ?, mobileNumber = ?, email = ? WHERE username = ?");

        // Set parameters
        pstmt.setString(1, ad.getFirstName());
        pstmt.setString(2, ad.getMiddleName());
        pstmt.setString(3, ad.getLastName());
        pstmt.setString(4, ad.getGender());
        pstmt.setString(5, ad.getMobileNumber());
        pstmt.setString(6, ad.getEmail());
        pstmt.setString(7, ad.getUsername());

        // Execute update statement
        pstmt.executeUpdate();

        // Close connection and statement
        pstmt.close();
        conn.close();

    }

    public void resetPassword(String username, String password) throws SQLException {
        Connection conn = MysqlConnector.getInstance().getConnection(); // get connection
        PreparedStatement pstmt = conn.prepareStatement("UPDATE users SET password = ? WHERE username = ?");

        // Set parameters
        pstmt.setString(1, password);
        pstmt.setString(2, username);

        // Execute update statement
        pstmt.executeUpdate();

        // Close connection and statement
        pstmt.close();
        conn.close();

    }


}
