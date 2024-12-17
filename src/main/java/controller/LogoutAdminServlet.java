package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServlet;

import java.io.IOException;
@WebServlet("/LogoutAdminServlet")
public class LogoutAdminServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Xóa session
        HttpSession session = request.getSession(false); // Lấy session hiện tại, nếu có
        if (session != null) {
            session.invalidate(); // Xóa session
        }

        // Chuyển hướng về trang login.jsp
        response.sendRedirect("login.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Có thể sử dụng phương thức GET cho logout, nhưng cũng cần xử lý POST nếu cần
        doGet(request, response);
    }
}
