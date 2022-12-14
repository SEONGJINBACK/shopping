<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    Object userName = session.getAttribute("name");
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
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

        .mypageContentBox {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
        }

        .mypageContent {
            border: 1px solid black;
            border-radius: 20px;
            height: 600px;
            width: 100%;
        }

        .sideMenu {
            height: 600px;
            width: 300px;
        }

        .sideMenuTable tr td {
            text-align: center;
        }

        #UserShoppingBasket, #OrderInformation, #Privacy, #ShippingInformation {
            height: 100%;
            width: 100%;
            border-radius: 20px;
            border: none;
            background-color: lightskyblue;
            font-family: "D2Coding";
            font-size: 24px;
        }

        .basketListTable td{
            border: 1px solid black;
        }

        .thead {
            background-color: black;
            color: white;
            font-weight: bold;
            text-align: center;
        }

        .tbodyContent{
            background-color: white;
            height: 50px;
            text-align: center;
        }

        .user_table{
            width: 500px;
            text-align: center;
        }
        .user_table input{
            width: 100%;
            text-align: center;
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

<div class="mypageContentBox">
    <div class="sideMenu">
        <table class="sideMenuTable" style="height: 100%; width: 100%;">
            <tr>
                <td>
                    <button id="UserShoppingBasket">????????????</button>
                </td>
            </tr>
            <tr>
                <td>
                    <button id="OrderInformation">????????????</button>
                </td>
            </tr>
            <tr>
                <td>
                    <button id="ShippingInformation">????????????</button>
                </td>
            </tr>
            <tr>
                <td>
                    <button id="Privacy">????????????</button>
                </td>
            </tr>
        </table>
    </div>
    <div class="mypageContent">
        <div id="ShoppingBasket">
                <h1 style="text-align: center;">????????????</h1>
            <div>
                <table class="basketList" style="width: 100%;">
                    <tr>
                        <td class="thead">????????? ID</td>
                        <td class="thead">?????????</td>
                        <td class="thead">?????? ??????</td>
                        <td class="thead">??????</td>
                        <td class="thead">??????</td>
                        <td class="thead">??????</td>
                    </tr>
                    <tbody class="basketListTable">

                    </tbody>

                </table>
            </div>
            <div style="display: inline-flex; float:right; margin-top: 20px; margin-right: 70px;">
                <input type="text" readonly style="width: 80px; border: none; background-color: black; color: white; font-weight: bold; font-size: 24px;" value="??? ??????">
                <input type="text" id="OrderTotalPrice" readonly style="font-size: 24px; width: 160px; border: none; text-align: right;" />
                <button id="paymentBtn" style="background-size: contain; background-color: aliceblue; background-repeat: no-repeat; background-position: center; margin-left: 30px; cursor: pointer; width: 140px; border: none; background-image: url('${pageContext.request.contextPath}/../../../resources/img/kakaopay.png')"></button>
            </div>
        </div>

        <div id="OrderInfo" hidden>
            <h1 style="text-align: center;">????????????</h1>
            <div>
                <table class="OrderList" style="width: 100%;">
                    <tr>
                        <td class="thead">?????? ID</td>
                        <td class="thead">????????? ID</td>
                        <td class="thead">????????????</td>
                        <td class="thead">TOTAL</td>
                        <td class="thead">????????????</td>
                        <td class="thead">????????????</td>
                    </tr>
                    <tbody class="OrderListTable">

                    </tbody>

                </table>
            </div>
        </div>
        <div id="DeliveryInfo" hidden>
            <h1 style="text-align: center;">????????????</h1>
            <div>
                <table class="DeliveryInfoList" style="width: 100%;">
                    <tr>
                        <td class="thead">????????????</td>
                        <td class="thead">????????????</td>
                        <td class="thead">????????? ID</td>
                        <td class="thead">????????????</td>
                        <td class="thead">TOTAL</td>
                        <td class="thead">????????????</td>
                        <td class="thead">?????????</td>
                        <td class="thead">????????????</td>
                        <td class="thead">????????????</td>
                    </tr>
                    <tbody class="UserDeliveryListTable">

                    </tbody>

                </table>
            </div>
        </div>
        <div id="PrivacyInfo" hidden>
            <h1 style="text-align: center;">????????????</h1>
            <div style="display: flex; justify-content: center; margin-top: 20px;">
                <div>
                    <h2 style="text-align: center; margin-left: 70px;">????????????</h2>
                    <table class="user_table" style="margin-top: 50px;">
                        <tr>
                            <td class="input_first">?????????</td>
                            <td><input type="text" readonly id="before_id"/></td>
                        </tr>
                        <tr>
                            <td class="input_first">????????????</td>
                            <td><input type="text" readonly id="before_pw"/></td>
                        </tr>
                        <tr>
                            <td class="input_first">??????</td>
                            <td><input id="before_name" type="text" readonly/></td>
                        </tr>
                        <tr>
                            <td class="input_first">??????</td>
                            <td><input id="before_address" type="text" readonly/></td>
                        </tr>
                        <tr>
                            <td class="input_first">????????????</td>
                            <td><input id="before_tel" type="text" readonly/></td>
                        </tr>
                        <tr>
                            <td class="input_first">?????????</td>
                            <td><input id="before_email" type="text" readonly/></td>
                        </tr>
                        <tr>
                            <td class="input_first">??????</td>
                            <td><input id="before_birth" type="text" readonly/></td>
                        </tr>
                    </table>
                </div>
                <div style="border-left: 1px solid black; margin-left: 100px;"></div>
                <div style="margin-left: 100px;">
                    <h2 style="text-align: center; margin-left: 70px;">????????? ??????</h2>
                    <table class="user_table" style="margin-top: 50px;">
                        <tr>
                            <td class="input_first">?????????</td>
                            <td><input type="text" readonly id="after_id"/></td>
                        </tr>
                        <tr>
                            <td class="input_first">????????????</td>
                            <td><input type="text" id="after_pw"/></td>
                        </tr>
                        <tr>
                            <td class="input_first">??????</td>
                            <td><input id="after_name" readonly type="text"/></td>
                        </tr>
                        <tr>
                            <td class="input_first">??????</td>
                            <td><input id="after_address" type="text"/></td>
                        </tr>
                        <tr>
                            <td class="input_first">????????????</td>
                            <td><input id="after_tel" type="text"/></td>
                        </tr>
                        <tr>
                            <td class="input_first">?????????</td>
                            <td><input id="after_email" type="text"/></td>
                        </tr>
                        <tr>
                            <td class="input_first">??????</td>
                            <td><input id="after_birth" readonly type="text"/></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div style="display: flex; justify-content: center; margin-top: 30px;">
                <button id="UserUpdateData" style="border: none; border-radius: 20px; background-color: ivory; width: 250px; height: 50px; font-weight: bold;">???????????? ????????????</button>
                <button id="UserDeleteData" style="border: none; border-radius: 20px; margin-left: 20px; background-color: red; width: 250px; height: 50px; font-weight: bold;">??????????????????</button>
            </div>
        </div>
    </div>
</div>


<script>
    //????????????
    const UserShoppingBasket = document.querySelector("#UserShoppingBasket");
    //????????????
    const OrderInformation = document.querySelector("#OrderInformation");
    //????????????
    const Privacy = document.querySelector("#Privacy");
    //????????????
    const ShippingInformation = document.querySelector("#ShippingInformation");
    //?????? ?????? ???????????? ??????
    const UserUpdateData = document.querySelector("#UserUpdateData");
    //?????? ?????? ?????? ??????
    const UserDeleteData = document.querySelector("#UserDeleteData");
    //????????? ?????? ????????????
    const paymentBtn = document.querySelector("#paymentBtn");

    let totalPrice = 0;

    window.addEventListener("DOMContentLoaded",()=>{
        $.ajax({
            url : "${pageContext.request.contextPath}/users/basketList", // ?????????????????? HTTP ????????? ?????? ????????? URL ??????
            type : "GET",
            dataType : "json",
            data : {
                id : "${sessionScope.id}",
            }, // HTTP ????????? ?????? ????????? ?????? ?????????
            success : function(data) {
                var str = '';
                var total = 0;
                if(data.basketList.length == 0){
                    console.log("??????????????????.");
                }else{
                    data.basketList.map(listData =>
                        total += Number(listData.productTotalPrice)
                    );
                    data.basketList.map(list =>
                        str += "<tr><td class='tbodyContent'>" + list.userId + "</td>"
                            + "<td class='tbodyContent'>"+list.productName+"</td>"
                            + "<td class='tbodyContent'>"+list.productSize+"</td>"
                            + "<td class='tbodyContent'>"+list.productAmount+"</td>"
                            + "<td class='tbodyContent'>"+list.productTotalPrice+"</td>"
                            + "<td class='tbodyContent'><button>??????</button></td></tr>"
                    )
                    $(".basketListTable").html(str);
                    totalPrice = total;
                    $("#OrderTotalPrice").val(total+"???");
                }
            }
        })
    })

    paymentBtn.addEventListener("click",()=>{
        $.ajax({
            url : "${pageContext.request.contextPath}/users/kakaoPay",
            dataType : "json",
            data : {
                id : "${sessionScope.id}",
                total : totalPrice,
            },
            success : function(data) {
                var box = data.next_redirect_pc_url;
                window.open(box);
            },
        })
    })


    UserShoppingBasket.addEventListener("click", () => {

        $("#ShoppingBasket").show();
        $("#OrderInfo").hide();
        $("#DeliveryInfo").hide();
        $("#PrivacyInfo").hide();
    });
    OrderInformation.addEventListener("click", () => {
        OrderList();
        $("#ShoppingBasket").hide();
        $("#OrderInfo").show();
        $("#DeliveryInfo").hide();
        $("#PrivacyInfo").hide();
    });
    ShippingInformation.addEventListener("click", () => {
        DeliveryList();
        $("#ShoppingBasket").hide();
        $("#OrderInfo").hide();
        $("#DeliveryInfo").show();
        $("#PrivacyInfo").hide();
    });
    Privacy.addEventListener("click", () => {
        PrivacyData();
        $("#ShoppingBasket").hide();
        $("#OrderInfo").hide();
        $("#DeliveryInfo").hide();
        $("#PrivacyInfo").show();
    });

    function DeliveryList() {
        $.ajax({
            url : "${pageContext.request.contextPath}/users/DeliveryList", // ?????????????????? HTTP ????????? ?????? ????????? URL ??????
            type : "GET",
            dataType : "json",
            data : {
                id : "${sessionScope.id}"
            }, // HTTP ????????? ?????? ????????? ?????? ?????????
            success : function(data) {
                var str = '';
                if(data.deliveryList.length == 0){
                    console.log("??????????????????.");
                }else{
                    data.deliveryList.map(list =>
                        str += "<tr><td class='tbodyContent'>" + list.deliveryNum + "</td>"
                            + "<td class='tbodyContent'>"+list.orderNum+"</td>"
                            + "<td class='tbodyContent'>"+list.userId+"</td>"
                            + "<td class='tbodyContent'>"+list.orderDate+"</td>"
                            + "<td class='tbodyContent'>"+list.orderTotalPrice+"</td>"
                            + "<td class='tbodyContent'>"+list.orderSuccess+"</td>"
                            + "<td class='tbodyContent'>"+list.deliveryCom+"</td>"
                            + "<td class='tbodyContent'>"+list.postNum+"</td>"
                            + "<td class='tbodyContent'>"+list.deliveryInfo+"</td></tr>"
                    )
                    $(".UserDeliveryListTable").html(str);
                }
            },
        })
    }
    
    function OrderList(){
        $.ajax({
            url : "${pageContext.request.contextPath}/users/OrderList", // ?????????????????? HTTP ????????? ?????? ????????? URL ??????
            type : "GET",
            dataType : "json",
            data : {
                id : "${sessionScope.id}"
            }, // HTTP ????????? ?????? ????????? ?????? ?????????
            success : function(data) {
                var str = '';
                if(data.orderList.length == 0){
                    console.log("??????????????????.");
                }else{
                    data.orderList.map(list =>
                        str += "<tr><td class='tbodyContent'>" + list.orderNum + "</td>"
                            + "<td class='tbodyContent'>"+list.userId+"</td>"
                            + "<td class='tbodyContent'>"+list.orderDate+"</td>"
                            + "<td class='tbodyContent'>"+list.orderTotalPrice+"</td>"
                            + "<td class='tbodyContent'>"+list.orderSuccess+"</td>"
                            + "<td class='tbodyContent'>"+list.deliveryInfo+"</td></tr>"
                    )
                    $(".OrderListTable").html(str);
                }
            },
        })
    }

    function PrivacyData(){
        $.ajax({
            url : "${pageContext.request.contextPath}/users/privacy", // ?????????????????? HTTP ????????? ?????? ????????? URL ??????
            type : "GET",
            dataType : "json",
            data : {
                id : "${sessionScope.id}"
            }, // HTTP ????????? ?????? ????????? ?????? ?????????
            success : function(data) {
                console.log(data.usersData);
                $("#before_id").val(data.usersData.userId);
                $("#after_id").val(data.usersData.userId);
                $("#before_pw").val(data.usersData.password);
                $("#after_pw").val(data.usersData.password);
                $("#before_name").val(data.usersData.names);
                $("#after_name").val(data.usersData.names);
                $("#before_address").val(data.usersData.address);
                $("#after_address").val(data.usersData.address);
                $("#before_tel").val(data.usersData.tel);
                $("#after_tel").val(data.usersData.tel);
                $("#before_email").val(data.usersData.email);
                $("#after_email").val(data.usersData.email);
                $("#before_birth").val(data.usersData.birthday);
                $("#after_birth").val(data.usersData.birthday);
            },
        })
    }

    UserUpdateData.addEventListener("click", ()=>{
        Swal.fire({
            title: "???????????? ????????? ?????????????????????????",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: '??????',
            confirmButtonText: '??????',
        }).then((result) => {
            if(result.isConfirmed){
                UserUpdate();
                Swal.fire({
                    icon : "success",
                    title : "Good",
                    text : "????????? ?????????????????? ???????????? ????????? ?????? ????????? ??????????????????."
                });
                TimeOut();
            }
        })
    })

    function UserUpdate(){
        $.ajax({
            url : "${pageContext.request.contextPath}/users/updateAction", // ?????????????????? HTTP ????????? ?????? ????????? URL ??????
            type : "PUT",
            dataType : "json",
            data : {
                id : "${sessionScope.id}",
                pw : $("#after_pw").val(),
                address : $("#after_address").val(),
                email : $("#after_email").val(),
                tel : $("#after_tel").val(),
            }, // HTTP ????????? ?????? ????????? ?????? ?????????
            success : function(data) {

            }
        })
    }

    UserDeleteData.addEventListener("click",()=>{
        Swal.fire({
            title: "?????? ????????? ?????????????????????????",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: '??????',
            confirmButtonText: '??????',
        }).then((result) => {
            if(result.isConfirmed){
                (async () => {
                    const { value: password } = await Swal.fire({
                        title: '???????????? ??????????????? ???????????????.',
                        text: '(??????) ?????? ????????? ???????????????.',
                        icon : 'warning',
                        input: 'password',
                        inputPlaceholder: 'PASSWORD'
                    })
                    // ?????? ???????????? ??????.
                    if (password=="") {
                        Swal.fire({
                            icon : "error",
                            title : "Error",
                            text : "??????????????? ??????????????????."
                        })
                        return;
                    }else{
                        if(password == $("#before_pw").val()){
                            Swal.fire({
                                title: "????????? ???????????? ???????????????????????????.",
                                icon: 'warning',
                                showCancelButton: true,
                                confirmButtonColor: '#3085d6',
                                cancelButtonColor: '#d33',
                                cancelButtonText: '??????',
                                confirmButtonText: '??????',
                            }).then((result) => {
                                UserDelete();
                                Swal.fire({
                                    icon : "success",
                                    title : "Good",
                                    text : "???????????? ?????????????????? ??????????????????!"
                                });
                                TimeOut()
                            })
                        }else{
                            Swal.fire({
                                icon : "error",
                                title : "error",
                                text : "???????????? ??????"
                            });
                        }
                    }
                })()
            }
        })
    })

    function UserDelete(){
        $.ajax({
            url : "${pageContext.request.contextPath}/users/deleteAction", // ?????????????????? HTTP ????????? ?????? ????????? URL ??????
            type : "DELETE",
            dataType : "json",
            data : {
                id : "${sessionScope.id}",
            }, // HTTP ????????? ?????? ????????? ?????? ?????????
            success : function(data) {

            }
        })
    }

    function TimeOut(){
        setTimeout(function (){
            location.href = "${pageContext.request.contextPath}/main";
        } , 1500);

    }

</script>


</body>
</html>