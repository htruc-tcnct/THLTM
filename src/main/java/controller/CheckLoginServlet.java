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
import jakarta.servlet.http.HttpSession;
import model.bean.*;
import model.bo.*;
import model.dao.*;

@WebServlet("/CheckLoginServlet")
public class CheckLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String destination = null;
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		CheckLoginBO checkLoginBO = new CheckLoginBO();
		UserBO userBO = new UserBO();
		ArrayList<User> userArr = null;
	
		try {
			if (checkLoginBO.isValidUser(username, password) == "admin") {
				request.getSession().setAttribute("username", username);
				destination = "/admin/userList.jsp";
				userArr = userBO.getDanhSachUser();
				request.setAttribute("userArr", userArr);
				RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
				rd.forward(request, response);
			} else if (checkLoginBO.isValidUser(username, password) == "user") {
				request.getSession().setAttribute("username", username);
				   HttpSession session = request.getSession();
				    session.setAttribute("username", username);
				destination = "/user/MainPage.jsp";
				
				RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
				rd.forward(request, response);
			} else {
				destination = "/login.jsp";
				RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
				rd.forward(request, response);
			}
		} catch (ClassNotFoundException | SQLException | ServletException | IOException e) {
			e.printStackTrace();
		}
	}
}