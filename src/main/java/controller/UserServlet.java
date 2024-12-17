package controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.bean.*;
import model.bo.*;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		String username = request.getParameter("username");
		UserBO userBO = new UserBO();
		RequestDispatcher rdAdd;
		String destination;
		RequestDispatcher rd;
		User user = null;
		ArrayList<User> userArr;
		if (action != null) {
			switch (action) {
			case "view":
				// Fetch department list to display in the dropdown
				user = userBO.getUserByUsername(username);
				request.setAttribute("user", user);
				// Forward to the add employee form (themNV.jsp)
				rdAdd = getServletContext().getRequestDispatcher("/admin/userDetail.jsp");
				rdAdd.forward(request, response);
				break;
			case "viewList":
				destination = "/admin/userList.jsp";
				userArr = userBO.getDanhSachUser();
				request.setAttribute("userArr", userArr);
				rd = getServletContext().getRequestDispatcher(destination);
				rd.forward(request, response);
				break;
			case "gotoEdit":
			    String username1 = request.getParameter("username");
			   
			    User u = userBO.getUserByUsername(username1);

			    // Kiểm tra user lấy về từ database
			    if (u == null) {
			        System.out.println("User not found: " + username1);
			    } else {
			        System.out.println("User found: " + u.getUsername());
			    }
			    System.out.println(username1);
			    request.setAttribute("user", u);
				request.getRequestDispatcher("/user/editUser.jsp").forward(request, response);
			    break;
			default:
			
				 response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Hành động không hợp lệ");
			}
		}
	}
}
