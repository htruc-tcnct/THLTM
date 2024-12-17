<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create New Music</title>
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

        .form-container input[type="text"], 
        .form-container textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
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
        <h2>Create New Music</h2>
          <%
        // Lấy session hiện tại
     
        String username = (session != null) ? (String) session.getAttribute("username") : null;

      
    %>
        <form action="../MusicServlet" method="post">
            <!-- Tên bài hát -->
            <label for="name">Tên Bài Hát:</label>
            <input type="text" id="name" name="name" placeholder="Nhập tên bài hát" required>

            <!-- Nghệ sĩ -->
            <label for="authorName">Nghệ Sĩ:</label>
            <input type="text" id="authorName" name="authorName" placeholder="Nhập tên nghệ sĩ" required>
            
            <!-- Mô tả -->
            <label for="description">Mô Tả:</label>
            <textarea id="description" name="description" rows="4" placeholder="Nhập mô tả bài hát" required></textarea>
   <input type="hidden" name="username" value="<%= username %>">
            <!-- Nút tạo mới -->
            <button type="submit" name="action" value="createMusic">Tạo Mới</button>
        </form>
    </div>
</body>
</html>
