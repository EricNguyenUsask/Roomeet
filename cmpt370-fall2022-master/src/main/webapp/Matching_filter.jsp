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
  <link rel="stylesheet" href="css/test.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
  <title>Profile</title>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
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
              <a href="/filter-user?id=<%= (user != null) ? user.getId() : 0 %>" style="color: #F0909D;">Discover</a>
            </div>
          </li>

          <li class="nav-item item">
            <div class="imaicon">
              <img src="./img/mess.png" alt="">
            </div>
            <div class="element">
              <a href="#" >Inbox</a>
            </div>
          </li>

          <li class="nav-item item">
            <div class="ima_icon">
              <img src="./img/home.png" alt="">
            </div>
            <div class="element">
                          <a href="/create-room">room</a>
            </div>
          </li>
        </ul>
        <ul class="navbar-nav navbar-nav_right">
          <li class="nav-item">
            <a class="nav-link notification" href="#">

<%--              <img src="./img/Vector.svg" alt="">--%>
<%--              <span class="badge">5</span>--%>
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
  <!-- Title -->
  <div class="wrapper-title d-flex flex-row justify-content-between title">
    <div></div>
    <div class="center">
      <input class="suggestion" id="idSuggest" type="button" value="Suggestion">
      <input class="matching" id="idMatch" type="button" value="Matching">
    </div>
    <div class="end" id="filterBtn">
      <img src="./img/filter.svg" alt="">
      <input class="filter_b" type="button" value="Filter">
    </div>
  </div>


  <div class="filter-block" id="filterBlock">

    <div class="dropTitle"> <b>Location</b>
      <form>
        <select name="colour1" id="colour1" style="width: 320px;">
          <option value="saskatoon">Saskatoon</option>--%>
          <option value="vancouver">Vancouver</option>
          <option value="toronto">Toronto</option>
        </select>
      </form>
    </div>

    <div class="dropTitle">
      <b>Budget</b>
      <div class="range_container">
        <div class="sliders_control">
          <input id="fromSlider" type="range" value="0" min="0" max="2000" />
          <input id="toSlider" type="range" value="2000" min="0" max="2000" />
        </div>
        <div class="form_control">
          <div class="form_control_container">
            <div class="form_control_container__time">Min</div>
            <input class="form_control_container__time__input" type="number" id="fromInput" value="0" min="0"
                   max="2000" />
          </div>
          <div class="form_control_container">
            <div class="form_control_container__time">Max</div>
            <input class="form_control_container__time__input" type="number" id="toInput" value="2000" min="0"
                   max="2000" />
          </div>
        </div>
      </div>

    </div>

    <div class="dropTitle">
      <b>Gender</b>
      <form>
        <select name="colour1" id="colour2" style="width: 320px;">
          <option value="none">Non - binary</option>--%>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
        </select>
      </form>
    </div>

    <div class="dropTitle">
      <b>Age</b>

      <div class="container">
        <div class="slider-track"></div>
        <input type="range" min="0" max="100" value="16" id="slider-1" oninput="slideOne()">
        <input type="range" min="0" max="100" value="65" id="slider-2" oninput="slideTwo()">
      </div>
      <div class="values">
          <span id="range1">
            0
          </span>
        <span> &dash; </span>
        <span id="range2">
            100
          </span>
      </div>

    </div>


  </div>



  <!-- Content -->
  <div class="wrapper-content">

      <%
        for(int i = 0; i < 8 ; i++) { //us.size()
        User u = new User();
        u = us.get(i);
      %>

      <div class="card" >

        <img src="<%= u.getAvatar() %>"  />
        <div class="info_button">
          <button class="infomation"><i class="fa-regular fa-rectangle-xmark"></i></button>
          <button class="infomation"><i class="fa-regular fa-heart"></i></button>
          <button class="infomation"><i class="fa-solid fa-circle-info"></i></button>
        </div>
        <a href="/edit-profile?id=<%= u.getId() %>">

        <span ><%= u.getName() %><br><%= u.getLocation() %> <br>  <%= u.getEmail() %>
        </a>

        </span>
      </div>
      <%
        };
      %>

  </div>

</div>
</body>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
<script
        src="https://code.jquery.com/jquery-3.6.0.min.js"
></script>
<script src="./js/index.js"></script>

<script>
  // ajaxno
  $(document).ready(function() {
    $( "#idSuggest" ).click(function() {
      var nameLocation = $('#colour1').find(":selected").val();//
      var nameGender = $('#colour2').find(":selected").val();
      // var minbud = $('#fromSlider').find(":selected").val();
      var minbud = document.getElementById("fromSlider").value;
      var maxbud = document.getElementById("toSlider").value;
      var minage = document.getElementById("slider-1").value;
      var maxage = document.getElementById("slider-2").value;


      $.post('http://localhost:8080/filter-user', {
        location : nameLocation,
        gender: nameGender,
        minBud: minbud,
        maxBud: maxbud,
        minAge: minage,
        maxAge:maxage,
        requestType : "filter",
      }, function(response) {
        var test ='';
        for(let i = 0; i < response.length; i++) {
          test +=
                  // '  <div class="wrapper-content">'+
                  '<div class="card">' +
                  '<img src="' + response[i].avatar + '" />' +
                  '<div class="info_button">'+
                  '<button class="infomation"><i class="fa-regular fa-rectangle-xmark"></i></button>'+
                  '<button class="infomation"><i class="fa-regular fa-heart"></i></button>'+
                  '<button class="infomation"><i class="fa-solid fa-circle-info"></i></button>'+
                  '</div>'+
                  '<a href="/edit-profile?id='+response[i].id+'">'+
                  '<span>' + response[i].name + '<br>'+ response[i].location +'<br>'+ response[i].email+
                  '</a>'+


                  '</span>' +
                  // '</div>'+
                  '</div>';
        }
        $( ".wrapper-content" ).html(test);
      });
    });

    $( "#idMatch" ).click(function() {
      $.post('http://localhost:8080/filter-user', {
        requestType : "match",
      }, function(response) {
        var test ='';
        for(let i = 0; i < Math.min(response.length, 8); i++) {
          console.log(response[i].email, 'email')
          test +=
                  // '  <div class="wrapper-content">'+
                  '<div class="card">' +
                  '<img src="' + response[i].avatar + '" />' +
                  '<div class="info_button">'+
                  '<button class="infomation"><i class="fa-regular fa-rectangle-xmark"></i></button>'+
                  '<button class="infomation"><i class="fa-regular fa-heart"></i></button>'+
                  '<button class="infomation"><i class="fa-solid fa-circle-info"></i></button>'+
                  '</div>'+
                  '<a href="/edit-profile?id='+response[i].id+'">'+

                  '<span>' + response[i].name + '<br>'+ response[i].location  +'<br>'+ response[i].email+
                  '</a>'+
                  '</span>' +
                  // '</div>'+
                  '</div>';

        }
        $( ".wrapper-content" ).html(test);
      });
    });
  });
</script>


</html>