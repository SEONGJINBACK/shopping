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
            width: 800px;
            height: 500px;
        }
        .join_table td{
            text-align: center;

        }
        .join_table .input_first{
            text-align: center;
            width: 200px;
        }
        .join_table td input{
            width: 400px;
        }

    </style>
</head>

<body>
<nav class="navbar">
    <div class="navbar__logo">
        <i class="material-symbols-outlined" style="float: left; ">
            home</i>
        <a href="#" style="margin-left: 10px; ">White Shop</a>
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
<h2 style="text-align: center; margin-top: 20px;">회원가입</h2>
<div style="display: flex; justify-content: center;">
    <div class="account_table"
         style="border-radius: 20px; width: 840px; height: 500px; display: flex; margin-top: 5px;">
            <table class="join_table">
                <tr>
                    <td class="input_first">아이디</td>
                    <td><input type="text" placeholder="아이디"/></td>
                    <td><button style="border-radius: 20px; width: 150px; height: 40px; background-color: ivory; border-style: none;" >중복확인</button></td>
                </tr>
                <tr>
                    <td class="input_first">비밀번호</td>
                    <td><input type="text"placeholder="비밀번호" /></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="input_first">비밀번호확인</td>
                    <td><input type="text"placeholder="비밀번호확인" /></td>
                    <td><div>일치</div></td>
                </tr>
                <tr>
                    <td class="input_first">이름</td>
                    <td><input type="text"placeholder="이름" /></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="input_first">주소</td>
                    <td><input type="text"placeholder="주소" /></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="input_first">전화번호</td>
                    <td><input type="text"placeholder="전화번호" /></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="input_first">이메일</td>
                    <td><input type="text"placeholder="이메일" /></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="input_first">생일</td>
                    <td><input type="text"placeholder="생일" /></td>
                    <td></td>
                </tr>
            </table>
    </div>
</div>
<div style="text-align: center; margin-top: 10px;">
    <button style="border-radius: 20px; width: 150px; height: 40px; background-color: ivory; border-style: none;">가입</button>
    <button style="border-radius: 20px; width: 150px; height: 40px; background-color: ivory; border-style: none;">취소</button>
</div>

</body>
</html>