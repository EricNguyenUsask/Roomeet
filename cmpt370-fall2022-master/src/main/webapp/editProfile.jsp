<%--
  Created by IntelliJ IDEA.
  User: vuhuy
  Date: 10/20/2022
  Time: 12:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.tinder.dao.UserDatabase"%>
<%@page import="com.tinder.bean.User"%>
<% User user = (User) request.getAttribute("dataUser");
    if(user==null){
        response.sendRedirect("registration.jsp");
    }
    ;
    assert user != null;%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
    <link rel="stylesheet" href="css/edit_profile.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200;400;500;700;900&display=swap"
          rel="stylesheet">
    <title>User Profile</title>
</head>

<body>
<script></script>
<div class="wrapper">
    <!-- Navbar -->
    <div class="wrapper-navbar mt-2">
        <div class="bg-white navbar-expand-lg">
            <nav class="navbar">

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01"
                        aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <ul class="navbar-nav">
                    <!-- Brand -->
                    <li class="nav-item brand">
                        <a href="/filter-user?id=<%= (user != null) ? user.getId() : 0 %>">roomeet</a>

                    <li class="nav-item item">
                        <div class="ima_icon">
                            <img src="./img/Heart.png" alt="">
                        </div>
                        <div class="element">
                            <a href="/filter-user?id=<%= (user != null) ? user.getId() : 0 %>">Discover</a>
                        </div>
                    </li>

                    <li class="nav-item item">
                        <div class="ima_icon">
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
                        <a class="nav-link" >
                            <img src="./img/icon_profile.svg" alt="">
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    <hr class="solid">

    <!-- User Photo -->
    <section>
        <div class="middle_container">
            <!-- Horizontal Rule  -->
            <hr class="h">
            <!-- Hover  -->
            <!-- <div class="user_image">
                <img src="HoverProfie.svg" height="300" alt="" class="center">
            </div> -->
            <!-- User Image -->
            <div class="user_image"><img src="<%=  (user != null) ? user.getAvatar() : "./img/no-user.png"%>" height="250" width="100" alt="" class="center">
            </div>
            <!-- Editor Pen -->
            <div class="penEdit">
                <a class="pen" href="#">
                    <img src="./img/PenEdit.svg" height="60" alt="" class="pen">
                </a>
            </div>


        </div>

    </section>


    <section>
        <!--Table of Contents-->
        <form>
            <!--Profile Photo Upload-->
            <div class="form-row">
                <div class="form-group col-md-5">
                    <label for="inputEmail4">Profile Photo:</label> <input
                        type="file" id="image-input" accept="image/png, image/jpg" name="photo" size="50" />
                    <div id = "display_image"></div>
                </div>
            </div>

            <!--First Name and Last Name-->
            <div class="form-row">
                <div class="form-group col-md-5">
                    <label for="inputEmail4">First Name *</label>
                    <input type="text" class="form-control" id="inputEmail24" placeholder="<%= user.getFirstName() %>" value="">
                </div>
                <div class="form-group col-md-5">
                    <label for="inputPassword4">Last Name *</label>
                    <input type="text" class="form-control" id="inputPassword44" placeholder="<%= (user.getLastName() != null) ? user.getLastName() : ""%>">
                </div>
            </div>

            <!--Email and Date of Birth-->
            <div class="DoB">
                <div class="form-row">
                    <div class="form-group col-md-5">
                        <label for="inputEmail4">Email *</label>
                        <input type="text" class="form-control" id="inputEmail4" placeholder="<%= user.getEmail()%>">
                    </div>


                    <div class="form-group col-md-5">
                        <%--@declare id="dateofbirth"--%><label for="dateofbirth">Date of Birth *</label> <br>
                        <input type="date" class="form-control" id="DoB" name="Dob" value="<%= (user.getDob() != null) ? user.getDob() : ""%>"><br>
                    </div>


                </div>
            </div>
            <!--City/Province and Price Range-->
            <div class="CityandPrice">
                <div class="form-row">
                    <div class="form-group col-md-5 col-xl-5">
                        <label for="inputPassword4">Price Range *</label>
                        <input type="requiredText" class="form-control" id="inputPassword14" placeholder="<%= (user.getBudget() != 0) ? user.getBudget() : "" %>">

                        <div class="exclamationIcon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-exclamation-triangle" viewBox="0 0 16 16">
                                <path
                                        d="M7.938 2.016A.13.13 0 0 1 8.002 2a.13.13 0 0 1 .063.016.146.146 0 0 1 .054.057l6.857 11.667c.036.06.035.124.002.183a.163.163 0 0 1-.054.06.116.116 0 0 1-.066.017H1.146a.115.115 0 0 1-.066-.017.163.163 0 0 1-.054-.06.176.176 0 0 1 .002-.183L7.884 2.073a.147.147 0 0 1 .054-.057zm1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566z"></path>
                                <path
                                        d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995z"></path>
                            </svg>
                        </div>
                        <div class="exclamationText1">
                            <p>This field is required</p>
                        </div>
                        <div class="exclamationText2">
                            <p>Inline validation is currently only available to partners.</p>
                        </div>
                    </div>

                    <div class="form-group col-md-5 col-xl-5">
                        <label for="inputEmail4">City/ Province *</label>
                        <input type="required" class="form-control" id="mylocation"
                               placeholder="<%= (user.getLocation() != null) ? user.getLocation() : ""%>">

                        <div class="exclamationIcon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-exclamation-triangle" viewBox="0 0 16 16">
                                <path
                                        d="M7.938 2.016A.13.13 0 0 1 8.002 2a.13.13 0 0 1 .063.016.146.146 0 0 1 .054.057l6.857 11.667c.036.06.035.124.002.183a.163.163 0 0 1-.054.06.116.116 0 0 1-.066.017H1.146a.115.115 0 0 1-.066-.017.163.163 0 0 1-.054-.06.176.176 0 0 1 .002-.183L7.884 2.073a.147.147 0 0 1 .054-.057zm1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566z"></path>
                                <path
                                        d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995z"></path>
                            </svg>
                        </div>
                        <div class="exclamationText1">
                            <p>This field is required</p>
                        </div>
                        <div class="exclamationText2">
                            <p>Inline validation is currently only available to partners.</p>
                        </div>
                    </div>

                </div>
            </div>


            <div class="MoreSelection">
                <!-- Personality Type -->
                <div class="form-row">
                    <div class="form-group col-md-5" id="myPronoun" style="width: 100px;">
                        <label for="inputEmail4" >Pronouns </label>
                        <space></space>be
                        <input class="pill" name="pronoun" type="button" value="She/Her">
                        <input class="pill" name="pronoun" type="button" value="He/ Him">
                        <input class="pill" name="pronoun" type="button" value="They/ Them">
                        <input class="pill" name="pronoun" type="button" value="Just my name please"><br>

                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-5" id="myGender">
                        <label for="inputEmail4">Gender </label>
                        <space>&emsp;</space>
                        <button class="pill" type="button" value="female">Female</button>
                        <button class="pill" type="button" value="male">Male</button>
                        <button class="pill" type="button" value="non-bin">Non-binary</button>
                        <button class="pill" type="button" value="not-pre">Not-Preferred</button>

                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-5" id="myPersonality">
                        <label for="inputEmail4">Personality Type </label>
                        <button class="pill" type="button" value="INTJ">INTJ</button>
                        <button class="pill" type="button" value="INTP">INTP</button>
                        <button class="pill" type="button" value="ENTJ">ENTJ</button>
                        <button class="pill" type="button" value="ENTP">ENTP</button>
                        <button class="pill" type="button" value="INFJ">INFJ</button>
                        <button class="pill" type="button" value="INFP">INFP</button>
                        <space>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</space>
                        <button class="pill" type="button" value="ENFJ">ENFJ</button>
                        <button class="pill" type="button" value="ENFP">ENFP</button>
                        <button class="pill" type="button" value="ISTJ">ISTJ</button>
                        <button class="pill" type="button" value="ISFJ">ISFJ</button>
                        <button class="pill" type="button" value="ESTJ">ESTJ</button>
                        <button class="pill" type="button" value="ESFJ">ESFJ</button><br><br>
                        <space>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;</space>
                        <button class="pill" type="button" value="ISTP">ISTP</button>
                        <button class="pill" type="button" value="ISFP">ISFP</button>
                        <button class="pill" type="button" value="ESTP">ESTP</button>
                        <button class="pill" type="button" value="ESFP">ESFP</button>

                    </div>
                </div>


                <!-- Zodiac -->
                <div class="form-row">
                    <div class="form-group col-md-5" id="myZodiac" >
                        <label for="inputEmail4">Zodiac </label>
                        <button class="pill" type="button" value="Capricorn">Capricorn</button>
                        <button class="pill" type="button" value="Aquarius">Aquarius</button>
                        <button class="pill" type="button" value="Pisces">Pisces</button>
                        <button class="pill" type="button" value="Aries">Aries</button>
                        <button class="pill" type="button" value="Taurus">Taurus</button>
                        <button class="pill" type="button" value="Gemini">Gemini</button>
                        <space>&emsp;&emsp;&emsp;&nbsp;</space>
                        <button class="pill" type="button" value="Cancer">Cancer</button>
                        <button class="pill" type="button" value="Leo">Leo</button>
                        <button class="pill" type="button" value="Virgo">Virgo</button>
                        <button class="pill" type="button" value="Libra">Libra</button>
                        <button class="pill" type="button" value="Scorpio">Scorpio</button>
                        <button class="pill" type="button"value="Segittarius">Segittarius</button>
                    </div>
                </div>

                <!-- Smoking -->
                <div class="form-row" id="mySmoking">
                    <div class="form-group col-md-5">
                        <label for="inputEmail4">Smoking </label>
                        <button class="pill" type="button" value="Social Smoker">Social Smoker</button>
                        <button class="pill" type="button" value="Smoker when drinking">Smoker when drinking</button>
                        <button class="pill" type="button" value="Non-Smoker">Non-Smoker</button>
                        <button class="pill" type="button" value="Smoker">Smoker</button>
                    </div>
                </div>

                <!-- Pets -->

                <div class="form-row" id="idPet">
                    <div class="form-group col-md-5">
                        <label for="inputEmail4">Pets</label>
                        <button class="pill" type="button" value="Dog">Dog</button>
                        <button class="pill" type="button" value="Cat">Cat</button>
                        <button class="pill" type="button" value="Reptile">Reptile</button>
                        <button class="pill" type="button" value="Amphibian">Amphibian</button>
                        <button class="pill" type="button" value="Fish">Fish</button>
                        <button class="pill" type="button" value="Pet-free">Pet-free</button>
                        <button class="pill" type="button" value="All the pets">All the pets</button>
                    </div>
                </div>
            </div>


            <div class="About">
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <div class="form-group">
                            <div class="aboutTitle">About me:</div>
                            <label for="comment"></label>
                            <textarea class="form-control" rows="15" id="comment" placeholder="<%= user.getComment()%>"></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <div class="saveChange">
            <div class="form-row">
                <div class="form-group col-md-4">
                    <input id="idSaveProfile" class="saveButton" type="submit" value="Save">
                </div>
            </div>
        </div>



    </section>
    <!-- Selection -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
    <script src="./js/EditProfile.js"></script>
    <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
    ></script>
    <script>
        // document.querySelectorAll(".pill").forEach(pill => {
        //     pill.addEventListener("click", () => pill.classList.toggle("pill-selected"))
        // })
    </script>
    <script>
        $(document).ready(function() {


            const urlParams = new URLSearchParams(window.location.search);
            $( "#idSaveProfile" ).click(function() { // click make event
                var namePronoun = $('#myPronoun .pill--selected').val(); //
                var nameGender = $('#myGender .pill--selected').val();
                var nameCity = $('#mylocation').val();
                var namePersonality = $('#myPersonality .pill--selected').val();
                var nameZodiac = $('#myZodiac .pill--selected').val();
                var nameSmoking = $('#mySmoking .pill--selected').val();
                var namePet = $('#idPet .pill--selected').val();
                var nameAboutme = $('#comment').val();
                var nameDOB = $('#DoB').val();
                var namePrice = $('#inputPassword14').val();
                var firstName = $('#inputEmail24').val();
                var lastName = $('#inputPassword44').val();
                console.log(firstName,"pet");
                var id = urlParams.get('id'); //get through js
                var nameUser = '<%= user.getName()  %>';
                console.log(lastName,'lastname')
                //var namePronoun = $('#myPronoun').val(); //He/him
                $.post('http://localhost:8080/edit-profile', { //doPost => edit-profile
                    pronoun : namePronoun,
                    id: id,
                    gender: nameGender,
                    location: nameCity,
                    personality: namePersonality,
                    zodiac: nameZodiac,
                    smoking: nameSmoking,
                    pet: namePet,
                    comment: nameAboutme,
                    dob: nameDOB,
                    budget: namePrice,
                    firstname: firstName,
                    lastname: lastName,

                }, function(response) {
                    alert(" " + nameUser + " successfully updated  !!!");
                });
            });

            let listPronoun = $('#myPronoun .pill');
            var pronoun = '<%= (user.getPronoun() != null) ? user.getPronoun() : "She/Her" %>';
            for (let i = 0; i < listPronoun.length; i++) {
                if(listPronoun[i].value == pronoun ) {
                    listPronoun[i].classList.add('pill--selected')
                }

                listPronoun[i].addEventListener("click",function () {
                    let currentPronoun = $('#myPronoun .pill--selected');
                    currentPronoun[0].className = currentPronoun[0].className.replace("pill--selected"," ");
                    this.className += " pill--selected";
                });
            }


            let listGender = $('#myGender .pill');
            var gender = '<%= (user.getGender() != null) ? user.getGender() : "female" %>';
            for (let i = 0; i < listGender.length; i++) {
                if(listGender[i].value == gender) {
                    listGender[i].classList.add('pill--selected')
                }
                listGender[i].addEventListener("click",function () {
                    let currentGender = $('#myGender .pill--selected');
                    currentGender[0].className = currentGender[0].className.replace("pill--selected"," ");
                    this.className += " pill--selected";
                });
            }

            let listPersonality = $('#myPersonality .pill');
            var personality = '<%= (user.getPersonality() != null) ? user.getPersonality() : "INTJ" %>';
            for (let n = 0; n < listPersonality.length; n++) {
                if(listPersonality[n].value == personality) {
                    listPersonality[n].classList.add('pill--selected')
                }
                listPersonality[n].addEventListener("click",function () {
                    let currentPersonality = $('#myPersonality .pill--selected');
                    currentPersonality[0].className = currentPersonality[0].className.replace("pill--selected"," ");
                    this.className += " pill--selected";
                });
            }

            let listZodiac = $('#myZodiac .pill');
            var zodiac = '<%= (user.getZodiac() != null) ? user.getZodiac() : "Capricorn" %>';
            for (let i = 0; i < listZodiac.length; i++) {
                if(listZodiac[i].value == zodiac) {
                    listZodiac[i].classList.add('pill--selected')
                }
                listZodiac[i].addEventListener("click",function () {
                    let currentZodiac = $('#myZodiac .pill--selected');
                    currentZodiac[0].className = currentZodiac[0].className.replace("pill--selected"," ");
                    this.className += " pill--selected";
                });
            }

            let listSmoking = $('#mySmoking .pill');
            var smoking = '<%= (user.getSmoking() != null) ? user.getSmoking() : "Smoker"%>';
            for (let i = 0; i < listSmoking.length; i++) {
                if(listSmoking[i].value == smoking) {
                    listSmoking[i].classList.add('pill--selected')
                }
                listSmoking[i].addEventListener("click",function () {
                    let currentSmoking = $('#mySmoking .pill--selected');
                    currentSmoking[0].className = currentSmoking[0].className.replace("pill--selected"," ");
                    this.className += " pill--selected";
                });
            }

            let listPet = $('#idPet .pill');
            var pet = '<%= (user.getPet() != null) ? user.getPet() : "Fish"%>';
            for (let i = 0; i < listPet.length; i++) {
                if(listPet[i].value == pet) {
                    listPet[i].classList.add('pill--selected')
                }
                listPet[i].addEventListener("click",function () {
                    let currentPet = $('#idPet .pill--selected');
                    currentPet[0].className = currentPet[0].className.replace("pill--selected"," ");
                    this.className += " pill--selected";
                });
            }
        });
    </script>
    <!-- <input class="btn btn-primary" type="submit" value="Save"> -->


</body>