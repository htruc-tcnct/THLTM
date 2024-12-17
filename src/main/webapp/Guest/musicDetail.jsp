<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="model.bean.Music" %>
<%
    Music music = (Music) request.getAttribute("music");
    if (music == null) {
        response.sendRedirect("music");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Chi Tiết Bài Hát</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }

        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #4CAF50;
            margin-bottom: 20px;
        }

        .song-image {
            display: block;
            margin: 0 auto 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin: 10px 0;
        }

        p {
            font-size: 16px;
            line-height: 1.6;
        }

        p span {
            font-weight: bold;
            color: #4CAF50;
        }

        .description {
            margin-top: 20px;
            padding: 10px;
            background-color: #f9f9f9;
            border-left: 4px solid #4CAF50;
            font-style: italic;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px;
            background-color: #4CAF50;
            color: #fff;
            text-decoration: none;
            text-align: center;
            border-radius: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .back-link:hover {
            background-color: #45a049;
        }

        .back-home-btn {
            display: block;
            width: fit-content;
            margin: 20px auto 0;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            text-decoration: none;
            font-weight: bold;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .back-home-btn:hover {
            background-color: #45a049;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Chi Tiết Bài Hát</h1>
        <img src="https://i.postimg.cc/L6wYHq9m/hh.jpg" alt="Bài hát" class="song-image" style="width: 100%; max-width: 300px;">
        <h2><%= music.getName() %></h2>
        <p><span>Nghệ sĩ:</span> <%= music.getAuthorName() %></p>
        
        <!-- Hiển thị nhạc sĩ sáng tác -->
        <p><span>Nhạc sĩ sáng tác:</span> <%= music.getAuthorName() %></p>
        
        <!-- Hiển thị mô tả -->
        <div class="description">
            <span>Mô tả:</span> <%= music.getDescription() != null ? music.getDescription() : "Không có mô tả" %>
        </div>

        <!-- Button Quay Lại Danh Sách -->
        <a href="music" class="back-home-btn">Quay lại trang chủ</a>
    </div>
</body>
</html>
