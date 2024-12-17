<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.bean.Music" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Music</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 50px;
            background-color: #f9f9f9;
            color: #333;
        }

        .form-container {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
        }

        .form-container label {
            font-weight: bold;
            display: block;
            margin: 10px 0 5px;
        }

        .form-container input[type="text"], .form-container input[type="hidden"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-container span {
            display: block;
            font-size: 16px;
            margin-bottom: 10px;
        }

        .form-container button {
            width: 100%;
            padding: 10px;
            background: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-container button:hover {
            background: #45a049;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Edit Music</h2>
        <%
            // Lấy thông tin bài hát từ request
            Music music = (Music) request.getAttribute("music");
        String username = (session != null) ? (String) session.getAttribute("username") : null;
            if (music != null) {
        %>
        <!-- Form để chỉnh sửa bài hát -->
        <form action="MusicServlet" method="post">
            <!-- Hiển thị ID nhưng không cho chỉnh sửa -->
            <label for="id">ID:</label>
            <span><%= music.getID() %></span>
            <!-- ID được truyền dưới dạng ẩn -->
            <input type="hidden" name="id" value="<%= music.getID() %>">
            
            <!-- Truyền username từ session -->
            <input type="hidden" name="username" value="<%= username %>">

            <!-- Tên bài hát -->
            <label for="name">Tên Bài Hát:</label>
            <input type="text" id="name" name="name" value="<%= music.getName() %>" required>

            <!-- Nghệ sĩ -->
            <label for="authorName">Nghệ Sĩ:</label>
            <input type="text" id="authorName" name="authorName" value="<%= music.getAuthorName() %>" required>
            
            <!-- Mô tả -->
            <label for="description">Mô Tả:</label>
            <input type="text" id="description" name="description" value="<%= music.getDescription() %>" required>
            
            <!-- Nút cập nhật -->
            <button type="submit" name="action" value="updateMusic">Cập Nhật</button>
        </form>
        <%
            } else {
        %>
        <p>Không tìm thấy bài hát để chỉnh sửa.</p>
        <%
            }
        %>
    </div>
</body>
</html>
