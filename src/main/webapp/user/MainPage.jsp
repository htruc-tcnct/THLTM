<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
</head>

<frameset rows="80px,*,60px" frameborder="1" border="1">
    <!-- Header -->
    <frame src="./mainPage/header.jsp" name="header"  scrolling="no">

        <!-- Main Content with left (menu) and center (content display) -->
        <frameset cols="20%,80%" frameborder="1" border="1">
            <frame src="./mainPage/left.jsp" name="left" > //them noresize de khong resize duoc
                <frame src="./mainPage/center.jsp" name="center" >
        </frameset>

        <!-- Footer -->
        <frame src="./mainPage/footer.jsp" name="footer"  scrolling="no">
</frameset>

</html>
