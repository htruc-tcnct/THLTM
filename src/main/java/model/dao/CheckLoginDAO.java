package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.*;

public class CheckLoginDAO {
	

	public String isExistUser(String username, String password) throws ClassNotFoundException, SQLException {
	    // Thông tin cơ sở dữ liệu
	    String DB_URL = "jdbc:mysql://localhost:3306/dulieu?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
	    String DB_USER = "root";
	    String DB_PASSWORD = "";

	    // Đảm bảo driver được tải
	    Class.forName("com.mysql.cj.jdbc.Driver");

	    // Sử dụng try-with-resources để quản lý tài nguyên
	    try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
	        // Kiểm tra trong bảng admin
	        String sqlAdmin = "SELECT * FROM admin WHERE username = ? AND password = ?";
	        try (PreparedStatement statementAdmin = con.prepareStatement(sqlAdmin)) {
	            statementAdmin.setString(1, username);
	            statementAdmin.setString(2, password);

	            try (ResultSet resultSetAdmin = statementAdmin.executeQuery()) {
	                if (resultSetAdmin.next()) {
	                    return "admin"; // Nếu tìm thấy trong admin
	                }
	            }
	        }

	        // Kiểm tra trong bảng users
	        String sqlUser = "SELECT * FROM users WHERE username = ? AND password = ?";
	        try (PreparedStatement statementUser = con.prepareStatement(sqlUser)) {
	            statementUser.setString(1, username);
	            statementUser.setString(2, password);

	            try (ResultSet resultSetUser = statementUser.executeQuery()) {
	                if (resultSetUser.next()) {
	                    return "user"; // Nếu tìm thấy trong users
	                }
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw e; // Để thông báo lỗi cụ thể cho bên gọi phương thức
	    }

	    // Không tìm thấy
	    return null;
	}

}
