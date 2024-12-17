<%@page import="java.util.ArrayList, model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Thông tin chi tiết user</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f2f5;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
	margin: 0;
}

.container {
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
	padding: 30px 40px;
	max-width: 400px;
	width: 100%;
	box-sizing: border-box;
	text-align: center;
}

h2 {
	color: #333333;
	font-size: 24px;
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

td {
	padding: 12px 10px;
	font-size: 18px;
	color: #333333;
}

.label {
	font-weight: bold;
	color: #555555;
	text-align: right;
	width: 40%;
	padding-right: 15px;
}

.value {
	text-align: left;
}

.back-link {
	display: inline-block;
	text-decoration: none;
	color: #007bff;
	font-size: 16px;
	font-weight: bold;
	border: 1px solid #007bff;
	border-radius: 5px;
	padding: 10px 15px;
	transition: 0.3s;
}

.back-link:hover {
	background-color: #007bff;
	color: #ffffff;
}
</style>
</head>

<body>
	<div class="container">
		<%
		User user = (User) request.getAttribute("user");
		%>
		<h2>Chi tiết user</h2>
		<table>
			<tr>
				<td class="label">username :</td>
				<td class="value"><%=user.getUsername()%></td>
			</tr>
			<tr>
				<td class="label">Họ Tên:</td>
				<td class="value"><%=user.getFullName()%></td>
			</tr>
			<tr>
				<td class="label">Tuổi</td>
				<td class="value"><%=user.getAge()%></td>
			</tr>
			<tr>
				<td class="label">Số điện thoại:</td>
				<td class="value"><%=user.getPhoneNumber()%></td>
			</tr>
		</table>
		<a href="javascript:history.back()" class="back-link">Quay lại</a>
		<a href="MusicServlet?action=viewMusicsByUsername&username=<%=user.getUsername()%>" class="back-link">Xem musics</a>
	</div>
</body>
</html>
