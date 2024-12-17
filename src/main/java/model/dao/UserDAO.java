package model.dao;

import java.util.ArrayList;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.bean.NhanVien;
import model.bean.User;

public class UserDAO {
	private Connection getConnection() throws SQLException {
		String url = "jdbc:mysql://localhost:3306/dulieu"; // Địa chỉ cơ sở dữ liệu
		String username = "root"; // Tên người dùng MySQL
		String password = ""; // Mật khẩu MySQL
		return DriverManager.getConnection(url, username, password);
	}

	public ArrayList<User> getDanhSachUser() {
		ArrayList<User> danhSachUser = new ArrayList<>();
		String query = "SELECT * FROM users";
		try (Connection conn = getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query)) {

			while (rs.next()) {
				String userName = rs.getString("username");
				String fullName = rs.getString("full_name");
				int age = rs.getInt("age");
				String phoneNumber = rs.getString("phone_number");
				User user = new User(userName, fullName, age, phoneNumber);
				danhSachUser.add(user);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return danhSachUser;
	}

	public ArrayList<User> getUserByField(String field, String value) {
		ArrayList<User> danhSachUser = new ArrayList<>();
		String query = null;
		switch (field) {
		case "full_name":
			query = "SELECT * FROM users WHERE full_name LIKE ?";
			break;
		case "phone_number":
			query = "SELECT * FROM users WHERE phone_number LIKE ?";
			break;
		default:
			throw new IllegalArgumentException("Invalid field: " + field);
		}

		// Add % to value for pattern matching, if it's not already in the form of a
		// pattern

		value = "%" + value + "%";

		try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
			// Set the parameter in the prepared statement
			stmt.setString(1, value);

			// Execute the query
			ResultSet rs = stmt.executeQuery();

			// Check if the result set contains a record
			while (rs.next()) {
				String userName = rs.getString("username");
				String fullName = rs.getString("full_name");
				int age = rs.getInt("age");
				String phoneNumber = rs.getString("phone_number");
				User user = new User(userName, fullName, age, phoneNumber);
				danhSachUser.add(user);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return danhSachUser; // Return null if no result is found or an error occurs
	}
	
	public User getUserByUsername(String _username) {
		String query = "SELECT * FROM users WHERE username = ?";
		try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

			// Set the parameter in the prepared statement
			stmt.setString(1, _username);

			// Execute the query
			ResultSet rs = stmt.executeQuery();

			// Check if the result set contains a record
			if (rs.next()) {
				String userName = rs.getString("username");
				String fullName = rs.getString("full_name");
				int age = rs.getInt("age");
				String phoneNumber = rs.getString("phone_number");
				User user = new User(userName, fullName, age, phoneNumber);
				return user;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null; // Return null if no result is found or an error occurs
	}
	public boolean updateUser(User user) {
	    String query = "UPDATE users SET full_name = ?, age = ?, phone_number = ? WHERE username = ?";
	    try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

	        // Set the parameters in the prepared statement
	        stmt.setString(1, user.getFullName());
	        stmt.setInt(2, user.getAge());
	        stmt.setString(3, user.getPhoneNumber());
	        stmt.setString(4, user.getUsername());

	        // Execute the update query
	        int rowsAffected = stmt.executeUpdate();

	        // If rows are affected, the update was successful
	        return rowsAffected > 0;

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return false; // Return false if an error occurs or no rows are affected
	}

}
