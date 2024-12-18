<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
            integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Kaisei+Tokumin:wght@400;500;700&display=swap"
            rel="stylesheet">
        <link rel="icon" href="https://www.dior.com/favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" href="https://cdn.lineicons.com/4.0/lineicons.css" />
    </head>
    <style>
        .inclu-lsandsg * {
            box-sizing: border-box;

        }

        .inclu-lsandsg {
            position: fixed;
            /* Đảm bảo nó không thay đổi layout của trang */
            top: 200px;
            left: 50%;
            transform: translateX(-50%);
            justify-content: center;
            align-items: center;
            z-index: 1000;
            /* Đảm bảo nó nằm trên overlay */
        }

        .dior-lg h1 {
            font-weight: 700;
            letter-spacing: -1.5px;
            /* điều chỉnh khoảng cách giữa các ký tự trong đoạn văn bản. */
            margin: 0;
            margin-bottom: 15px;
        }

        .dior-lg h1.title {
            font-size: 45px;
            line-height: 45px;
            margin: 0;
            text-shadow: 0 0 10px rgba(16, 64, 74, 0.5);
        }

        .dior-lg p {
            font-size: 14px;
            font-weight: 100;
            line-height: 20px;
            letter-spacing: 0.5px;
            margin: 20px 0 30px;
            text-shadow: 0 0 10px rgba(16, 64, 74, 0.5);
        }

        .dior-lg span {
            font-size: 14px;
            margin-top: 25px;
        }

        .dior-lg a {
            color: #333;
            font-size: 14px;
            text-decoration: none;
            margin: 15px 0;
            transition: 0.3s ease-in-out;
        }

        .dior-lg a:hover {
            color: #007585;
        }

        .dior-lg .content {
            display: flex;
            width: 100%;
            height: 50px;
            align-items: center;
            justify-content: space-around;
        }

        .dior-lg .content .checkbox {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .dior-lg .content input {
            accent-color: #007585;
            width: 12px;
            height: 12px;
        }

        .dior-lg .content label {
            font-size: 14px;
            user-select: none;
            padding-left: 5px;
        }

        .dior-lg button {
            position: relative;
            border-radius: 20px;
            border: 1px solid #007585;
            background-color: #007585;
            color: #fff;
            font-size: 15px;
            font-weight: 700;
            margin: 10px;
            padding: 12px 80px;
            letter-spacing: 1px;
            text-transform: capitalize;
            /* tự động viết hoa chữ cái đầu tiên */
            transition: 0.3s ease-in-out;
        }

        .dior-lg button:hover {
            letter-spacing: 3px;
        }

        .dior-lg button:active {
            transform: scale(0.95);
        }

        .dior-lg button:focus {
            outline: none;
        }

        .dior-lg button.ghost {
            background-color: rgba(225, 225, 225, 0.2);
            border: 2px solid #fff;
            color: #fff;
        }

        button.ghost i {
            position: absolute;
            opacity: 0;
            transition: 0.3s ease-in-out;
        }

        button.ghost i.register {
            right: 70px;
        }

        button.ghost i.login {
            left: 70px;
        }

        button.ghost:hover i.register {
            right: 40px;
            opacity: 1;
        }

        button.ghost:hover i.login {
            left: 40px;
            opacity: 1;
        }

        .dior-lg form {
            background-color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 50px;
            height: 100%;
            text-align: center;
        }

        .input-p {
            background-color: #eee;
            border-radius: 10px;
            border: none;
            padding: 12px 15px;
            margin: 8px 0;
            width: 100%;
        }

        .dior-lg {
            background-color: #fff;
            border-radius: 25px;
            box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
            position: relative;
            overflow: hidden;
            width: 768px;
            max-width: 100%;
            min-height: 500px;
        }

        .form-container {
            position: absolute;
            top: 0;
            height: 100%;
            transition: all 0.6s ease-in-out;
        }

        .login-container {
            left: 0;
            width: 50%;
            z-index: 2;
        }

        .dior-lg.right-panel-active .login-container {
            transform: translateX(100%);
        }

        .register-container {
            left: 0;
            width: 50%;
            opacity: 0;
            z-index: 1;
        }

        .dior-lg.right-panel-active .register-container {
            transform: translateX(100%);
            opacity: 1;
            z-index: 5;
            animation: show 0.6s;
        }

        @keyframes show {

            0%,
            49.99% {
                opacity: 0;
                z-index: 1;
            }

            50%,
            100% {
                opacity: 1;
                z-index: 5;
            }
        }

        .overlay-container1 {
            position: absolute;
            top: 0;
            left: 50%;
            width: 50%;
            height: 100%;
            overflow: hidden;
            transition: transform 0.6s ease-in-out;
            z-index: 100;
        }

        .dior-lg.right-panel-active .overlay-container1 {
            transform: translate(-100%);
        }

        .overlay2 {
            background-image: url('image/anh1.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            background-position: 0 0;
            color: #fff;
            position: relative;
            left: -100%;
            height: 100%;
            width: 200%;
            transform: translateX(0);
            transition: transform 0.6s ease-in-out;
        }


        .dior-lg.right-panel-active .overlay2 {
            transform: translateX(50%);
        }

        .overlay2-panel {
            position: absolute;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 40px;
            text-align: center;
            top: 0;
            height: 100%;
            width: 50%;
            transform: translateX(0);
            transition: transform 0.6s ease-in-out;
        }

        .overlay2-left {
            transform: translateX(-20%);
        }

        .dior-lg.right-panel-active .overlay2-left {
            transform: translateX(0);
        }

        .overlay2-right {
            right: 0;
            transform: translateX(0);
        }

        .dior-lg.right-panel-active .overlay2-right {
            transform: translateX(20%);
        }
    </style>

    <body>
        <!-- Form đăng nhập/đăng ký -->
        <div class="inclu-lsandsg">
            <div class="dior-lg" id="dior-lg">
                <div class="form-container register-container">
                    <form action="UserServlet" method = "post">
                        <h1>Sign in</h1>
                        <input type="hidden" name="action" value="create">
                        <input type="text" placeholder="UserName" class="input-p" name="username" id="nameInput">
                        <input type="text" placeholder="Phone Number" name="phone" class="input-p">
                        <input type="password" placeholder="Password" name="pass" class="input-p">
                        <button type="submit">Sign in</button>
                        <span>or use your account</span>

                    </form>
                </div>

                <div class="form-container login-container">
                    <form action="CheckLoginServlet" method="post">
                        <h1>Login</h1>
                        <input type="text" placeholder="username" class="input-p" id="admin-email" name="username">
                        <input type="password" placeholder="Password" name="password" class="input-p"
                            id="admin-password">
                        <div class="content">
                            <div class="checkbox">
                                <input type="checkbox" name="" id="checkbox">
                                <label>Remember me</label>
                            </div>
                            <div class="pass-link">
                                <a href="#">Forgot password?</a>
                            </div>
                        </div>

                        <button type="submit">Login</button>
                        <span>or use your account</span>

                    </form>
                </div>

                <div class="overlay-container1">
                    <div class="overlay2">
                        <div class="overlay2-panel overlay2-left">
                            <h1 class="title">Hello<br>friends</h1>
                            <p>If you already have an account account login here and have fun.</p>
                            <button class="ghost" id="login">Login
                                <i class="lni lni-arrow-left login"></i>
                            </button>
                        </div>
                        <div class="overlay2-panel overlay2-right">
                            <h1 class="title">Start your<br>journey now</h1>
                            <p>If you don't have an account yet, join us and start your journey.</p>

                            <button class="ghost" id="register">Sign in
                                <i class="lni lni-arrow-right register"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            // PHẦN ĐĂNG KÝ ĐĂNG NHẬP
            const admin = [
                {
                    email: 'admin@gmail.com',
                    password: '12345678'
                }
            ];
            localStorage.setItem('admin', JSON.stringify(admin));

            // Lấy phần tử cần thiết
            const registerButton = document.getElementById('register');
            const loginButton = document.getElementById('login');
            const container = document.getElementById('dior-lg');
            const dangnhapBtns = document.querySelectorAll('.Dangnhap');
            const overlay2 = document.getElementById('overlay');
            const incluLsandsg = document.querySelector('.inclu-lsandsg');
            const nameInput = document.getElementById('nameInput'); // Lấy input Name
            const dangNhapLi = document.querySelectorAll('.Dangnhap'); // Lấy tất cả các li có class Dangnhap
            const logoutBtn = document.querySelector('.Dangxuat'); // Lấy nút Logout
            const loginForm = document.querySelector('.login-container form'); // Lấy form login
            const loginEmailInput = document.querySelector('.login-container input[type="email"]'); // Lấy input email login
            const loginPasswordInput = document.querySelector('.login-container input[type="password"]'); // Lấy input password login

            // Biến này dùng để nhận biết user đã login hay chưa. Nếu chưa là false
            var userStatus = false;


            document.addEventListener('DOMContentLoaded', function () {
                const savedName = localStorage.getItem('userName');
                const registered = localStorage.getItem('isRegistered');

                if (savedName && registered === 'true') {
                    dangNhapLi.forEach((li, index) => {
                        if (index === 0) {
                            li.innerHTML = `<i class="fa-solid fa-user-large"></i> ${savedName}`;
                        } else {
                            li.style.display = 'none';
                        }
                    });

                    logoutBtn.style.display = 'block';
                    userStatus = true;
                } else {

                    logoutBtn.style.display = 'none';
                }


                const savedEmail = localStorage.getItem('userEmail');
                const savedPassword = localStorage.getItem('userPassword');
                if (savedEmail && savedPassword) {
                    loginEmailInput.value = savedEmail;
                    loginPasswordInput.value = savedPassword;
                }
            });


            registerButton.addEventListener("click", () => {
                container.classList.add("right-panel-active");
            });

            loginButton.addEventListener("click", () => {
                container.classList.remove("right-panel-active");
            });
            dangnhapBtns.forEach(btn => {
                btn.addEventListener('click', function () {
                    overlay2.style.display = 'block';
                    incluLsandsg.style.display = 'flex';
                });
            });
            overlay2.addEventListener('click', function () {
                overlay2.style.display = 'none';
                incluLsandsg.style.display = 'none';
                container.classList.remove("right-panel-active");
            });
            const registerForm = document.querySelector('.register-container form');
            registerForm.addEventListener('submit', function (e) {
                e.preventDefault();

                const name = nameInput.value;
                const email = registerForm.querySelector('input[type="email"]').value;
                const password = registerForm.querySelector('input[type="password"]').value;

                if (!name || !email || !password) {
                    alert('Please fill in all fields to sign in.');
                    return;
                }

                let users = JSON.parse(localStorage.getItem('users')) || [];

                const existingUser = users.find(user => user.email === email);

                if (existingUser) {

                    alert('This email is already registered. Please use a different email.');
                    return;
                }
                const newId = users.length ? users[users.length - 1].id + 1 : 1;

                users.push({
                    id: newId,
                    name: name,
                    email: email,
                    password: password
                });

                localStorage.setItem('users', JSON.stringify(users));

                alert('Registration Successful!');

                dangNhapLi.forEach((li, index) => {
                    if (index === 0) {
                        li.innerHTML = `<i class="fa-solid fa-user-large"></i> ${name}`;
                    } else {
                        li.style.display = 'none';
                    }
                });

                logoutBtn.style.display = 'block';
                userStatus = true;

                overlay2.style.display = 'none';
                incluLsandsg.style.display = 'none';

                registerForm.reset();
            });

            loginForm.addEventListener('submit', function (e) {
                e.preventDefault();
                const email = loginEmailInput.value;
                const password = loginPasswordInput.value;
                const savedAdmin = JSON.parse(localStorage.getItem('admin'));

                if (email === savedAdmin[0].email && password === savedAdmin[0].password) {
                    alert('Admin Login Successful!');
                    window.location.href = '../homeAdmin/homeAdmin.html';
                    return;
                }

                const users = JSON.parse(localStorage.getItem('users')) || [];
                const user = users.find(user => user.email === email && user.password === password);

                if (user) {
                    alert('User Login Successful!');
                    logoutBtn.style.display = 'block';
                    userStatus = true;

                    const savedName = user.name;
                    dangNhapLi.forEach((li, index) => {
                        if (index === 0) {
                            li.innerHTML = `<i class="fa-solid fa-user-large"></i> ${savedName}`;
                        } else {
                            li.style.display = 'none';
                        }
                    });

                    overlay2.style.display = 'none';
                    incluLsandsg.style.display = 'none';
                } else {
                    alert('Incorrect email or password. Please try again.');
                }
            });

            logoutBtn.addEventListener('click', function () {

                userStatus = false;

                dangNhapLi.forEach(li => {
                    li.style.display = 'block';
                    if (li.innerHTML.includes('fa-user-large')) {
                        li.innerHTML = `<i class="fa-solid fa-user-large"></i> Log in`;
                    }
                });

                logoutBtn.style.display = 'none';
            });

            function handleCart() {
                if (userStatus) {
                    openCart();
                } else {
                    overlay2.style.display = 'block';
                    incluLsandsg.style.display = 'flex';
                    cartContainer.style.display = 'none';
                }
            }

            function handleChatbox() {
                if (userStatus) {
                    container_chat.style.display = 'flex';
                    chatBubble.style.display = 'none';
                } else {

                    overlay2.style.display = 'block';
                    incluLsandsg.style.display = 'flex';
                    container_chat.style.display = 'none';
                    chatBubble.style.display = 'flex';
                }
            }
            chatBubble.addEventListener('click', handleChatbox);
        </script>
    </body>

    </html>