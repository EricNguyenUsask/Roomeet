<%--
  Created by IntelliJ IDEA.
  User: vuhuy
  Date: 11/18/2022
  Time: 11:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.tinder.bean.User"%>
<%@ page import="java.util.ArrayList" %>
<% ArrayList <User> us = (ArrayList<User>) request.getAttribute("allDataUser");
  User user = (User) session.getAttribute("auth_user");
  if(user==null){
    response.sendRedirect("index.jsp");
    response.flushBuffer();
  }
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
  <link rel="stylesheet" href="./css/schedulePage.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
  <title>Schedule</title>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>


<body>
<div class="wrapper">
  <!-- navbar -->
  <div class="wrapper-navbar mt-2">
    <div class="bg-white navbar-expand-lg">
      <nav class="navbar">

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01"
                aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <ul class="navbar-nav">
          <!-- brand -->
          <li class="nav-item brand">
            <a href="/filter-user?id=<%= (user != null) ? user.getId() : 0 %>">roomeet</a>


          <li class="nav-item item">
            <div class="imaicon">
              <img src="./img/Heart.png" alt="">
            </div>
            <div class="element">
              <a href="/filter-user?id=<%= (user != null) ? user.getId() : 0 %>">Discover</a>
            </div>
          </li>

          <li class="nav-item item">
            <div class="imaicon">
              <img src="./img/mess.png" alt="">
            </div>
            <div class="element">
              <a href="#">Inbox</a>
            </div>
          </li>

          <li class="nav-item item">
            <div class="ima_icon">
              <img src="./img/home.png" alt="">
            </div>
            <div class="element">
              <a href="/create-room">Room</a>
            </div>
          </li>
        </ul>
        <ul class="navbar-nav navbar-nav_right">
          <li class="nav-item">
            <a class="nav-link notification" href="#">

            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/edit-profile?id=<%= (user != null) ? user.getId() : 0 %>">
              <img src="./img/icon_profile.svg" alt="">
            </a>
          </li>
        </ul>
      </nav>
    </div>
  </div>
  <hr class="solid">
  <!-- title -->
  <div class="wrapper-title d-flex flex-row justify-content-between title">
    <div class="center">
      <a href="/schedule">
        <input class="schedule"  type="button" value="Schedule">
      </a>
      <a href="/finance">
      <input class="finance"  type="button" value="Finance">
      </a>
    </div>
  </div>

  <!-- detail -->
  <!-- TODO: input to text field -->
  <div class="page-container">
    <div class="text-container">
      <div class="notecomponent">
        <label class="title1">Note</label>

        <div class="notiNote">
          <div class="notIcon">
            <img src="./img/redIcon.png" alt="">
          </div>
          <div class="noti">
            <input type="text" id="textfield" onkeyup="saveValue(this);">
          </div>
        </div>

        <div class="notiNote">
          <div class="notIcon">
            <img src="./img/redIcon.png" alt="">
          </div>
          <div class="noti">
            <input type="text" id="textfield1" onkeyup="saveValue(this);">
          </div>
        </div>

        <div class="notiNote">
          <div class="notIcon">
            <img src="./img/redIcon.png" alt="">
          </div>
          <div class="noti">
            <input type="text" id="textfield2" onkeyup="saveValue(this);">
          </div>
        </div>

        <div class="notiNote">
          <div class="notIcon">
            <img src="./img/redIcon.png" alt="">
          </div>
          <div class="noti">
            <input type="text" id="textfield3" onkeyup="saveValue(this);">
          </div>
        </div>

        <div class="notiNote">
          <div class="notIcon">
            <img src="./img/redIcon.png" alt="">
          </div>
          <div class="noti">
            <input type="text" id="textfield4" onkeyup="saveValue(this);">
          </div>
        </div>

        <div class="notiNote">
          <div class="notIcon">
            <img src="./img/redIcon.png" alt="">
          </div>
          <div class="noti">
            <input type="text" id="textfield5" onkeyup="saveValue(this);">
          </div>
        </div>

      </div>

      <!-- TODO: input to text field -->
      <div class="rulecomponent">
        <label class="title1">Welcome to the House Rules</label>

        <div class="notiNote">
          <div class="notIcon">
            <img src="./img/greenNoti.png" alt="">
          </div>
          <div class="noti">
            <input type="text" id="textfield6" onkeyup="saveValue(this);">
          </div>
        </div>

        <div class="notiNote">
          <div class="notIcon">
            <img src="./img/greenNoti.png" alt="">
          </div>
          <div class="noti">
            <input type="text" id="textfield7" onkeyup="saveValue(this);">
          </div>
        </div>

        <div class="notiNote">
          <div class="notIcon">
            <img src="./img/greenNoti.png" alt="">
          </div>
          <div class="noti">
            <input type="text" id="textfield8" onkeyup="saveValue(this);">
          </div>
        </div>

        <div class="notiNote">
          <div class="notIcon">
            <img src="./img/greenNoti.png" alt="">
          </div>
          <div class="noti">
            <input type="text" id="textfield9" onkeyup="saveValue(this);">
          </div>
        </div>

        <div class="notiNote">
          <div class="notIcon">
            <img src="./img/greenNoti.png" alt="">
          </div>
          <div class="noti">
            <input type="text" id="textfield10" onkeyup="saveValue(this);">
          </div>
        </div>

        <div class="notiNote">
          <div class="notIcon">
            <img src="./img/greenNoti.png" alt="">
          </div>
          <div class="noti">
            <input type="text" id="textfield11" onkeyup="saveValue(this);">
          </div>
        </div>

        <div class="notiNote">
          <div class="notIcon">
            <img src="./img/greenNoti.png" alt="">
          </div>
          <div class="noti">
            <input type="text" id="textfield12" onkeyup="saveValue(this);">
          </div>
        </div>

        <div class="notiNote">
          <div class="notIcon">
            <img src="./img/greenNoti.png" alt="">
          </div>
          <div class="noti">
            <input type="text" id="textfield13" onkeyup="saveValue(this);">
          </div>
        </div>

        <div class="notiNote">
          <div class="notIcon">
            <img src="./img/greenNoti.png" alt="">
          </div>
          <div class="noti">
            <input type="text" id="textfield14" onkeyup="saveValue(this);">
          </div>
        </div>

        <div class="notiNote">
          <div class="notIcon">
            <img src="./img/greenNoti.png" alt="">
          </div>
          <div class="noti">
            <input type="text" id="textfield15" onkeyup="saveValue(this);">
          </div>
        </div>

        <div class="notiNote">
          <div class="notIcon">
            <img src="./img/greenNoti.png" alt="">
          </div>
          <div class="noti">
            <input type="text" id="textfield16" onkeyup="saveValue(this);">
          </div>
        </div>

      </div>
    </div>
    <div class="schedule-container">
      <div class="calender">
        <iframe class="detail"
                src="https://calendar.google.com/calendar/embed?height=600&wkst=2&bgcolor=%23e8f2fe&ctz=America%2FRegina&showTitle=0&showDate=1&showNav=1&showPrint=0&showTabs=1&mode=WEEK&showCalendars=0&showTz=0&src=ODRiNmY5NDAzYTExZjRhZjkyOWUwZGI2NTM5YTllZDc3YjFjYjY3MjdjMWU0OTdjMzQyMjE5ZTQxNDI4NGUyOEBncm91cC5jYWxlbmRhci5nb29nbGUuY29t&color=%237986CB"
                style="border:solid 0px #777" width="800" height="600" frameborder="0" scrolling="no"></iframe>
<%--  <iframe class="detail"--%>
<%--          src="https://calendar.google.com/calendar/embed?height=600&wkst=1&bgcolor=%23ffffff&ctz=America%2FRegina&src=dnVodXl0cnVvbmcxOTFAZ21haWwuY29t&color=%23039BE5"--%>
<%--          style="border:solid 1px #777" width="800" height="600" frameborder="0" scrolling="no"></iframe>--%>
      </div>
    </div>
  </div>

</div>
</body>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>

<script src="./js/schedule.js"></script>

</html>
