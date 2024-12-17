package controller.guest;

import model.dao.MusicDAO;
import model.bean.Music;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/Guest/music")
public class GuestMusicServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private MusicDAO musicDAO = new MusicDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String action = request.getParameter("action"); 
            List<Music> musicList;

            if ("search".equals(action)) {
                String keyword = request.getParameter("keyword"); 
                if (keyword != null && !keyword.trim().isEmpty()) {
                    musicList = musicDAO.searchMusic(keyword); 
                    request.setAttribute("searchKeyword", keyword);
                } else {
                    musicList = musicDAO.getAllMusic();
                }
            } else {
                musicList = musicDAO.getAllMusic();
            }

            request.setAttribute("musicList", musicList);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/Guest/index.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Lỗi khi lấy dữ liệu từ CSDL", e);
        }
    }
}

