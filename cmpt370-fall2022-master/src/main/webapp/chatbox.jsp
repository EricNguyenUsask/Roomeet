<%@ page import="com.tinder.bean.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tinder.bean.RoomChat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% ArrayList<RoomChat> chats = (ArrayList<RoomChat>) request.getAttribute("allDataChats");
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
  <link rel="stylesheet" href="./css/chatBox.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
  <title>Chat</title>

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

        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false"
                aria-label="Toggle navigation">
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
              <a href="#" style="color: #F0909D;">Room</a>
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


  <!-- Chat system -->


  <div class="container">

    <section class="discussions">
      <div class="region">
        <div class="person">
          <img class="icon2" src="./img/human.png" alt="" style=" color:aqua">

        </div>
        <br><br>

        <h3> Active User:</h3>
        <div id="content"></div>
      </div>
    </section>

    <section class="chat" >
      <div class="header-chat">

        <p class="name">Room Chat- <%= (user != null) ? user.getRoomId() : null %></p>
      </div>
      <textarea class="messages-chat" id="myAreaMessage" rows="19.5" cols="80" >
      </textarea>>
      <div class="footer-chat">
        <div class="chat1">
          <img src="./img/smile.png" alt="">
          <input type="text" class="write-message" id="myMessage" placeholder="Type something..."></input>

        </div>
        <div class="chat2">
          <input class="send" type="image"  src="./img/send1.png" alt="" onclick="sendMessage()" />


        </div>
      </div>
    </section>

  </div>


</div>
<script></script>
<script>
  var user_id = <%= (user != null) ? user.getId() : null %>;
  var room_id = <%= (user != null) ? user.getRoomId() : null %>;
  var user_name = '<%= (user != null) ? user.getName() : null %>';
  var chat = '';
  <% if(chats != null)
              {
                  %>
  <%
      for(int i=0;i<chats.size();i++){%>
  chat += "<%= chats.get(i).getUserName()%>" + ": " + "<%= chats.get(i).getMessage()%>" + " \n";

  myAreaMessage.value = chat;
  <%
      }
      };
  %>

  <%--    <%--%>
  <%--    for(int i=0;i<chats.size();i++){%>--%>
  <%--        chat += "<%= chats.get(i).getUserName()%>" + ": " + "<%= chats.get(i).getMessage()%>" + " \n";--%>
  <%--    <%}%>--%>
  <%--    myAreaMessage.value = chat;--%>
</script>
<script src="./js/room.js"></script>

</body>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>


</html>

