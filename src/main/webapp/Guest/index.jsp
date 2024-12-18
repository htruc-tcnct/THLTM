<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="model.bean.Music" %>
<!DOCTYPE html>
<html>
<head>
    <title>Website Âm Nhạc</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #FFFFFF;
            color: #000;
        }

        /* Nav-bar */
        .navbar {
            background-color: #000;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            color: #fff;
        }
        
        /* Button Trang chủ */
.navbar .home-button button {
    padding: 8px 15px;
    border: none;
    border-radius: 20px;
    background-color: #1DB954;
    color: white;
    font-weight: bold;
    cursor: pointer;
}

.navbar .home-button {
    margin-left: 20px; /* Căn chỉnh button Trang chủ */
}
        

        .navbar .logo {
            font-size: 1.5rem;
            font-weight: bold;
        }
        
        .auth-buttons a button {
            padding: 8px 15px;
            margin-left: 10px;
            border: none;
            border-radius: 20px;
            font-weight: bold;
            color: #fff;
            cursor: pointer;
        }

        .btn-login {
         margin-left: 10px;
            padding: 8px 15px;
            background-color: #1DB954;
            color: white;
            border-radius: 20px;
            cursor: pointer;
            border: none;
            background-color: #1DB954;
        }

        .btn-register {
         margin-left: 10px;
            padding: 8px 15px;
            background-color: #1DB954;
            color: white;
            border-radius: 20px;
            cursor: pointer;
            border: none;
            background-color: #fff;
            color: #000;
        }
        

        .search-box input {
            width: 300px;
            padding: 8px;
            border-radius: 20px;
            border: none;
            outline: none;
        }

        .search-box button {
            margin-left: 10px;
            padding: 8px 15px;
            background-color: #1DB954;
            color: white;
            border-radius: 20px;
            cursor: pointer;
            border: none;
        }

        /* Nội dung chính */
        .content-section {
            padding: 20px;
            text-align: center;
        }

        .section-title {
            font-size: 1.5rem;
            margin-bottom: 20px;
        }

        .item-grid, .artist-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            max-width: 1000px;
            margin: 0 auto;
        }

        .item-card, .artist-card {
            flex: 0 0 calc(20% - 20px);
            box-sizing: border-box;
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .item-card img {
            width: 100%;
            border-radius: 10px;
        }

        .hidden {
            display: none;
        }

        .view-all {
            margin-top: 10px;
            cursor: pointer;
            color: #007BFF;
            font-weight: bold;
        }
    </style>
    <script>
        function showSection(sectionId) {
            document.getElementById("songs-section").classList.add("hidden");
            document.getElementById("artists-section").classList.add("hidden");
            document.getElementById("songs-full").classList.add("hidden");
            document.getElementById("artists-full").classList.add("hidden");

            document.getElementById(sectionId).classList.remove("hidden");
        }
    </script>
</head>
<body>
    <!-- Nav-bar -->
    <div class="navbar">
        <div class="logo">Website Âm Nhạc</div>
        <div class="home-button">
             <button onclick="window.location.href='music';">Trang chủ</button>
        </div>
        <div class="search-box">
            <form action="music" method="GET">
                <input type="hidden" name="action" value="search">
                <input type="text" name="keyword" placeholder="Tìm kiếm tên bài hát hoặc nghệ sĩ">
                <button type="submit">Tìm kiếm</button>
            </form>
        </div>
        <div class="auth-buttons">
            <a class="btn-login" href="./login.jsp">Đăng nhập</a>
          
        </div>
    </div>

    <!-- Bài Hát Rút Gọn -->
    <div id="songs-section" class="content-section">
        <div class="section-title">Nghệ Sĩ & Bài Hát</div>
        <div class="item-grid">
            <%
                List<Music> musicList = (List<Music>) request.getAttribute("musicList");
                String keyword = request.getParameter("keyword"); // Lấy tham số tìm kiếm
                if (musicList != null) {
                    int count = 0;
                    for (Music music : musicList) {
                        if (count >= 5) break;
            %>
             <div class="item-card" onclick="window.location.href = 'musicDetail?musicId=' + <%= music.getID() %>;">
                <img src="https://i.postimg.cc/L6wYHq9m/hh.jpg" alt="Bài hát">
                <p><%= music.getName() %></p>
                <small><%= music.getAuthorName() %></small>
            </div>
            <%
                        count++;
                    }
                }
            %>
        </div>
        <% if (keyword == null || keyword.isEmpty()) { %>
            <div id="view-all-songs" class="view-all" onclick="showSection('songs-full')">Xem tất cả</div>
        <% } %>
    </div>

    <!-- Nghệ Sĩ Rút Gọn -->
    <div id="artists-section" class="content-section">
        <div class="section-title">Danh Sách Nghệ Sĩ</div>
        <div class="artist-grid">
            <%
                if (musicList != null) {
                    HashSet<String> artists = new HashSet<>();
                    int count = 0;
                    for (Music music : musicList) {
                        if (artists.add(music.getAuthorName())) {
                            if (count >= 5) break;
            %>
            
            <div class="artist-card" onclick="window.location.href='artistDetail?artistName=<%= music.getAuthorName() %>'">
                <img src="https://i.postimg.cc/L6wYHq9m/hh.jpg" alt="Nghệ sĩ">
                <p><%= music.getAuthorName() %></p>
            </div>
            <%
                            count++;
                        }
                    }
                }
            %>
        </div>
        <% if (keyword == null || keyword.isEmpty()) { %>
            <div id="view-all-artists" class="view-all" onclick="showSection('artists-full')">Xem tất cả</div>
        <% } %>
    </div>

    <!-- Bài Hát Đầy Đủ -->
    <div id="songs-full" class="content-section hidden">
        <div class="section-title">Tất Cả Bài Hát</div>
        <div class="item-grid">
            <%
                if (musicList != null) {
                    for (Music music : musicList) {
            %>
            <div class="item-card" onclick="window.location.href = 'musicDetail?musicId=' + <%= music.getAuthorName() %>;">
                <img src="https://i.postimg.cc/L6wYHq9m/hh.jpg" alt="Bài hát">
                <p><%= music.getName() %></p>
                <small><%= music.getAuthorName() %></small>
            </div>
            <%
                    }
                }
            %>
        </div>
    </div>

    <!-- Nghệ Sĩ Đầy Đủ -->
    <div id="artists-full" class="content-section hidden">
        <div class="section-title">Tất Cả Nghệ Sĩ</div>
        <div class="artist-grid">
            <%
                if (musicList != null) {
                    HashSet<String> allArtists = new HashSet<>();
                    for (Music music : musicList) {
                        if (allArtists.add(music.getAuthorName())) {
            %>
            <div class="artist-card" onclick="window.location.href='artistDetail?artistName=<%= music.getAuthorName() %>'">
                <img src="https://i.postimg.cc/L6wYHq9m/hh.jpg" alt="Nghệ sĩ">
                <p><%= music.getAuthorName() %></p>
            </div>
            <%
                        }
                    }
                }
            %>
        </div>
    </div>
</body>
</html>
