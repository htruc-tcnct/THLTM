<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin Footer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #333;
            color: #E7E4E5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            text-align: center;
        }

        .footer {
            padding: 20px;
            background-color: #25282B;
            border-top: 3px solid #4CAF50;
            max-width: 600px;
            width: 90%;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.3);
            border-radius: 8px;
            text-align: center;
        }

        .footer h3 {
            color: #4CAF50;
            font-size: 1em;
            margin-bottom: 12px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .teacher-info {
            font-size: 1em;
            color: #B0BEC5;
            font-style: italic;
            margin-top: 5px;
        }

        .teacher-info span {
            color: #4CAF50;
            font-weight: bold;
        }
    </style>
</head>

<body>
    <div class="footer">
        <h3>Học phần: Lập trình mạng</h3>
        <p class="teacher-info">Giảng viên: <span>Mai Văn Hà</span></p>
    </div>
</body>

</html>