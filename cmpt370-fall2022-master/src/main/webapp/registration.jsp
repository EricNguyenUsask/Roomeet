<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
    <title>Roomeet</title>
    <link rel="stylesheet" href="css/style2.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;400;500;700;800&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>

<body>
<section>
    <div class="left_container">
        <div class="label_1">roomeet </div>
        <div class="label_2">Lorem ipsum dolor sit amet,<br> consectetur adipiscing elit</div>
        <img class="panel_left" src="./img/panel_left.png" alt="">
    </div>
    <div class="right_container">

        <div class="label_3">Already a member? </div>
        <div class="label_4"><a href="index.jsp" class="sign">Sign In</a></div>
        <div class="label_5">Sign up to roomeet</div>
        <button class="buttonSign">
            <i class="fa-brands fa-google"></i>
            Sign up with Google
        </button>
        <div class="label_6">______________________or_________________________</div>

        <div class="signBox">
            <form action="RegisterServlet" method="post">

                <%--@declare id="uname"--%><%--@declare id="email"--%><%--@declare id="pass"--%><div class="user">
                    <div class="firstname">
                        <label >Firstname</label>
                        <input type="text" name="firstname" placeholder="Firstname">
                    </div>
                    <div class="lastname">
                        <label>Lastname</label>
                        <input type="text" name="lastname" placeholder="Lastname">
                    </div>
                </div>
                <div>
                <label>Username</label>
                <input type="text" id="lname" name="name" placeholder="Username" required></div>

                <label for="Email">Email</label>
                <input type="email" id="lname" name="email" placeholder="Email" required>

                <label for="pass">Password</label>
                <input type="password" id="lname" name="password" placeholder="Password" required>


                <div class="term">
                    <input type="checkbox" id="verify" name="verify" unchecked>
                    <label for="verify"> I agree to our Term and Conditions and Privacy Statements
                    </label>
                </div>

                <input type="submit" value="Create Account">

            </form>
        </div>
    </div>

</section>

</body>
