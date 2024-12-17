<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 20px;
            color: #333;
        }

        a {
            text-decoration: none;
            color: #25282B;
            /* Màu chữ của liên kết */
            display: block;
            padding: 10px;
            margin: 0;
            border-radius: 4px;
            background-color: #E7E4E5;
            /* Màu nền của liên kết */
            text-align: center;
            font-weight: bold;
        }

        a:hover {
            background-color: #d0d0d0;
            /* Màu nền khi hover */
            color: #25282B;
            /* Màu chữ khi hover */
        }

        hr {
            border: 0;
            border-top: 1px solid #ccc;
            margin: 10px 0;
        }
    </style>
    <script>
        function logout() {
            // Chuyển hướng toàn bộ trang về login.jsp
            window.top.location.href = "../login.jsp";
        }
    </script>
</head>

<body>
    <%
        // Lấy session hiện tại
     
        String username = (session != null) ? (String) session.getAttribute("username") : null;

        if (username == null) {
    %>
        <!-- Chuyển hướng về login.jsp nếu username không tồn tại -->
        <script>
            window.location.href = "../login.jsp";
        </script>
    <%
        } else {
    %>
        <!-- Hiển thị thông tin username -->
        <h1 align="center">Chào mừng, <%= username %>!</h1>
        <h3>Chức năng</h3>
        <h3><a href="../user/createAds.jsp" target="center">Thêm mới Quảng cáo</a></h3>
        <h3><a href="../MusicServlet?action=viewForUser&username=<%= username %>" target="center">Xem Quảng cáo</a></h3>
         <h3><a href="../UserController?action=gotoEdit&username=<%= username %>" target="center">Chỉnh sửa thông tin</a></h3>
        <h3><a href="../LogoutAdminServlet" onclick="logout()">Đăng xuất</a></h3>
     
    <% 
        }
    %>
</body>

</html>
