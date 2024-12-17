package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;


import model.bo.*;
import model.bean.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UserController")
public class UserController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
   	 String action = request.getParameter("action");
 	if ("gotoEdit".equals(action)) {
 		 String username1 = request.getParameter("username");
		   UserBO userBO = new UserBO();
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
 		
	}
 	else if ("update".equals(action)) {
        String username = request.getParameter("username");
        String fullName = request.getParameter("fullName");
        int age = Integer.parseInt(request.getParameter("age"));
        String phoneNumber = request.getParameter("phoneNumber");

        User updatedUser = new User(username, fullName, age, phoneNumber);

        UserBO userBO = new UserBO();
        boolean isUpdated = userBO.updateUser(updatedUser);

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");

        if (isUpdated) {
            response.getWriter().write("Cập nhật thành công!");
        } else {
            response.getWriter().write("Cập nhật thất bại!");
        }
    }
 	else if ("search".equals(action)) {
 		String searchField = request.getParameter("search_field");
		String searchValue = request.getParameter("search_value");
		String username = request.getParameter("username");
		
		MusicBO musicBO = new MusicBO();
		ArrayList<Music> musicArr = new ArrayList<Music>();
		musicArr = musicBO.getMusicByFieldAndUsername(searchField, searchValue, username);
		if (!musicArr.isEmpty()) {
			request.setAttribute("musicArr", musicArr);
			request.setAttribute("username", username);
			String destination = "/user/resultSearch.jsp";
			RequestDispatcher rd;
			rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
		} else {
			musicArr = musicBO.getMusicsByUsername(username);
			request.setAttribute("musicArr", musicArr);
			request.setAttribute("username", username);
			// Set an error message and forward back to the form
			request.setAttribute("errorMessage", "không tìm thấy music.");
			RequestDispatcher rd2 = getServletContext().getRequestDispatcher("/user/resultSearch.jsp");
			rd2.forward(request, response);
		}
 	}


    }
}
