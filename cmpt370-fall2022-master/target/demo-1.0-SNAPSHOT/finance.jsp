<%--
  Created by IntelliJ IDEA.
  User: vuhuy
  Date: 11/18/2022
  Time: 11:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.tinder.bean.User"%>
<%@ page import="java.util.ArrayList" %>
<% ArrayList <User> us = (ArrayList<User>) request.getAttribute("allDataUser");
  User user = (User) session.getAttribute("auth_user");
  if(user==null){
    response.sendRedirect("index.jsp");
    response.flushBuffer();
  }
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
  <link rel="stylesheet" href="./css/finance.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
  <title>Finance</title>

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
              <a href="#" style="color: #F0909D;">Inbox</a>
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
      </a>    </div>
  </div>

  <div class="page-container">
    <div class="text-container">
      <div class="label-component1">
        <div class="label1">Recent friends</div>

        <button class="add-friend" data-toggle="modal" data-target="#exampleModal">
          <img src="./img/addFriend.png" alt="">
        </button>

        <!-- Modal -->

        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add to Group Bill</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>

              <div class="modal-body">

                <div class="form-group col-md-12">
                  <label class="PopUpTitle" for="inputEmail4">Email address</label>
                  <!-- <div class="wrap"> -->
                  <a href="#" class="add">&plus;</a>
                  <!-- </div> -->
                </div>
                <div class="emailList">
                  <div class="form-group col-md-12">
                    <div class="emailBorder">
                      <ulmail class="inputEmail">
                        <!-- Add Email -->
                        <!-- <div class="container">
<div class="wrap">
<a href="#" class="add">&plus;</a>
</div> -->
                        <li>
                          <input type="text1" class="email-form" id="inputEmail4"
                                 placeholder="shawn.mendez@gmail.com">

                          <div class="inp-group">

                          </div>
                          <script>
                            var closebtns = document.getElementsByClassName("closeEmail");
                            var i;

                            for (i = 0; i < closebtns.length; i++) {
                              closebtns[i].addEventListener("click", function () {
                                this.parentElement.style.display = 'none';
                              });
                            }
                          </script>
                          <script src="roomScript.js"></script>


                        </li>
                      </ulmail>
                    </div>
                  </div>
                </div>

              </div>
              <div class="modal-footer">

                <button type="button" class="saveButton1" data-dismiss="modal">Cancel</button>
                <button type="button" class="saveButton2">Add</button>

              </div>

            </div>
          </div>
        </div>
      </div>
      <div class="notecomponent">
        <div class="photo" style="background-image: url(https://i.ibb.co/Dw7k1St/shawn.png);">

          <div class="name">SHAWN MENDEZ</div>
          <button class="delete-friend">
            <img src="./img/close.png" alt=""> </button>
        </div>

        <div class="photo" style="background-image: url(https://i.ibb.co/85gxnTx/anie.png);">
          <div class="name">JESSICA</div>
          <button class="delete-friend">
            <img src="./img/close.png" alt=""> </button>
        </div>

        <div class="photo" style="background-image: url(https://i.ibb.co/PZPKqPF/jieun.png);">
          <div class="name">LEE SO HUYN</div>
          <button class="delete-friend">
            <img src="./img/close.png" alt=""> </button>
        </div>

        <div class="photo" style="background-image: url(https://card.thomasdaubenton.com/img/photo.jpg);">
          <div class="name">PATRICK HENRY</div>
          <button class="delete-friend">
            <img src="./img/close.png" alt=""> </button>
        </div>

        <div class="photo" style="background-image: url(https://i.ibb.co/cy9c0rV/hosten.png);">
          <div class="name">HANNIBEL LECTER</div>
          <button class="delete-friend">
            <img src="./img/close.png" alt=""> </button>
        </div>

        <div class="photo" style="background-image: url(https://i.ibb.co/VLhJX5x/katy.png);">
          <div class="name">UCHIHA ITACHI</div>
          <button class="delete-friend">
            <img src="./img/close.png" alt=""> </button>
        </div>

      </div>

      <div class="label-component2">
        <div class="label1">Recent bills</div>
      </div>

      <!-- TODO: input to text field -->
      <div class="rulecomponent">
        <div class="payment">
          <div class="chart-icon">
            <img src="./img/chart.png" alt="">
          </div>
          <div class="payment-text">
            <div class="payment-text1">Big E party</div>
            <div class="payment-text2">01 Nov,2022</div>
          </div>

          <div class="payment-detail">
            <div class="payment-detail1">$128.60</div>
            <div class="payment-detail2"><img src="./img/person.png"
                                              style="margin-right: 10px; margin-bottom: 5px; margin-left: 0px;" alt="">
              4 persons</div>
          </div>
        </div>

        <div class="payment">
          <div class="chart-icon">
            <img src="./img/chart.png" alt="">
          </div>
          <div class="payment-text">
            <div class="payment-text1">Big E party</div>
            <div class="payment-text2">01 Nov,2022</div>
          </div>

          <div class="payment-detail">
            <div class="payment-detail1">$128.60</div>
            <div class="payment-detail2"><img src="./img/person.png"
                                              style="margin-right: 10px; margin-bottom: 5px; margin-left: 0px;" alt="">
              4 persons</div>
          </div>
        </div>

        <div class="payment">
          <div class="chart-icon">
            <img src="./img/chart.png" alt="">
          </div>
          <div class="payment-text">
            <div class="payment-text1">Big E party</div>
            <div class="payment-text2">01 Nov,2022</div>
          </div>

          <div class="payment-detail">
            <div class="payment-detail1">$128.60</div>
            <div class="payment-detail2"><img src="./img/person.png"
                                              style="margin-right: 10px; margin-bottom: 5px; margin-left: 0px;" alt="">
              4 persons</div>
          </div>
        </div>

        <div class="payment">
          <div class="chart-icon">
            <img src="./img/chart.png" alt="">
          </div>
          <div class="payment-text">
            <div class="payment-text1">Big E party</div>
            <div class="payment-text2">01 Nov,2022</div>
          </div>

          <div class="payment-detail">
            <div class="payment-detail1">$128.60</div>
            <div class="payment-detail2"><img src="./img/person.png"
                                              style="margin-right: 10px; margin-bottom: 5px; margin-left: 0px;" alt="">
              4 persons</div>
          </div>
        </div>

        <div class="payment">
          <div class="chart-icon">
            <img src="./img/chart.png" alt="">
          </div>
          <div class="payment-text">
            <div class="payment-text1">Big E party</div>
            <div class="payment-text2">01 Nov,2022</div>
          </div>

          <div class="payment-detail">
            <div class="payment-detail1">$128.60</div>
            <div class="payment-detail2"><img src="./img/person.png"
                                              style="margin-right: 10px; margin-bottom: 5px; margin-left: 0px;" alt="">
              4 persons</div>
          </div>
        </div>
      </div>
    </div>
    <div class="schedule-container">
      <div class="search-bar">
        <div class="footer-chat">
          <div class="chat1">
            <img src="./img/pen.png" style=" margin-left: 20px; margin-bottom: 5px;" alt="">
            <input type="text" class="write-message" placeholder="Description..."></input>
          </div>
        </div>
      </div>

      <div class="money-field">
        <div class="price">
          <div class="label-price">Total bill</div>
          <div class="price-filed">
            <input type="text" class="price-number" id="cost" placeholder="$"
                   style="width:110px;"></input>
          </div>
        </div>
        <button class="add-person" data-toggle="modal" data-target="#exampleModal">
          <img src="./img/userfollow.png" style="scale: 0.85; opacity: 0.8;" alt="">
        </button>

      </div>
      <div class="slider-price">
        <div class="slider1">
          <div class="photo" style="background-image: url(https://i.ibb.co/Dw7k1St/shawn.png);">

            <div class="name1">Shawn Mendez pay for</div>
            <div class="name2">
              <p><span id="demo"></span> %</p>
            </div>
            <div class="name3">
              <p>$<span id="pay"></span> </p>
            </div>
            <button class="trash">
              <img src="./img/trash.png" alt=""> </button>
          </div>
          <div class="slidecontainer">
            <input type="range" min="0" max="100" value="25" class="slider" id="myRange">

          </div>
        </div>
      </div>

      <div class="slider-price">
        <div class="slider1">
          <div class="photo" style="background-image: url(https://i.ibb.co/85gxnTx/anie.png);">

            <div class="name1">Jessica pay for</div>
            <div class="name2">
              <p><span id="demo2"></span> %</p>
            </div>
            <div class="name3">
              <p>$<span id="pay2"></span> </p>
            </div>
            <button class="trash">
              <img src="./img/trash.png" alt=""> </button>
          </div>
          <div class="slidecontainer">
            <input type="range" min="0" max="100" value="25" class="slider" id="myRange2">

          </div>
        </div>
      </div>

      <div class="slider-price">
        <div class="slider1">
          <div class="photo" style="background-image: url(https://i.ibb.co/cy9c0rV/hosten.png);">

            <div class="name1">Hosteng pay for</div>
            <div class="name2">
              <p><span id="demo3"></span> %</p>
            </div>
            <div class="name3">
              <p>$<span id="pay3"></span> </p>
            </div>
            <button class="trash">
              <img src="./img/trash.png" alt=""> </button>
          </div>
          <div class="slidecontainer">
            <input type="range" min="0" max="100" value="25" class="slider" id="myRange3">

          </div>
        </div>
      </div>

      <div class="slider-price">
        <div class="slider1">
          <div class="photo" style="background-image: url(https://i.ibb.co/PZPKqPF/jieun.png);">

            <div class="name1">Lee So Huyn pay for</div>
            <div class="name2">
              <p><span id="demo4"></span> %</p>
            </div>
            <div class="name3">
              <p>$<span id="pay4"></span> </p>
            </div>
            <button class="trash">
              <img src="./img/trash.png" alt=""> </button>
          </div>
          <div class="slidecontainer">
            <input type="range" min="0" max="100" value="25" class="slider" id="myRange4">

          </div>
        </div>
      </div>
      <div class="save-button">
        <div class="wrapper-title d-flex flex-row justify-content-between title">
          <div class="center">
            <input class="clear" type="button" value="Clear">
            <button onclick="mcheckValidShare()" class="save">Save</button>
          </div>
        </div>
      </div>
    </div>
  </div>



</div>


</body>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>

<script src="./js/finance.js"></script>

</html>

