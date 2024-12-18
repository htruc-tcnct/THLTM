package model.bo;

import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.NhanVien;
import model.bean.User;
import model.dao.UserDAO;

public class UserBO {

	private UserDAO userDAO;

	// Constructor
	public UserBO() {
		userDAO = new UserDAO(); // Khởi tạo DAO để truy cập cơ sở dữ liệu
	}

	public boolean create(User user) {
		return userDAO.create(user);
	}
	public ArrayList<User> getDanhSachUser() {
		return userDAO.getDanhSachUser(); 
	}

	public ArrayList<User> getUserByField(String field, String value) {
		return userDAO.getUserByField(field, value);
	}

	public User getUserByUsername(String username) {
		return userDAO.getUserByUsername(username);
	}
	public boolean updateUser(User user) {
		return userDAO.updateUser(user);
	}
}
