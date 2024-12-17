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

    /* Cấu trúc của bảng */
    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
    }

    table th, table td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    table th {
        background-color: #4CAF50;
        color: white;
        font-weight: bold;
    }

    table td {
        background-color: #fff;
    }

    /* Style cho form tìm kiếm */
    .form-container {
        width: 80%;
        max-width: 600px;
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }

    .radio-group {
        display: flex;
        justify-content: space-between;
        margin-bottom: 20px;
    }

    .radio-group label {
        font-size: 16px;
        margin-right: 20px;
    }

    .search-container {
        margin-top: 20px;
    }

    .search-container-field {
        width: 100%;
        margin-bottom: 20px;
    }

    .search-container-field input {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }

    button {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
        border-radius: 4px;
    }

    button:hover {
        background-color: #45a049;
    }

    .music-list-container {
        margin-top: 20px;
        text-align: center;
    }

    .music-list-container table {
        width: 100%;
        margin-top: 20px;
    }

    .music-list-container td, .music-list-container th {
        padding: 10px;
        text-align: center;
    }

    /* Responsive design */
    @media (max-width: 768px) {
        body {
            padding: 10px;
        }

        table {
            width: 100%;
        }

        .form-container {
            width: 100%;
            padding: 15px;
        }

        button {
            width: 100%;
            padding: 12px 20px;
        }
    }
</style>

</head>
<body>
    <h2>Danh Sách Quảng Cáo Âm Nhạc</h2>
    <%
        ArrayList<Music> musicList = (ArrayList<Music>) session.getAttribute("musicList");
    String username = (session != null) ? (String) session.getAttribute("username") : null;
        if (musicList != null && !musicList.isEmpty()) {
    %>
    <div style="display: flex; justify-content: space-between;">
			<form action="UserController" method="POST" class="form-container">
				<div class="radio-group"> 
					<label> <input type="radio" name="search_field"
						value="name" required /> tên bài hát
					</label> <label> <input type="radio" name="search_field"
						value="author_name" /> tên tác giả
					</label>
				</div>
				  <input type="hidden" name="action" value="search">
				     <input type="hidden" name="username" value="<%= username %>">
				<div class="search-container">
					<div class="search-container-field">
						<input type="text" id="search_value" name="search_value"
							placeholder="Nhập thông tin..." required />
					</div>
					<button type="submit" class="search-button"
						style="margin-left: 2px;">Tìm kiếm</button>
				</div>
			</form>
			
		</div>
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
