<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.bean.Music" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Ads</title>
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        /* Reset toàn bộ */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f9f9f9;
            color: #333;
            padding: 20px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 28px;
            color: #333;
        }

        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #4CAF50;
            color: white;
            font-size: 18px;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
            cursor: pointer;
        }

        td {
            font-size: 16px;
        }

        p {
            text-align: center;
            font-size: 18px;
            color: #555;
        }

        /* Icon styles */
        .action-icons a {
            text-decoration: none;
            color: #4CAF50;
            margin: 0 5px;
            font-size: 18px;
        }

        .action-icons a.delete {
            color: #f44336;
        }

        .action-icons a:hover {
            color: #333;
        }
    </style>
</head>
<body>
    <h2>Danh Sách Quảng Cáo Âm Nhạc</h2>
    <%
        ArrayList<Music> musicList = (ArrayList<Music>) request.getAttribute("musicArr");
    String username = (session != null) ? (String) session.getAttribute("username") : null;
        if (musicList != null && !musicList.isEmpty()) {
    %>
   
    <table>
        <tr>
            <th>ID</th>
            <th>Tên Bài Hát</th>
            <th>Nghệ Sĩ</th>
                 <th>Mô tả</th>
            <th>Action</th>
        </tr>
        <%
            for (Music music : musicList) {
        %>
        <tr>
            <td><%= music.getID() %></td>
            <td><%= music.getName() %></td>
            <td><%= music.getAuthorName() %></td>
             <td><%= music.getDescription() %></td>
            <td class="action-icons">
                <!-- Link Edit -->
                <a href="../THLTM/MusicServlet?action=goToEdit&musicID=<%= music.getID() %>" title="Edit"><i class="fas fa-edit"></i></a>
                <!-- Link Delete -->
              <form action="../THLTM/MusicServlet" method="post" style="display: inline;">
   			 <input type="hidden" name="action" value="delete">
   			 <input type="hidden" name="id" value="<%= music.getID() %>">
   				 <input type="hidden" name="username" value="<%= username %>">
    <button type="submit" class="delete" title="Delete">
        <i class="fas fa-trash-alt"></i>
    </button>
</form>

            </td>
        </tr>
        <%
            }
        %>
    </table>
    <%
        } else {
    %>
    <p>Không có quảng cáo nào!</p>
    <%
        }
    %>
</body>
</html>
