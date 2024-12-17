package controller;

import model.bean.Music;
import model.dao.MusicDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Guest/musicDetail")
public class MusicDetailServlet extends HttpServlet {
    private MusicDAO musicDAO = new MusicDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String musicIdParam = request.getParameter("musicId");
        System.out.println("Received musicId parameter: " + musicIdParam);

        if (musicIdParam != null) {
            try {
                int musicId = Integer.parseInt(musicIdParam);
                System.out.println("Parsed musicId: " + musicId); 

                Music music = musicDAO.getgetMusicByID(musicId);
                System.out.println("Retrieved music object: " + music);

                if (music != null) {
                    request.setAttribute("music", music);
                    request.getRequestDispatcher("/Guest/musicDetail.jsp").forward(request, response);
                } else {
                    System.out.println("Music not found for ID: " + musicId);
                    response.sendRedirect("music");
                }
            } catch (NumberFormatException e) {
                System.out.println("Invalid musicId format: " + musicIdParam); 
                response.sendRedirect("music");
            }
        } else {
            System.out.println("No musicId parameter found in the request."); 
            response.sendRedirect("music");
        }
    }
}
