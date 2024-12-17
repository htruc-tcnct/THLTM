package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.bean.Music;
import model.bo.MusicBO;

@WebServlet("/MusicServlet")
public class MusicServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private MusicBO musicBO;

    @Override
    public void init() throws ServletException {
        super.init();
        musicBO = new MusicBO(); // Khởi tạo MusicBO
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action is required");
            return;
        }

        try {
            switch (action) {
                case "viewMusicsByUsername":
                    viewMusicsByUsername(request, response);
                    break;
                case "view":
                    viewMusicDetails(request, response);
                    break;
                case "viewForUser":
                    viewForUser(request, response);
                    break;
                case "goToEdit":
                    goToEditMusic(request, response);
                    break;
              
                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action is required");
            return;
        }

        try {
            switch (action) {
                case "updateMusic":
                    updateMusic(request, response);
                    break;
                case "delete":
                    deleteMusic(request, response);
                    break;
                case "createMusic":
                    createMusic(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred");
        }
    }

    private void viewMusicsByUsername(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        ArrayList<Music> musicArr = musicBO.getMusicsByUsername(username);
        request.setAttribute("musicArr", musicArr);
        request.setAttribute("username", username);
        RequestDispatcher rd = request.getRequestDispatcher("/admin/musicList.jsp");
        rd.forward(request, response);
    }

    private void viewMusicDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Music music = musicBO.getMusicByID(id);
        request.setAttribute("music", music);
        RequestDispatcher rd = request.getRequestDispatcher("/admin/musicDetail.jsp");
        rd.forward(request, response);
    }

    private void viewForUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        ArrayList<Music> musicArr = musicBO.getMusicsByUsername(username);
        HttpSession session = request.getSession();
        session.setAttribute("musicList", musicArr);
        RequestDispatcher rd = request.getRequestDispatcher("/user/viewAds.jsp");
        rd.forward(request, response);
    }

    private void goToEditMusic(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("musicID"));
        Music music = musicBO.getMusicByID(id);
        request.setAttribute("music", music);
        RequestDispatcher rd = request.getRequestDispatcher("/user/editMusic.jsp");
        rd.forward(request, response);
    }
  
    private void updateMusic(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id =request.getParameter("id");
        String name = request.getParameter("name");
        String authorName = request.getParameter("authorName");
        String description = request.getParameter("description");
        String username = request.getParameter("username"); 
        System.out.println("Username: "+username);
        Music updatedMusic = new Music(id, name, authorName, description);
        boolean isUpdated = musicBO.updateMusic(updatedMusic);

        if (isUpdated) {
            System.out.println("Music updated successfully!");
            
            response.sendRedirect("MusicServlet?action=viewForUser&username="+username);
        } else {
            System.out.println("Music update failed!");
            request.setAttribute("errorMessage", "Update failed!");
            request.setAttribute("music", updatedMusic);
            RequestDispatcher rd = request.getRequestDispatcher("/user/editMusic.jsp");
            rd.forward(request, response);
        }
    }
    private void deleteMusic(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String username = request.getParameter("username");

        if (id == null || id.isEmpty() || username == null || username.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required parameters");
            return;
        }

        boolean isDeleted = musicBO.deleteMusic(id);

        if (isDeleted) {
            System.out.println("Music deleted successfully!");
            response.sendRedirect("MusicServlet?action=viewForUser&username=" + username);
        } else {
            System.out.println("Music deletion failed!");
            request.setAttribute("errorMessage", "Delete failed!");
            response.sendRedirect("MusicServlet?action=viewForUser&username=" + username);
        }
    }
    private void createMusic(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        // Lấy thông tin từ form
        String name = request.getParameter("name");
        String authorName = request.getParameter("authorName");
        String description = request.getParameter("description");
        String username = (String) request.getSession().getAttribute("username");

        // Kiểm tra username có tồn tại không
        if (username == null || username.isEmpty()) {
            response.sendRedirect("login.jsp"); // Chuyển hướng về trang đăng nhập nếu chưa đăng nhập
            return;
        }

        // Tạo đối tượng Music
        Music newMusic = new Music();
        newMusic.setName(name);
        newMusic.setAuthorName(authorName);
        newMusic.setDescription(description);
        newMusic.setUsername(username);

        // Gọi BO để thêm mới bài hát
        boolean isCreated = musicBO.createMusic(newMusic);

        if (isCreated) {
            System.out.println("Music created successfully!");
            response.sendRedirect("MusicServlet?action=viewForUser&username=" + username);
        } else {
            System.out.println("Music creation failed!");
            request.setAttribute("errorMessage", "Failed to create music!");
            RequestDispatcher rd = request.getRequestDispatcher("/user/createMusic.jsp");
            rd.forward(request, response);
        }
    }


}
