package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bean.*;
import model.bo.*;
import model.dao.*;

@WebServlet("/SearchUserServlet")
public class SearchUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Get form data
		String searchField = request.getParameter("search_field");
		String searchValue = request.getParameter("search_value");
		UserBO userBO = new UserBO();
		ArrayList<User> userArr = new ArrayList<User>();
		userArr = userBO.getUserByField(searchField, searchValue);
		if (!userArr.isEmpty()) {
			request.setAttribute("userArr", userArr);
			String destination = "/admin/userList.jsp";
			RequestDispatcher rd;
			rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
		} else {
			userArr = userBO.getDanhSachUser();
			request.setAttribute("userArr", userArr);
			// Set an error message and forward back to the form
			request.setAttribute("errorMessage", "không tìm thấy người dùng.");
			RequestDispatcher rd2 = getServletContext().getRequestDispatcher("/admin/userList.jsp");
			rd2.forward(request, response);
		}
	}
}