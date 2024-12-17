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

@WebServlet("/SearchMusicServlet")
public class SearchMusicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Get form data
		String searchField = request.getParameter("search_field");
		String searchValue = request.getParameter("search_value");
		String username = request.getParameter("username");
		
		
		MusicBO musicBO = new MusicBO();
		ArrayList<Music> musicArr = new ArrayList<Music>();
		musicArr = musicBO.getMusicByFieldAndUsername(searchField, searchValue, username);
		if (!musicArr.isEmpty()) {
			request.setAttribute("musicArr", musicArr);
			request.setAttribute("username", username);
			String destination = "/admin/musicList.jsp";
			RequestDispatcher rd;
			rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(request, response);
		} else {
			musicArr = musicBO.getMusicsByUsername(username);
			request.setAttribute("musicArr", musicArr);
			request.setAttribute("username", username);
			// Set an error message and forward back to the form
			request.setAttribute("errorMessage", "không tìm thấy music.");
			RequestDispatcher rd2 = getServletContext().getRequestDispatcher("/admin/musicList.jsp");
			rd2.forward(request, response);
		}
	}
}