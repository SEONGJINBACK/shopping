<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String userName = (String)session.getAttribute("name");
    Object iphoneList = session.getAttribute("iphoneList");
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
        <i class="material-symbols-outlined" style="float: left; ">
            home</i>
        <a href="${pageContext.request.contextPath}/main" style="margin-left: 10px; ">White Shop</a>
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
                            <h4 class="smartphonePrice"><%=productPrice%>원</h4>
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
            <td>기종</td>
            <td id="productName"></td>
        </tr>
        <tr>
            <td>제품번호</td>
            <td id="productRotNumber"></td>
        </tr>
        <tr>
            <td>용량</td>
            <td id="productSize"></td>
        </tr>
        <tr>
            <td>색상</td>
            <td id="productColor"></td>
        </tr>
        <tr>
            <td>가격</td>
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
        <button id="basketBtn" style="width: 140px; margin-left: 30px; height: 60px; background-color: lightskyblue; font-weight: bold; cursor: pointer;" >장바구니에 담기</button>
        <button id="quickSellBtn" style="width: 140px; height: 60px; background-color: mediumslateblue; font-weight: bold; cursor: pointer;">바로 구매하기</button>
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
                text : "10개 초과 주문 불가능.",
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
                text : "0개 이하로 주문 불가능.",
            })
            return;
        }
        stockCount.value = Number(stockCount.value)-1;
        TotalProductPrice.value = Number(AmountProductPrice.value) * Number(stockCount.value);
        console.log(TotalProductPrice.value);
    })


    document.addEventListener("DOMContentLoaded", () => {
        $.ajax({
            url: "${pageContext.request.contextPath}/smartphone/detailInfo?productName="
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
                title: "로그인 후 이용가능합니다, 로그인 페이지로 이동하시겠습니까?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                cancelButtonText: '취소',
                confirmButtonText: '확인',
            }).then((result) => {
                if(result.isConfirmed){
                    Swal.fire({
                        icon : "success",
                        title : "Good",
                        text : "로그인 페이지로 이동됩니다."
                    });
                    TimeOut();
                }
            })
        }else{
            Swal.fire({
                title: "장바구니에 담으시겠습니까?",
                icon: 'info',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                cancelButtonText: '취소',
                confirmButtonText: '확인',
            }).then((result) => {
                if(result.isConfirmed){
                    BasketInsert();
                    Swal.fire({
                        title: "주문을 계속하실려면 확인, 장바구니로 이동하실려면 이동버튼을 눌러주세요",
                        icon: 'info',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        cancelButtonText: '확인',
                        confirmButtonText: '이동',
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
            url : "${pageContext.request.contextPath}/users/basket", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            type : "POST",
            dataType : "json",
            data : {
                id : "${sessionScope.id}",
                productName : $("#productName").html(),
                productSize : $("#productSize").html(),
                productAmount : $("#stockCount").val(),
                productTotalPrice : $("#TotalProductPrice").val(),
            }, // HTTP 요청과 함께 서버로 보낼 데이터
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