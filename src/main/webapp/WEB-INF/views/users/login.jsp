<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    Object userName = session.getAttribute("name");
    if (userName == null) {
        userName = "GUEST";
    }
%>
<% String redirect = request.getParameter("redirect");
if(redirect==null){
    redirect = "/main";
}
%>
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
            background-color: black;
            padding: 8px 12px;
            color: white;
        }

        .subbar {
            background-color: black;
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
            color: white;
            font-size: 18px;
            font-weight: bold;
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
        <a href="${pageContext.request.contextPath}/" style="margin-left: 10px; color: white; font-weight: bold; font-size: 24px;">White Shop</a>
    </div>

    <div class="search">
        <input type="text" placeholder="????????? ??????">
        <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
    </div>

    <div>
        <%
            if (userName != "GUEST") {
        %>
        <a href="${pageContext.request.contextPath}/users/mypage?userId=${sessionScope.id}" class="navbar__toggleBtn" style="margin-right: 5px; color: white; font-weight: bold; font-size: 24px;">MYPAGE</a>
        <a href="${pageContext.request.contextPath}/users/session/logout" class="navbar__toggleBtn"
           style="margin-right: 40px; color: white; font-weight: bold; font-size: 24px;">LOGOUT</a>
        <%
        } else {
        %>
        <a href="${pageContext.request.contextPath}/users/join" class="navbar__toggleBtn" style="margin-right: 5px; color: white; font-weight: bold; font-size: 24px;">JOIN</a>
        <a href="${pageContext.request.contextPath}/users/login" class="navbar__toggleBtn" style="margin-right: 55px; color: white; font-weight: bold; font-size: 24px;">LOGIN</a>

        <%
            }
        %>

    </div>

</nav>


<nav class="subbar">
    <ul class="subbar__menu">
        <li style="margin-left: 150px; margin-top: 10px;"><a href="${pageContext.request.contextPath}/smartphone/iphone">IPhone</a></li>
        <li><a href="#">Galaxy</a></li>
        <li><a href="#">GalaxyTAP</a></li>
        <li><a href="#">IPAD</a></li>
        <li><a href="#">LG</a></li>
        <li style="float: right;"><a href="#"><%=userName%>??? ???????????????.</a></li>
    </ul>
    <div style="display: inline-flex;"></div>
</nav>
<h2 style="text-align: center; margin-top: 160px;">?????????</h2>
<div style="display: flex; justify-content: center;">
    <div class="account_table"
         style="width: 420px;">
            <table class="join_table">
                <tr>
                    <td class="input_first">?????????</td>
                    <td><input type="text" placeholder="?????????" id="id" /></td>
                </tr>
                <tr>
                    <td class="input_first">????????????</td>
                    <td><input type="password" placeholder="????????????" id="pw"/></td>
                </tr>
            </table>
    </div>
</div>
<div style="text-align: center; margin-top: 10px;">
    <button id="userLoginButton" style="border-radius: 20px; width: 150px; height: 40px; background-color: ivory; border-style: none;">?????????</button>
    <button onclick="history.back()" style="border-radius: 20px; width: 150px; height: 40px; background-color: ivory; border-style: none;">??????</button>
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
                text : '???????????? ??????????????? ??????????????????.',
            })
        }else{
            LoginAction();
        }

    })

    function TimeOut(){
        if("<%=redirect%>".length > 0 ){
            setTimeout(function (){
                location.href = "<%=redirect%>";
            } , 1000);
        }
    }

    function managerOut(){
        if("<%=redirect%>".length > 0 ){
            setTimeout(function (){
                location.href = "${pageContext.request.contextPath}/manager";
            } , 1000);
        }
    }

    function LoginAction(){
        $.ajax({
            url : "${pageContext.request.contextPath}/users/loginAction", // ?????????????????? HTTP ????????? ?????? ????????? URL ??????
            type : "GET",
            dataType : "json",
            data : {
                id : userId.value,
                pw : userPw.value
            }, // HTTP ????????? ?????? ????????? ?????? ?????????
            success : function(data) {
                console.log(data);
             if(data.loginUser.length==0){
                 Swal.fire({
                     icon : 'error',
                     title : 'Error',
                     text : '?????????????????? ???????????????.',
                 })
                return;
             }else{
                 if(userId.value == data.loginUser[0].userId){
                     console.log("????????? ?????????");
                     if(userPw.value == data.loginUser[0].password){
                         console.log("???????????? ?????????");
                         if(userId.value == "admin"){
                             console.log("????????? ??????");
                             Swal.fire({
                                 icon : "success",
                                 title : "Good",
                                 text : "??????????????? " + data.loginUser[0].names + "??? ???????????????.",
                             });
                             managerOut();
                         }else{
                             Swal.fire({
                                 icon : "success",
                                 title : "Good",
                                 text : "??????????????? " + data.loginUser[0].names + "??? ???????????????.",
                             });
                             TimeOut();
                         }
                     }else{
                         console.log("???????????? ????????????");
                         return;
                     }
                 }else{
                     console.log("????????? ????????????");
                     return;
                 }
             }
            }
        })
    }

</script>

</body>
</html>