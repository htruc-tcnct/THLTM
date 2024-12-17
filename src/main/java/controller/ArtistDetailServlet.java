package controller;

import model.bean.Music;
import model.dao.MusicDAO;
import java.util.List;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Guest/artistDetail")
public class ArtistDetailServlet extends HttpServlet {
    private MusicDAO musicDAO = new MusicDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String artistName = request.getParameter("artistName");
        if (artistName != null) {
            List<Music> artistMusics = musicDAO.getMusicsByArtist(artistName);
            
            String artistImageUrl = null;
          

            request.setAttribute("artistName", artistName);
            request.setAttribute("artistImageUrl", artistImageUrl);
            request.setAttribute("artistMusics", artistMusics);
            
            request.getRequestDispatcher("/Guest/artistDetail.jsp").forward(request, response);
        } else {
            response.sendRedirect("music");
        }
    }
}
