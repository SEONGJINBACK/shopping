<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String userName = (String)session.getAttribute("name");
    Object iphoneList = session.getAttribute("iphoneList");
    Object galaxyList = session.getAttribute("galaxyList");
    if (userName == null) {
        userName = "GUEST";
    }

    Object productName = request.getParameter("productName");
    Object productImage = request.getParameter("productImage");
    Object productPrice = request.getParameter("productPrice");

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
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
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

        .imageBox {
            margin-left: 30px;
            margin-right: 30px;
        }

        .image {
            width: 800px;
            height: 600px;
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
            border: 1px solid black;
            display: inline-flex;
            cursor: pointer;
        }

        .smartphoneImage {
            height: 42px;
            font-size: 30px;
            border: 1px solid black;
            width: 800px;
        }

        .smartphoneName {
            display: inline;
            text-align: center;
        }

        .smartphonePrice {
            display: inline;
            text-align: center;
        }

        .productDetail{
            width: 800px;
            height: 694px;
            margin-left: 30px;
            margin-right: 30px;
        }
        .productDetail tr td {
            border: 1px solid black;
            background-color: white;
            font-weight: bold;
        }

    </style>
</head>

<body id="DomContent">

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

<div class="imageBox" style="display:flex; justify-content: center;">
    <div>
        <table>
            <tr>
                <td>
                    <div class="imageBox" style="text-align: center;">
                        <div class="image"
                             style="background-image: url('<%=productImage%>')"
                        >
                        </div>
                        <div class="smartphoneImage">
                            <h4 class="smartphoneName"><%=productName%></h4>
                        </div>
                        <div class="smartphoneImage">
                            <h4 class="smartphonePrice"><%=productPrice%>???</h4>
                        </div>
                    </div>
                </td>
                <td>
                </td>
            </tr>
        </table>
    </div>
<div class="productDetail">
    <table style="width: 100%; height: 90%; text-align: center;">
        <tr>
            <td>??????</td>
            <td id="productName"></td>
        </tr>
        <tr>
            <td>????????????</td>
            <td id="productRotNumber"></td>
        </tr>
        <tr>
            <td>??????</td>
            <td id="productSize"></td>
        </tr>
        <tr>
            <td>??????</td>
            <td id="productColor"></td>
        </tr>
        <tr>
            <td>??????</td>
            <td id="productPrice"></td>
        </tr>
    </table>
    <div class="amountCtn" style="
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 8px 12px;
            margin-top: 10px;
" >
        <div style="width: 50px;">
            <input id="stockCount" readonly type="text" value="1" style="width: 20px; font-weight: bold;">
        </div>
        <button id="plusBtn" style="margin-left: 10px; width: 40px; height: 37px; border-radius: 20px; border: none; font-size: 24px; cursor: pointer;">+</button>
        <button id="minusBtn" style="margin-left: 10px; width: 40px; height: 37px; border-radius: 20px; border: none; font-size: 28px; cursor: pointer;">-</button>
        <input type="text" id="TotalProductPrice" style="margin-left: 20px; text-align: right; width: 100px;" value="<%=productPrice%>">
        <input type="text" id="AmountProductPrice" value="<%=productPrice%>" hidden>
        <button id="basketBtn" style="width: 140px; margin-left: 30px; height: 60px; background-color: lightskyblue; font-weight: bold; cursor: pointer;" >??????????????? ??????</button>
        <button id="quickSellBtn" style="width: 140px; height: 60px; background-color: mediumslateblue; font-weight: bold; cursor: pointer;">?????? ????????????</button>
    </div>


</div>

</div>


<script>

    const plusBtn = document.querySelector("#plusBtn");
    const minusBtn = document.querySelector("#minusBtn");
    const basketBtn = document.querySelector("#basketBtn");
    const quickSellBtn = document.querySelector("#quickSellBtn");
    let stockCount = document.querySelector("#stockCount");
    const AmountProductPrice = document.querySelector("#AmountProductPrice");
    let TotalProductPrice = document.querySelector("#TotalProductPrice");

    let userName = "<%=userName%>";


    plusBtn.addEventListener("click",()=>{
        if(stockCount.value >= 10){
            Swal.fire({
                icon : "error",
                title : "Error",
                text : "10??? ?????? ?????? ?????????.",
            })
            return;
        }

        stockCount.value = Number(stockCount.value)+1;
        TotalProductPrice.value = Number(AmountProductPrice.value) * Number(stockCount.value);
        console.log(TotalProductPrice.value);
    })

    minusBtn.addEventListener("click",()=>{

        if(stockCount.value <= 1){
            Swal.fire({
                icon : "error",
                title : "Error",
                text : "0??? ????????? ?????? ?????????.",
            })
            return;
        }
        stockCount.value = Number(stockCount.value)-1;
        TotalProductPrice.value = Number(AmountProductPrice.value) * Number(stockCount.value);
        console.log(TotalProductPrice.value);
    })


    document.addEventListener("DOMContentLoaded", () => {
        $.ajax({
            url: "${pageContext.request.contextPath}/smartphone/iphoneDetailInfo?productName="
                + "<%=productName%>",
            type: "GET",
            dataType: "json",
            success: function (data) {
                $("#productName").html(data.smartPhoneDetail.productName);
                $("#productRotNumber").html(data.smartPhoneDetail.rotNum);
                $("#productSize").html(data.smartPhoneDetail.productSize);
                $("#productColor").html(data.smartPhoneDetail.productColor);
                $("#productPrice").html(data.smartPhoneDetail.productPrice);
            },
        })
    })

    basketBtn.addEventListener("click" , ()=>{
        if(userName == "GUEST"){
            Swal.fire({
                title: "????????? ??? ?????????????????????, ????????? ???????????? ?????????????????????????",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                cancelButtonText: '??????',
                confirmButtonText: '??????',
            }).then((result) => {
                if(result.isConfirmed){
                    Swal.fire({
                        icon : "success",
                        title : "Good",
                        text : "????????? ???????????? ???????????????."
                    });
                    TimeOut();
                }
            })
        }else{
            Swal.fire({
                title: "??????????????? ??????????????????????",
                icon: 'info',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                cancelButtonText: '??????',
                confirmButtonText: '??????',
            }).then((result) => {
                if(result.isConfirmed){
                    BasketInsert();
                    Swal.fire({
                        title: "????????? ?????????????????? ??????, ??????????????? ?????????????????? ??????????????? ???????????????",
                        icon: 'info',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        cancelButtonText: '??????',
                        confirmButtonText: '??????',
                    }).then((result) => {
                        if(result.isConfirmed){
                            location.href = "${pageContext.request.contextPath}/users/mypage";
                        }
                    })
                }
            })
        }
    })


    function BasketInsert(){
        $.ajax({
            url : "${pageContext.request.contextPath}/users/basket", // ?????????????????? HTTP ????????? ?????? ????????? URL ??????
            type : "POST",
            dataType : "json",
            data : {
                id : "${sessionScope.id}",
                productName : $("#productName").html(),
                productSize : $("#productSize").html(),
                productAmount : $("#stockCount").val(),
                productTotalPrice : $("#TotalProductPrice").val(),
            }, // HTTP ????????? ?????? ????????? ?????? ?????????
            success : function(data) {

            }
        })
    }

    function TimeOut(){
        setTimeout(function (){
            location.href = "${pageContext.request.contextPath}/users/login?redirect="
                +"${pageContext.request.contextPath}/smartphone/iphone";
        } , 1000);

    }


</script>
</body>
</html>