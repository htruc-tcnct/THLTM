package controller.guest;

import model.bean.Music;
import model.dao.MusicDAO;
import java.util.List;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
