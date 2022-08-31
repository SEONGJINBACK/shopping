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
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

    <title>SeongjinShop</title>
</head>

<body>
    <script>
        window.addEventListener("DOMContentLoaded",()=>{
            $.ajax({
                url : "${pageContext.request.contextPath}/users/insertOrderList",
                type : "POST",
                data : {
                    id : "${sessionScope.id}"
                },
                dataType : "json",
                success : function(data) {
                    $.ajax({
                        url : "${pageContext.request.contextPath}/users/deleteBasket?userId=${sessionScope.id}",
                        type : "DELETE",
                        dataType : "json",
                        success : function(data) {
                            Swal.fire({
                                icon : "success",
                                title : "Good",
                                text : "결제가 완료되었습니다.!",
                                confirmButtonColor: '#3085d6',
                                confirmButtonText: '확인',
                            }).then((result) => {
                                if(result.isConfirmed){
                                    TimeOut();
                                }
                            });
                        },
                    })
                },
            })

        });

        function TimeOut(){
            setTimeout(function (){
                location.href = "${pageContext.request.contextPath}/users/mypage";
            } , 1500);

        }
    </script>
</body>
</html>