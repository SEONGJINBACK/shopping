<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"/>
    <script src="https://kit.fontawesome.com/kit_code.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <title>SeongjinShop</title>
    <style>
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: ivory;
            padding: 8px 12px;
        }

        .subbar {
            background-color: ivory;
            padding: 8px 12px;
            text-align: center;
        }

        body {
            margin: 0;
            background-color: aliceblue;
        }

        .navbar__logo i {
            color: brown;
            padding-left: 0;
        }

        a {
            text-decoration: none;
            color: black;
        }

        .navbar__menu {
            list-style: none;
            display: flex;
            margin: 0;
            padding-left: 0;
        }

        .navbar__menu li {
            padding: 8px 30px;
        }

        .subbar__menu {
            list-style: none;
            margin: 0;
            padding-left: 0;
        }

        .subbar__menu li {
            display: inline;
            padding: 8px 30px;
        }


        .navbar__icons {
            list-style: none;
            display: flex;
            color: blue;
            margin: 0;
            padding-left: 0;
        }

        .navbar__icons li {
            padding: 8px 12px;
            margin: 0;
        }

        .search {
            position: relative;
            width: 350px;
        }

        input {
            width: 100%;
            border: 1px solid #bbb;
            border-radius: 8px;
            padding: 10px 12px;
            font-size: 14px;
        }

        img {
            position: absolute;
            width: 17px;
            top: 10px;
            right: 0.01px;

        }
        .join_table{
            width: 400px;
        }
        .join_table td{
            text-align: center;

        }
        .join_table .input_first{
            text-align: center;
            width: 200px;
        }
        .join_table td input{
            width: 300px;
        }

    </style>

</head>

<body>

<nav class="navbar">
    <div class="navbar__logo">
        <i class="material-symbols-outlined" style="float: left; ">
            home</i>
        <a href="${pageContext.request.contextPath}/main" style="margin-left: 10px; ">White Shop</a>
    </div>
    <div class="search">
        <input type="text" placeholder="검색어 입력">
        <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
    </div>
    <div>
        <a href="${pageContext.request.contextPath}/users/join" class="navbar__toggleBtn" style="margin-right: 5px;">JOIN</a>
        <a href="#" class="navbar__toggleBtn" style="margin-right: 5px;">LOGIN</a>
        <a href="#" class="navbar__toggleBtn"><i class="material-symbols-outlined">
            cleaning_bucket</i></a>
    </div>
</nav>

<nav class="subbar">
    <ul class="subbar__menu">
        <li><a href="#">Home</a></li>
        <li><a href="#">Gallery</a></li>
        <li><a href="#">Weddings</a></li>
        <li><a href="#">FAQ</a></li>
        <li><a href="#">Bookings</a></li>
    </ul>
</nav>
<h2 style="text-align: center; margin-top: 160px;">로그인</h2>
<div style="display: flex; justify-content: center;">
    <div class="account_table"
         style="width: 420px;">
            <table class="join_table">
                <tr>
                    <td class="input_first">아이디</td>
                    <td><input type="text" placeholder="아이디" id="id" /></td>
                </tr>
                <tr>
                    <td class="input_first">비밀번호</td>
                    <td><input type="password" placeholder="비밀번호" id="pw"/></td>
                </tr>
            </table>
    </div>
</div>
<div style="text-align: center; margin-top: 10px;">
    <button id="userLoginButton" style="border-radius: 20px; width: 150px; height: 40px; background-color: ivory; border-style: none;">로그인</button>
    <button onclick="history.back()" style="border-radius: 20px; width: 150px; height: 40px; background-color: ivory; border-style: none;">취소</button>
</div>

<script type= text/javascript>

    let userId = document.querySelector("#id");
    let userPw = document.querySelector("#pw");
    const userLoginBtn = document.querySelector("#userLoginButton");
    userLoginBtn.addEventListener("click",()=>{
        if(userId.value=="" || userPw.value==""){
            Swal.fire({
                icon : 'error',
                title : 'Error',
                text : '아이디와 패스워드를 입력해주세요.',
            })
        }else{
            LoginAction();
        }

    })

    function TimeOut(){
        setTimeout(function (){
            location.href = "${pageContext.request.contextPath}/main";
        } , 1000);

    }

    function LoginAction(){
        $.ajax({
            url : "${pageContext.request.contextPath}/users/loginAction", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            type : "GET",
            dataType : "json",
            data : {
                id : userId.value,
                pw : userPw.value
            }, // HTTP 요청과 함께 서버로 보낼 데이터
            success : function(data) {
                console.log(data);
             if(data.loginUser.length==0){
                 Swal.fire({
                     icon : 'error',
                     title : 'Error',
                     text : '존재하지않는 정보입니다.',
                 })
                return;
             }else{
                 if(userId.value == data.loginUser[0].userId){
                     console.log("아이디 일치함");
                     if(userPw.value == data.loginUser[0].password){
                         console.log("패스워드 일치함");
                         Swal.fire({
                             icon : "success",
                             title : "Good",
                             text : "어서오세요 " + data.loginUser[0].names + "님 환영합니다.",
                         });
                         TimeOut();
                     }else{
                         console.log("패스워드 불일치함");
                         return;
                     }
                 }else{
                     console.log("아이디 불일치함");
                     return;
                 }
             }
            }
        })
    }

</script>

</body>
</html>