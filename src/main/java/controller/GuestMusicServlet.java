package controller;

import model.dao.MusicDAO;
import model.bean.Music;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/Guest/music")
public class GuestMusicServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private MusicDAO musicDAO = new MusicDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String action = request.getParameter("action"); // check if it's a search
            List<Music> musicList;

            if ("search".equals(action)) {
                String keyword = request.getParameter("keyword"); // get the search keyword
                if (keyword != null && !keyword.trim().isEmpty()) {
                    musicList = musicDAO.searchMusic(keyword); // search music based on the keyword
                    request.setAttribute("searchKeyword", keyword); // set the search keyword for displaying
                } else {
                    musicList = musicDAO.getAllMusic(); // get all music if no keyword
                }
            } else {
                musicList = musicDAO.getAllMusic(); // get all music if no action specified
            }
            
            request.setAttribute("musicList", musicList); // set the music list as an attribute

            // Forward the request to index.jsp for displaying the music list
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Guest/index.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exception if needed (maybe forward to an error page)
        }
    }
}
