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
        <a href="${pageContext.request.contextPath}/" style="margin-left: 10px; color: white; font-weight: bold; font-size: 24px;">White Shop</a>
    </div>

    <div class="search">
        <input type="text" placeholder="검색어 입력">
        <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
    </div>

    <div>
        <a href="${pageContext.request.contextPath}/users/join" class="navbar__toggleBtn" style="margin-right: 5px; color: white; font-weight: bold; font-size: 24px;">JOIN</a>
        <a href="${pageContext.request.contextPath}/users/login" class="navbar__toggleBtn" style="margin-right: 55px; color: white; font-weight: bold; font-size: 24px;">LOGIN</a>
    </div>

</nav>


<nav class="subbar">
    <ul class="subbar__menu">
        <li style="margin-left: 150px; margin-top: 10px;"><a href="${pageContext.request.contextPath}/smartphone/iphone">IPhone</a></li>
        <li><a href="#">Galaxy</a></li>
        <li><a href="#">GalaxyTAP</a></li>
        <li><a href="#">IPAD</a></li>
        <li><a href="#">LG</a></li>
    </ul>
    <div style="display: inline-flex;"></div>
</nav>
<h2 style="text-align: center; margin-top: 20px;">회원가입</h2>
<div style="display: flex; justify-content: center;">
    <div class="account_table"
         style="border-radius: 20px; width: 840px; height: 500px; display: flex; margin-top: 5px;">
            <table class="join_table">
                <tr>
                    <td class="input_first">아이디</td>
                    <td><input type="text" placeholder="아이디" id="id" /></td>
                    <td><button id="doubleCheckButton" style="border-radius: 20px; width: 150px; height: 40px; background-color: ivory; border-style: none;" >중복확인</button></td>
                </tr>
                <tr>
                    <td class="input_first">비밀번호</td>
                    <td><input type="password"placeholder="비밀번호" id="first_pw"/></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="input_first">비밀번호확인</td>
                    <td><input type="password"placeholder="비밀번호확인" id="second_pw"/></td>
                    <td><div id="true_false"></div></td>
                </tr>
                <tr>
                    <td class="input_first">이름</td>
                    <td><input id="name" type="text"placeholder="이름" /></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="input_first">주소</td>
                    <td><input id="address" type="text"placeholder="주소" /></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="input_first">전화번호</td>
                    <td><input id="tel" type="text"placeholder="전화번호" /></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="input_first">이메일</td>
                    <td><input id="email" type="text"placeholder="이메일" /></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="input_first">생일</td>
                    <td><input id="birth" type="text"placeholder="EX : 980325" /></td>
                    <td></td>
                </tr>
            </table>
    </div>
</div>
<div style="text-align: center; margin-top: 10px;">
    <button id="userInsertButton" style="border-radius: 20px; width: 150px; height: 40px; background-color: ivory; border-style: none;">가입</button>
    <button onclick="history.back()" style="border-radius: 20px; width: 150px; height: 40px; background-color: ivory; border-style: none;">취소</button>
</div>

<script type= text/javascript>
    let id = document.querySelector("#id");
    let first_pw = document.querySelector("#first_pw");
    let second_pw = document.querySelector("#second_pw");
    let name = document.querySelector("#name");
    let address = document.querySelector("#address");
    let tel = document.querySelector("#tel");
    let email = document.querySelector("#email");
    let birth = document.querySelector("#birth");
    let divValue = document.querySelector("#true_false");

    $(document).ready(function (){

       $("#second_pw").focusout(function (){
          var first_pw = $("#first_pw").val();
          var second_pw = $("#second_pw").val();

          if(first_pw == second_pw){
              divValue.innerHTML = "일치";
          }else{
              divValue.innerHTML = "불일치";
          }
       });
    });


    const doubleCheckBtn = document.querySelector("#doubleCheckButton");
    doubleCheckBtn.addEventListener("click",()=>{
        console.log("성진 : 중복확인 이벤트실행");
        doubleCheck();
    })

    const userInsertBtn = document.querySelector("#userInsertButton");
    userInsertBtn.addEventListener("click", ()=>{
        if(id.value=="" || first_pw=="" ||
            second_pw=="" || name=="" ||
            address=="" || tel=="" ||
            email=="" || birth==""
        ){
            Swal.fire({
                icon : "error",
                title : "Error",
                text : "모든 정보를 입력해주세요"
            })
            return;
        }else{
            if(idCheck==false){
                Swal.fire({
                    icon : "error",
                    title : "Error",
                    text : "아이디 중복확인"
                })
                return;
            }
            else{
                if(divValue.innerHTML == "불일치"){
                    Swal.fire({
                        icon : "error",
                        title : "Error",
                        text : "비밀번호 확인"
                    })
                    return;
                }else{
                    Swal.fire({
                        title: "입력하신 정보로 가입하시겠습니까?",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        cancelButtonText: '취소',
                        confirmButtonText: '확인',
                    }).then((result) => {
                        userInsert();
                        Swal.fire({
                            icon : "success",
                            title : "Good",
                            text : "회원가입을 축하드립니다!"
                        });
                        TimeOut()
                    })
                }
            }
        }
    })

    function TimeOut(){
        setTimeout(function (){
            location.href = "${pageContext.request.contextPath}/main";
        } , 1000);

    }

    function userInsert(){
        $.ajax({
            url : "${pageContext.request.contextPath}/users/userinsert", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            type : "POST",
            dataType : "json",
            data : {
                id : $("#id").val(),
                pw_1 : $("#first_pw").val(),
                pw_2 : $("#second_pw").val(),
                name : $("#name").val(),
                address : $("#address").val(),
                tel : $("#tel").val(),
                email : $("#email").val(),
                birth : $("#birth").val()
            }, // HTTP 요청과 함께 서버로 보낼 데이터
            success : function(data) {
                console.log(data);
            },
        })
    }


    let idCheck = false;

    function doubleCheck(){
        $.ajax({
            url : "${pageContext.request.contextPath}/users/doublecheck", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            type : "GET",
            dataType : "json",
            data : {
                id : $("#id").val()
            }, // HTTP 요청과 함께 서버로 보낼 데이터
            success : function(data) {
                console.log(data.arraylist.length);
                if(data.arraylist.length == 0){
                    idCheck = true;
                    Swal.fire({
                        icon : 'success',
                        title : 'Good',
                        text : '사용가능한 아이디',
                    })
                    console.log(idCheck);
                }else{
                    Swal.fire({
                        icon : 'error',
                        title : 'Error',
                        text : '이미 존재하는 아이디',
                    })
                }
            },
        })
    }
</script>

</body>
</html>