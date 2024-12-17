<%@page import="java.util.ArrayList, model.bean.Music"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Quản lý Musics</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f9;
}

.container {
	width: 80%;
	margin: 20px auto;
	padding: 20px;
	background-color: white;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

h1 {
	text-align: center;
	color: #333;
}

.form-container {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	margin-bottom: 20px;
}

.radio-group {
	display: flex;
	gap: 20px;
}

label {
	font-size: 16px;
	color: #555;
}

input[type="text"] {
	padding: 10px;
	width: 250px;
	margin-top: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

button {
	padding: 10px 20px;
	background-color: #007BFF;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-top: 10px;
	font-size: 16px;
}

button:hover {
	background-color: #0056b3;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 30px;
}

th, td {
	padding: 12px;
	text-align: left;
	border: 1px solid #ddd;
}

th {
	background-color: #f1f1f1;
	color: #333;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

a {
	color: #007BFF;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

.back-link {
	display: block;
	margin-top: 20px;
	text-align: center;
	color: #007BFF;
	text-decoration: none;
}

.back-link:hover {
	text-decoration: underline;
}

.search-container {
	display: flex;
}
</style>
</head>
<body>
	<div class="container">
		<%
		String username = (String)request.getAttribute("username");
		%>
		<h1>
			danh sách music của 
			<%=username%>
		</h1>
		<%
		String errorMessage = (String) request.getAttribute("errorMessage");
		%>
		<%
		if (errorMessage != null && !errorMessage.isEmpty()) {
		%>
		<div id="error-message" style="color: red; display: block;">
			<%=errorMessage%>
		</div>
		<%
		}
		%>
		<div style="display: flex; justify-content: space-between;">
			<form action="SearchMusicServlet?username=<%=username%>" method="POST" class="form-container">
				<div class="radio-group">
					<label> <input type="radio" name="search_field"
						value="name" required /> tên bài hát
					</label> <label> <input type="radio" name="search_field"
						value="author_name" /> tên tác giả
					</label>
				</div>
				<div class="search-container">
					<div class="search-container-field">
						<input type="text" id="search_value" name="search_value"
							placeholder="Nhập thông tin..." required />
					</div>
					<button type="submit" class="search-button"
						style="margin-left: 2px;">Tìm kiếm</button>
				</div>
			</form>
			<button onclick="window.location.href='UserServlet?action=viewList'"
				style="height: 38.67px; margin-top: 30px;">trang chủ</button>
		</div>
		<table>
			<tr>
				<th>STT</th>
				<th>Tên bài hát</th>
				<th>Tên tác giả</th>
				<th>Xem chi tiết</th>
			</tr>
			<%
			ArrayList<Music> musicArr = (ArrayList<Music>) request.getAttribute("musicArr");
			for (int i = 0; i < musicArr.size(); i++) {
			%>
			<tr>
				<td><%=i + 1%></td>
				<td><%=musicArr.get(i).getName()%></td>
				<td><%=musicArr.get(i).getAuthorName()%></td>
				<td><a
					href="MusicServlet?action=view&id=<%=musicArr.get(i).getID()%>">Xem
						chi tiết</a></td>
			</tr>
			<%
			}
			%>
		</table>

		<a href="javascript:history.back()" class="back-link">Quay lại</a>
	</div>
</body>
</html>
