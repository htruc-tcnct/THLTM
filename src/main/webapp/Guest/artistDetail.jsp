<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.bean.Music" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chi Tiết Nghệ Sĩ</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }

        h1 {
            text-align: center;
            margin-top: 20px;
            color: #4CAF50;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .artist-info {
            text-align: center;
            margin-bottom: 20px;
        }

        .artist-info img {
            border-radius: 50%;
            margin-bottom: 10px;
        }

        .artist-info h2 {
            margin: 0;
            color: #333;
        }

        .song-list {
            margin: 20px 0;
        }

        .song-list h3 {
            margin-bottom: 10px;
            color: #4CAF50;
        }

        .song-list ul {
            list-style: none;
            padding: 0;
        }

        .song-list li {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
        }

        .song-list li a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
            display: flex;
            align-items: center;
        }

        .song-list li a:hover {
            color: #4CAF50;
        }

        .song-list img {
            width: 50px;
            height: 50px;
            margin-right: 15px;
            border-radius: 5px;
        }

        .no-songs {
            color: #888;
            text-align: center;
            font-style: italic;
        }

        /* Button quay lại trang chủ */
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
        <h1>Thông Tin Chi Tiết Nghệ Sĩ</h1>
        <div class="artist-info">
            <!-- Hiển thị ảnh và tên nghệ sĩ -->
            <img src="https://i.postimg.cc/L6wYHq9m/hh.jpg" alt="Ảnh Nghệ Sĩ" width="200px" height="200px">
            <h2><%= request.getAttribute("artistName") %></h2>
        </div>
        
        <!-- Hiển thị danh sách các bài hát -->
        <div class="song-list">
            <h3>Các bài hát của nghệ sĩ:</h3>
            <ul>
                <%
                    List<Music> artistMusics = (List<Music>) request.getAttribute("artistMusics");
                    if (artistMusics != null && !artistMusics.isEmpty()) {
                        for (Music music : artistMusics) {
                %>
                <li>
                    <a href="musicDetail?musicId=<%= music.getID() %>">
                        <img src="https://i.postimg.cc/L6wYHq9m/hh.jpg" alt="Ảnh Bài Hát">
                        <%= music.getName() %>
                    </a>
                </li>
                <%
                        }
                    } else {
                %>
                <li class="no-songs">Không có bài hát nào của nghệ sĩ này.</li>
                <%
                    }
                %>
            </ul>
        </div>

        <!-- Button Quay Lại Trang Chủ -->
        <a href="music" class="back-home-btn">Quay lại trang chủ</a>
    </div>
</body>
</html>
