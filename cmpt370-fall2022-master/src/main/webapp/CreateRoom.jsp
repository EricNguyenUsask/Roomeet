<%@ page import="com.tinder.bean.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.tinder.bean.Room" %>
<%@ page import="java.util.ArrayList" %>
<% User user = (User) session.getAttribute("auth_user");
    if(user==null){
        response.sendRedirect("index.jsp");
        response.flushBuffer();
    }
    Room room = (Room) request.getAttribute("dataRoom");
    ArrayList<User> lst = (ArrayList<User>) request.getAttribute("lst");

%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
    <link rel="stylesheet" href="./css/CreateRoom.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">

    <title>Room</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;400;500;700;900&display=swap"
          rel="stylesheet">
</head>
<body>
<div class="wrapper">
    <!--Navbar -->
    <div class="wrapper-navbar mt-2">
        <div class="bg-white navbar-expand-lg">
            <nav class="navbar">

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01"
                        aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <ul class="navbar-nav">

                    <!-- Brand  -->
                    <li class="nav-item brand">
                        <a href="/filter-user?id=<%= (user != null) ? user.getId() : 0 %>">roomeet</a>

                    <li class="nav-item item">
                        <div class="ima_icon">
                            <img src="./img/Heart.svg" alt="">
                        </div>
                        <div class="element">
                            <a href="/filter-user?id=<%= (user != null) ? user.getId() : 0 %>">Discover</a>
                        </div>
                    </li>

                    <li class="nav-item item">
                        <div class="ima_icon">
                            <img src="./img/Mess.svg" alt="">
                        </div>
                        <div class="element">
                            <a href="#">Inbox</a>
                        </div>
                    </li>

                    <li class="nav-item item">
                        <div class="ima_icon">
                            <img src="./img/Home.svg" alt="">
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


    <!-- DETAIL -->
    <!-- Button trigger modal -->
    <div class="page_container">
        <div class="left">
            <button id="createAddRoom" type="button" class="roundRoomButton" data-toggle="modal" data-target="#modalAddRoom">
                <img src="./img/Add.svg" alt="">
                <space>&ensp;</space>
                Add Room
            </button>
            <!-- Modal -->
            <div class="modal fade" id="modalAddRoom" tabindex="-1" role="dialog" aria-labelledby="modalAddRoomLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalAddRoomLabel">Add Room</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <form action="AddRoomServlet" method="post">
                            <div class="modal-body">
                                <div class="form-group col-md-12">
                                    <label class="PopUpTitle" for="myRoom">Room Name</label>
                                    <input name="room" type="text" class="form-control" id="myRoom" placeholder="We're Roomies">
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="submit" class="saveButton1" data-dismiss="modal">Cancel</button>
                                <input class="submit_button" type="submit" value="Add Room"></input>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <div>
            <button type="button" class="roundRoomButton" data-toggle="modal" data-target="#exampleModal">
                <img src="./img/Add.svg" alt="">
                <space>&ensp;</space>
                Add user into room
            </button>


            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Create Group</h5>
                            <button id="myCloseModal" type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <form action="GroupServlet" method="post">
                            <div class="modal-body">
                                <div class="form-group col-md-12">
                                    <label class="PopUpTitle" for="inputEmail4">Group Name</label>
                                    <input type="text" class="form-control" id="groupName" readonly placeholder="We're Roomies">
                                </div>

                                <div class="form-group col-md-12">
                                    <label class="PopUpTitle" for="inputEmail4">Email address</label>
                                </div>

                                <div class="emailList">
                                    <div class="form-group col-md-12">
                                        <div class="emailBorder">
                                            <ulmail class="inputEmail">

                                                <li>
                                                    <input type="text" class="email-form" id="emailAdress" placeholder="shawn.mendez@gmail.com">

                                                    <div class="inp-group">
                                                    </div>
<%--                                                    <script>--%>
<%--                                                        var closebtns = document.getElementsByClassName("closeEmail");--%>
<%--                                                        var i;--%>

<%--                                                        for (i = 0; i < closebtns.length; i++) {--%>
<%--                                                            closebtns[i].addEventListener("click", function () {--%>
<%--                                                                this.parentElement.style.display = 'none';--%>
<%--                                                            });--%>
<%--                                                        }--%>
<%--                                                    </script>--%>
<%--                                                    <script src="./js/CreateRoomJs.js"></script>--%>


                                                </li>


                                            </ulmail>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-12">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                                        <label class="Subtitle" for="defaultCheck1">
                                            Receive group notifications and events.</label>
                                    </div>
                                </div>
                            </div>

                            <div class="modal-footer">

                                <div class="form-group col-md-12">
                                    <label class="Subtitle" for="inputEmail4">You’ll be able to add members after you select
                                        Create.</label>
                                </div>
                                <button type="button" class="saveButton1" data-dismiss="modal">Cancel</button>
                                <button data-dismiss="modal" id="myCreateRoom" type="button" class="saveButton2">Create</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>

    </div>

    <!-- Group Tablet Container -->
    <% if(user != null && user.getRoomId() != 0) {%>
        <div class="group1_container">
            <div class="shadow p-2 mb-4 bg-white rounded">
                <div class="card-body">
                    <h5 class="card-title">We're Roomies: group chat</h5>
                    <a href="/room">
                        <img class="card-img-bottom" src="./img/GroupImage1.svg" alt="Card image cap">
                    </a>
                    <% if(lst != null)
                    {
                    %>
                    <%
                        for(int i = 0; i < lst.size() ; i++) { //us.size()
                            User u = new User();
                            u = lst.get(i);
                    %>
                    <p><%= u.getName() %> : <%= u.getEmail() %></p>
                    <%
                            }
                        };
                    %>
                </div>
            </div>
        </div>
    <%}
    %>
<div class="group2_container">
    <div class="shadow p-2 mb-4 bg-white rounded">
        <div class="card-body">
            <h5 class="card-title">We're Roomies: Schedule </h5>
        </div>
        <a href="/schedule">
        <img class="card-img-bottom" src="./img/GroupImage1.svg" alt="Card image cap">
        </a>
    </div>
</div>
<div class="group3_container">
    <div class="shadow p-2 mb-4 bg-white rounded">
        <div class="card-body">
            <h5 class="card-title">We're Roomies: Finance </h5>
        </div>
        <a href="/finance">
        <img class="card-img-bottom" src="./img/GroupImage1.svg" alt="Card image cap">
        </a>

    </div>
</div>
</div>

</div>


</body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
<script
        src="https://code.jquery.com/jquery-3.6.0.min.js"
></script>
<script src="./js/CreateRoomJs.js"></script>
<script>
    var id = <%= (user != null) ? user.getId() : null %>;
    $(document).ready(function() {
        var room_name = '<%= (room != null) ? room.getName() : "" %>';
        var room_id = <%= (room != null) ? room.getId() : null %>;
        $("#groupName").val(room_name);
        $("#createAddRoom").click(function (e) {
            if(room_id) {
                alert("Room created !!");
                e.preventDefault();
                return false;
            }
        })

        $( "#myCreateRoom" ).click(function() {
            var email = $('#emailAdress').val();
            if(email && room_id) {
                $.post('http://localhost:8080/create-room', {
                    email : email,
                    id: room_id,

                }, function(response) {
                    if(response == 'true') {
                        alert(`Add successfully !!!`);
                    }
                    else if(response == 'not exists') {
                        alert(`Email not exists`);
                    }
                    else {
                        alert(`Email is in another room`);
                    }
                });
            }else {
                alert(`You donot have a room, please create your room!!`);
                $("#modalAddRoom").modal("show")
            }
            $("#emailAdress").val("");
            $('#StudentModal').modal('hide');
            return false;
        })

    });
</script>
</html>
