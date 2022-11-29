<%@ page import="com.tinder.bean.User" %>
<% User user = (User) session.getAttribute("auth_user");
    if(user!=null){
        response.sendRedirect("/filter-user?id=" + user.getId());
        response.flushBuffer();
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
    <link href="./css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="container">
    <!-- Left -->
    <div class="register-left">
        <p class="register-left_title">roomeet</p>
        <p class="register-left_content">Lorem ipsum dolor sit amet,
            consectetur adipiscing elit</p>
        <img src="./img/login.png" alt="">
    </div>
    <!-- Right -->
    <div class="register-right">
        <!-- LEFT FORM -->
        <div class="clearfix register-right_top">
            <a href="registration.jsp" class="register-right_sign">Sign up</a>
            <p class="register-right_member">Not a member?</p>
        </div>
        <!-- RIGHT FORM -->
        <div class="register-right_bot">
            <h2>Sign in to roomeet</h2>
            <div class="signup">
                <p><a style="text-decoration: none; color: white;" href="#">Sign in with Google</a></p>
            </div>

            <div class="breakline">
                <span>or</span>
            </div>

            <form action="LoginServlet" method="post" class="form-signup">
                <div class="username">
                    <label>Username or Email Address</label>
                    <input type="text" name="email" placeholder="Email" required>
                </div>
                <div class="password_signin">
                    <label class="password">Password</label>
                    <span>Forget password?</span>
                    <input type="password" name="password" placeholder="Password">
                </div>
                <div class="policy">
                    <input type="checkbox" id="vehicle1" name="vehicle1" value="Bike">
                    <label for="vehicle1">Remember me</label><br>
                </div>
                <input class="submit_button" type="submit" value="Login"/>
            </form>
        </div>
    </div>
</div>
</body>
</html>

