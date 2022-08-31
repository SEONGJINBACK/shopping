<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    Object userName = session.getAttribute("name");
    Object iphoneList = session.getAttribute("iphoneList");
    if (userName == null) {
        userName = "GUEST";
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

        .imageBox{
            margin-left: 30px;
            margin-right: 30px;
        }

        .image {
            width: 300px;
            height: 400px;
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
            border: 1px solid black;
            display: inline-flex;
            cursor : pointer;
        }

        .smartphoneImage{
            height:42px;
            font-size: 30px;
            border: 1px solid black;
            width: 300px;
        }

        .smartphoneName{
            display: inline;
            text-align: center;
        }

        .smartphonePrice{
            display: inline;
            text-align: center;
        }

    </style>
</head>

<body id="DomContent">

<nav class="navbar">
    <div class="navbar__logo">
        <i class="material-symbols-outlined" style="float: left; ">
            home</i>
        <a href="${pageContext.request.contextPath}/" style="margin-left: 10px; ">White Shop</a>
    </div>

    <div class="search">
        <input type="text" placeholder="검색어 입력">
        <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
    </div>

    <div>
        <%
            if (userName != "GUEST") {
        %>
        <a href="${pageContext.request.contextPath}/users/mypage" class="navbar__toggleBtn" style="margin-right: 5px;">MYPAGE</a>
        <a href="${pageContext.request.contextPath}/users/session/logout" class="navbar__toggleBtn"
           style="margin-right: 40px;">LOGOUT</a>
        <%
        } else {
        %>
        <a href="${pageContext.request.contextPath}/users/join" class="navbar__toggleBtn" style="margin-right: 5px;">JOIN</a>
        <a href="${pageContext.request.contextPath}/users/login" class="navbar__toggleBtn" style="margin-right: 55px;">LOGIN</a>
        <%
            }
        %>

    </div>

</nav>


<nav class="subbar">
    <ul class="subbar__menu">
        <li style="margin-left: 150px;"><a href="${pageContext.request.contextPath}/smartphone/iphone">IPhone</a></li>
        <li><a href="#">Gallery</a></li>
        <li><a href="#">Weddings</a></li>
        <li><a href="#">FAQ</a></li>
        <li><a href="#">Bookings</a></li>
        <li style="float: right;"><a href="#"><%=userName%>님 환영합니다.</a></li>
    </ul>
    <div style="display: inline-flex;"></div>
</nav>

<div class="imageBox" style="display:flex; justify-content: center;">
    <table>
        <tr>
            <td>
                <div class="imageBox" style="text-align: center;">
                    <div class="image"
                         style="background-image: url('${pageContext.request.contextPath}${sessionScope.iphoneList[0].productImage}')"
                         onclick="IphoneDetailInfo('${sessionScope.iphoneList[0].productName}','${pageContext.request.contextPath}${sessionScope.iphoneList[0].productImage}','${sessionScope.iphoneList[0].productPrice}')"
                    >
                    </div>
                    <div class="smartphoneImage">
                        <h4 class="smartphoneName">IPhone 4S</h4>
                    </div>
                    <div class="smartphoneImage">
                        <h4 class="smartphonePrice">${sessionScope.iphoneList[0].productPrice}원</h4>
                    </div>
                </div>
            </td>
            <td>
                <div class="imageBox" style="text-align: center;">
                    <div class="image"
                         style="background-image: url('${pageContext.request.contextPath}${sessionScope.iphoneList[1].productImage}')"
                         onclick="IphoneDetailInfo('${sessionScope.iphoneList[1].productName}','${pageContext.request.contextPath}${sessionScope.iphoneList[1].productImage}','${sessionScope.iphoneList[1].productPrice}')"
                    >
                    </div>
                    <div class="smartphoneImage">
                        <h4 class="smartphoneName">IPhone 5</h4>
                    </div>
                    <div class="smartphoneImage">
                        <h4 class="smartphonePrice">${sessionScope.iphoneList[1].productPrice}원</h4>
                    </div>
                </div>
            </td>
            <td>
                <div class="imageBox" style="text-align: center;">
                    <div class="image"
                         style="background-image: url('${pageContext.request.contextPath}${sessionScope.iphoneList[2].productImage}')"
                         onclick="IphoneDetailInfo('${sessionScope.iphoneList[2].productName}','${pageContext.request.contextPath}${sessionScope.iphoneList[2].productImage}','${sessionScope.iphoneList[2].productPrice}')"
                    >

                    </div>
                    <div class="smartphoneImage">
                        <h4 class="smartphoneName">IPhone 6S</h4>
                    </div>
                    <div class="smartphoneImage">
                        <h4 class="smartphonePrice">${sessionScope.iphoneList[2].productPrice}원</h4>
                    </div>
                </div>
            </td>
            <td>
                <div class="imageBox" style="text-align: center;">
                    <div class="image"
                         style="background-image: url('${pageContext.request.contextPath}${sessionScope.iphoneList[3].productImage}')"
                         onclick="IphoneDetailInfo('${sessionScope.iphoneList[3].productName}','${pageContext.request.contextPath}${sessionScope.iphoneList[3].productImage}','${sessionScope.iphoneList[3].productPrice}')"
                    >
                    </div>
                    <div class="smartphoneImage">
                        <h4 class="smartphoneName">IPhone 7</h4>
                    </div>
                    <div class="smartphoneImage">
                        <h4 class="smartphonePrice">${sessionScope.iphoneList[3].productPrice}원</h4>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="imageBox" style="text-align: center;">
                    <div class="image"
                         style="background-image: url('${pageContext.request.contextPath}${sessionScope.iphoneList[4].productImage}')"
                         onclick="IphoneDetailInfo('${sessionScope.iphoneList[4].productName}','${pageContext.request.contextPath}${sessionScope.iphoneList[4].productImage}','${sessionScope.iphoneList[4].productPrice}')"
                    >

                    </div>
                    <div class="smartphoneImage">
                        <h4 class="smartphoneName">IPhone 8</h4>
                    </div>
                    <div class="smartphoneImage">
                        <h4 class="smartphonePrice">${sessionScope.iphoneList[4].productPrice}원</h4>
                    </div>
                </div>
            </td>
            <td>
                <div class="imageBox" style="text-align: center;">
                    <div class="image"
                         style="background-image: url('${pageContext.request.contextPath}${sessionScope.iphoneList[5].productImage}')"
                         onclick="IphoneDetailInfo('${sessionScope.iphoneList[5].productName}','${pageContext.request.contextPath}${sessionScope.iphoneList[5].productImage}','${sessionScope.iphoneList[5].productPrice}')"
                    >

                    </div>
                    <div class="smartphoneImage">
                        <h4 class="smartphoneName">IPhone SE2</h4>
                    </div>
                    <div class="smartphoneImage">
                        <h4 class="smartphonePrice">${sessionScope.iphoneList[5].productPrice}원</h4>
                    </div>
                </div>
            </td>
            <td>
                <div class="imageBox" style="text-align: center;">
                    <div class="image"
                         style="background-image: url('${pageContext.request.contextPath}${sessionScope.iphoneList[6].productImage}')"
                         onclick="IphoneDetailInfo('${sessionScope.iphoneList[6].productName}','${pageContext.request.contextPath}${sessionScope.iphoneList[6].productImage}','${sessionScope.iphoneList[6].productPrice}')"
                    >
                    </div>
                    <div class="smartphoneImage">
                        <h4 class="smartphoneName">IPhone 11 PRO</h4>
                    </div>
                    <div class="smartphoneImage">
                        <h4 class="smartphonePrice">${sessionScope.iphoneList[6].productPrice}원</h4>
                    </div>
                </div>
            </td>
            <td>
                <div class="imageBox" style="text-align: center;">
                    <div class="image"
                         style="background-image: url('${pageContext.request.contextPath}${sessionScope.iphoneList[7].productImage}')"
                         onclick="IphoneDetailInfo('${sessionScope.iphoneList[7].productName}','${pageContext.request.contextPath}${sessionScope.iphoneList[7].productImage}','${sessionScope.iphoneList[7].productPrice}')"
                    >

                    </div>
                    <div class="smartphoneImage">
                        <h4 class="smartphoneName">IPhone 12</h4>
                    </div>
                    <div class="smartphoneImage">
                        <h4 class="smartphonePrice">${sessionScope.iphoneList[7].productPrice}원</h4>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="imageBox" style="text-align: center;">
                    <div class="image"
                         style="background-image: url('${pageContext.request.contextPath}${sessionScope.iphoneList[8].productImage}')"
                         onclick="IphoneDetailInfo('${sessionScope.iphoneList[8].productName}','${pageContext.request.contextPath}${sessionScope.iphoneList[8].productImage}','${sessionScope.iphoneList[8].productPrice}')"
                    >

                    </div>
                    <div class="smartphoneImage">
                        <h4 class="smartphoneName">IPhone 13 PRO</h4>
                    </div>
                    <div class="smartphoneImage">
                        <h4 class="smartphonePrice">${sessionScope.iphoneList[8].productPrice}원</h4>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</div>
<script>
    const DomContent = document.querySelector("#DomContent");

    function IphoneDetailInfo(productName , productImage , productPrice){

        location.href = "${pageContext.request.contextPath}/smartphone/smartphoneDetail?productName="
        + productName +"&productImage=" + productImage +"&productPrice=" + productPrice;
    }

</script>
</body>
</html>