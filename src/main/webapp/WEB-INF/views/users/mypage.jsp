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
        <li style="margin-left: 150px;"><a href="#">Home</a></li>
        <li><a href="#">Gallery</a></li>
        <li><a href="#">Weddings</a></li>
        <li><a href="#">FAQ</a></li>
        <li><a href="#">Bookings</a></li>
        <li style="float: right;"><a href="#"><%=userName%>님 환영합니다.</a></li>
    </ul>
    <div style="display: inline-flex;">

    </div>
</nav>

<div class="mypageContentBox">
    <div class="sideMenu">
        <table class="sideMenuTable" style="height: 100%; width: 100%;">
            <tr>
                <td>
                    <button id="UserShoppingBasket">장바구니</button>
                </td>
            </tr>
            <tr>
                <td>
                    <button id="OrderInformation">주문정보</button>
                </td>
            </tr>
            <tr>
                <td>
                    <button id="ShippingInformation">배송정보</button>
                </td>
            </tr>
            <tr>
                <td>
                    <button id="Privacy">개인정보</button>
                </td>
            </tr>
        </table>
    </div>
    <div class="mypageContent">
        <h1 id="test1">장바구니</h1>
        <h1 id="test2" hidden>주문</h1>
        <h1 id="test3" hidden>개인</h1>
        <div id="test4" hidden>
            <h1 style="text-align: center;">개인정보</h1>
            <div style="display: flex; justify-content: center; margin-top: 20px;">
                <div>
                    <h2 style="text-align: center; margin-left: 70px;">현재정보</h2>
                    <table class="user_table" style="margin-top: 50px;">
                        <tr>
                            <td class="input_first">아이디</td>
                            <td><input type="text" readonly id="before_id"/></td>
                        </tr>
                        <tr>
                            <td class="input_first">비밀번호</td>
                            <td><input type="text" readonly id="before_pw"/></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="input_first">이름</td>
                            <td><input id="before_name" type="text" readonly/></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="input_first">주소</td>
                            <td><input id="before_address" type="text" readonly/></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="input_first">전화번호</td>
                            <td><input id="before_tel" type="text" readonly/></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="input_first">이메일</td>
                            <td><input id="before_email" type="text" readonly/></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="input_first">생일</td>
                            <td><input id="before_birth" type="text" readonly/></td>
                            <td></td>
                        </tr>
                    </table>
                </div>
                <div style="border-left: 1px solid black; margin-left: 100px;"></div>
                <div style="margin-left: 100px;">
                    <h2 style="text-align: center; margin-left: 70px;">변경될 정보</h2>
                    <table class="user_table" style="margin-top: 50px;">
                        <tr>
                            <td class="input_first">아이디</td>
                            <td><input type="text" readonly id="after_id"/></td>
                        </tr>
                        <tr>
                            <td class="input_first">비밀번호</td>
                            <td><input type="text" id="after_pw"/></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="input_first">이름</td>
                            <td><input id="after_name" readonly type="text"/></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="input_first">주소</td>
                            <td><input id="after_address" type="text"/></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="input_first">전화번호</td>
                            <td><input id="after_tel" type="text"/></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="input_first">이메일</td>
                            <td><input id="after_email" type="text"/></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="input_first">생일</td>
                            <td><input id="after_birth" readonly type="text"/></td>
                            <td></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div style="display: flex; justify-content: center; margin-top: 30px;">
                <button id="UserUpdateData" style="border: none; border-radius: 20px; background-color: ivory; width: 250px; height: 50px; font-weight: bold;">개인정보 업데이트</button>
                <button id="UserDeleteData" style="border: none; border-radius: 20px; margin-left: 20px; background-color: red; width: 250px; height: 50px; font-weight: bold;">회원탈퇴하기</button>
            </div>
        </div>
    </div>
</div>


<script>
    //장바구니
    const UserShoppingBasket = document.querySelector("#UserShoppingBasket");
    //주문정보
    const OrderInformation = document.querySelector("#OrderInformation");
    //개인정보
    const Privacy = document.querySelector("#Privacy");
    //배송정보
    const ShippingInformation = document.querySelector("#ShippingInformation");
    //회원 정보 업데이트 버튼
    const UserUpdateData = document.querySelector("#UserUpdateData");
    //회원 정보 삭제 버튼
    const UserDeleteData = document.querySelector("#UserDeleteData");

    UserShoppingBasket.addEventListener("click", () => {

        $("#test1").show();
        $("#test2").hide();
        $("#test3").hide();
        $("#test4").hide();
    });
    OrderInformation.addEventListener("click", () => {
        $("#test1").hide();
        $("#test2").show();
        $("#test3").hide();
        $("#test4").hide();
    });
    ShippingInformation.addEventListener("click", () => {
        $("#test1").hide();
        $("#test2").hide();
        $("#test3").show();
        $("#test4").hide();
    });
    Privacy.addEventListener("click", () => {
        PrivacyData();
        $("#test1").hide();
        $("#test2").hide();
        $("#test3").hide();
        $("#test4").show();
    });

    function PrivacyData(){
        $.ajax({
            url : "${pageContext.request.contextPath}/users/privacy", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            type : "GET",
            dataType : "json",
            data : {
                id : "${sessionScope.id}"
            }, // HTTP 요청과 함께 서버로 보낼 데이터
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
            title: "입력하신 정보로 수정하시겠습니까?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: '취소',
            confirmButtonText: '확인',
        }).then((result) => {
            if(result.isConfirmed){
                UserUpdate();
                Swal.fire({
                    icon : "success",
                    title : "Good",
                    text : "정보가 수정되었으니 수정하신 정보로 다시 로그인 부탁드립니다."
                });
                TimeOut();
            }
        })
    })

    function UserUpdate(){
        $.ajax({
            url : "${pageContext.request.contextPath}/users/updateAction", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            type : "PUT",
            dataType : "json",
            data : {
                id : "${sessionScope.id}",
                pw : $("#after_pw").val(),
                address : $("#after_address").val(),
                email : $("#after_email").val(),
                tel : $("#after_tel").val(),
            }, // HTTP 요청과 함께 서버로 보낼 데이터
            success : function(data) {

            }
        })
    }

    UserDeleteData.addEventListener("click",()=>{
        Swal.fire({
            title: "정말 회원을 탈퇴하시겠습니까?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText: '취소',
            confirmButtonText: '확인',
        }).then((result) => {
            if(result.isConfirmed){
                (async () => {
                    const { value: password } = await Swal.fire({
                        title: '회원님의 비밀번호를 입력하세요.',
                        text: '(주의) 모든 정보가 삭제됩니다.',
                        icon : 'warning',
                        input: 'password',
                        inputPlaceholder: 'PASSWORD'
                    })
                    // 이후 처리되는 내용.
                    if (password=="") {
                        Swal.fire({
                            icon : "error",
                            title : "Error",
                            text : "비밀번호를 입력해주세요."
                        })
                        return;
                    }else{
                        if(password == $("#before_pw").val()){
                            Swal.fire({
                                title: "확인을 누르시면 회원탈퇴완료됩니다.",
                                icon: 'warning',
                                showCancelButton: true,
                                confirmButtonColor: '#3085d6',
                                cancelButtonColor: '#d33',
                                cancelButtonText: '취소',
                                confirmButtonText: '확인',
                            }).then((result) => {
                                UserDelete();
                                Swal.fire({
                                    icon : "success",
                                    title : "Good",
                                    text : "함께해서 즐거웠습니다 안녕히가세요!"
                                });
                                TimeOut()
                            })
                        }else{
                            Swal.fire({
                                icon : "error",
                                title : "error",
                                text : "비밀번호 오류"
                            });
                        }
                    }
                })()
            }
        })
    })

    function UserDelete(){
        $.ajax({
            url : "${pageContext.request.contextPath}/users/deleteAction", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            type : "DELETE",
            dataType : "json",
            data : {
                id : "${sessionScope.id}",
            }, // HTTP 요청과 함께 서버로 보낼 데이터
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