<%@ page import="java.util.concurrent.TimeUnit" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    Object userName = session.getAttribute("name");
    String userId = (String) session.getAttribute("id");

    if (!userId.equals("admin")) {
        out.print("<script>");
        out.print("alert('관리자만 접속 가능합니다.');");
        out.print("history.back()");
        out.print("</script>");
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
    <script src="https://unpkg.com/ag-grid-community/dist/ag-grid-community.min.noStyle.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/ag-grid-community/dist/styles/ag-grid.css">
    <link rel="stylesheet" href="https://unpkg.com/ag-grid-community/dist/styles/ag-theme-balham.css">
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
            width: 400px;
            height: 500px;
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
            border: 1px solid black;
            display: inline-flex;
        }

        .smartphoneImage {
            height: 42px;
            font-size: 30px;
            border: 1px solid black;
            width: 400px;
        }

        .smartphoneName {
            display: inline;
            text-align: center;
        }

        .thead {
            border: 1px solid black;
            background-color: black;
            color: white;
            font-weight: bold;
            width: 170px;
            text-align: center;
        }

        .tbodyContent {
            border: 1px solid black;
            background-color: white;
            width: 150px;
            text-align: center;

        }

        .td_input {
            text-align: center;
            border-bottom: 1px solid black;
            font-weight: bold;
        }

        .ag-header-cell-label {
            justify-content: center;
        }

        .ag-cell-value {
            padding-left: 5px;
        }
    </style>
</head>

<body>

<nav class="navbar">
    <div class="navbar__logo">
        <i class="material-symbols-outlined" style="float: left; ">
            home</i>
        <a href="${pageContext.request.contextPath}/" style="margin-left: 10px; ">White Shop</a>
    </div>

    <div class="search">

    </div>

    <div>
        <%
            if (userName != "GUEST") {
        %>
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
        <li style="float: right;"><a href="#"><%=userName%>님 환영합니다.</a></li>
    </ul>
    <div style="display: inline-flex;"></div>
</nav>

<div style="border: 1px solid black; width: 100%; height: 800px;">

    <h1 style="text-align: center;">주문요청</h1>
    <div id="myGrid" class="ag-theme-balham" style="height:30vh; width:auto; text-align: center;"></div>
    <h1 style="text-align: center;">배송처리</h1>
    <div id="myGrid2" class="ag-theme-balham" style="height:30vh; width:auto; text-align: center;"></div>
    <button id="deliveryActionButton"
            style="
            background-color: black;
            color: white;
            float: right;
            margin-top: 20px;
            width: 150px;
            height: 40px;
            cursor: pointer;
">
        배송처리
    </button>
</div>


<script>
    const myGrid = document.querySelector("#myGrid");
    const myGrid2 = document.querySelector("#myGrid2");
    let OrderNum = "";
    const deliveryActionBtn = document.querySelector("#deliveryActionButton");


    let OrderColumn = [
        {headerName: "주문번호", field: "orderNum"},
        {headerName: "사용자ID", field: "userId"},
        {headerName: "주문일자", field: "orderDate"},
        {headerName: "주문총액", field: "orderTotalPrice"},
        {headerName: "결제처리", field: "orderSuccess"},
        {headerName: "배송상태", field: "deliveryInfo"},
    ];

    let DeliveryColumn = [
        {headerName: "주문번호", field: "orderNum"},
        {headerName: "사용자ID", field: "userId"},
        {headerName: "주문일자", field: "orderDate"},
        {headerName: "주문총액", field: "orderTotalPrice"},
        {headerName: "결제처리", field: "orderSuccess"},
        {
            headerName: "택배사", field: "deliveryCom", editable: true, cellEditor: 'agSelectCellEditor',
            cellEditorParams: {
                values: ['우체국', 'CJ', '한진'],
            }
        },
        {headerName: "송장번호", field: "postNum", editable: true},
        {
            headerName: "배송상태", field: "deliveryInfo", editable: true, cellEditor: 'agSelectCellEditor',
            cellEditorParams: {
                values: ['배송준비중', '배송중', '배송취소'],
            }
        },
    ];

    let OrderRowData = [];

    let DeliveryRowData = [];

    const OrderGridOptions = {
        columnDefs: OrderColumn,//어떤 컬럼을 사용할건지
        rowSelection: 'single', // 행을 몇개 선택할건지 정하는곳
        defaultColDef: {editable: false}, //컬럼 수정 불가
        overlayNoRowsTemplate: "조회된 주문내역이 없습니다.",
        rowData: OrderRowData,
        onGridSizeChanged: function (event) { //보통 그리드 자동 사이즈 등을 지정, ready 이후 필요한 이벤트 삽입
            event.api.sizeColumnsToFit();
        },
        onCellDoubleClicked: (event) => {
            let selectedNodes = OrderGridOptions.api.getSelectedNodes();
            OrderNum = selectedNodes[0].data.orderNum;
            console.log(OrderNum);
            selectDetailOrder();
        },
    }

    const DeliveryGridOptions = {
        columnDefs: DeliveryColumn,//어떤 컬럼을 사용할건지
        rowSelection: 'single', // 행을 몇개 선택할건지 정하는곳
        defaultColDef: {editable: false}, //컬럼 수정 불가
        overlayNoRowsTemplate: "조회된 주문내역이 없습니다.",
        rowData: DeliveryRowData,
        onGridSizeChanged: function (event) { //보통 그리드 자동 사이즈 등을 지정, ready 이후 필요한 이벤트 삽입
            event.api.sizeColumnsToFit();
        },
        // onCellDoubleClicked: (event) => {
        //     let selectedNodes = DeliveryGridOptions.api.getSelectedNodes();
        //     console.log(selectedNodes[0]);
        //
        // },
    }

    new agGrid.Grid(myGrid2, DeliveryGridOptions);

    function showOrderGrid() {
        $.ajax({
            url: "${pageContext.request.contextPath}/users/OrderListAll",
            type: "GET",
            dataType: "json",
            success: function (data) {
                OrderGridOptions.api.setRowData(data.orderListAll);
            },
        })
    }

    function selectDetailOrder() {
        $.ajax({
            url: "${pageContext.request.contextPath}/users/SelectDetailOrder",
            type: "GET",
            dataType: "json",
            data: {
                OrderNum: OrderNum
            },
            success: function (data) {
                DeliveryGridOptions.api.setRowData(data.selectDetailOrder);
            },
        })
    }

    deliveryActionBtn.addEventListener("click", () => {
        let selectedNodes = DeliveryGridOptions.api.getSelectedNodes();
        console.log(selectedNodes[0].data);

        if (selectedNodes[0].data.deliveryCom == null || selectedNodes[0].data.postNum == null) {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: '택배사와 송장번호 입력 부탁드립니다.',
            });
        }else{
            if(selectedNodes[0].data.deliveryInfo == "배송준비중"){
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: '배송상태를 변경해주세요.',
                });
            }else{
                Swal.fire({
                    title: "입력하신 정보로 배송하시겠습니까?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    cancelButtonText: '취소',
                    confirmButtonText: '확인',
                }).then((result) => {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/users/deliveryInfo",
                        type: "POST",
                        dataType: "json",
                        data: {
                            orderNum: selectedNodes[0].data.orderNum,
                            userId: selectedNodes[0].data.userId,
                            orderDate: selectedNodes[0].data.orderDate,
                            orderTotalPrice: selectedNodes[0].data.orderTotalPrice,
                            orderSuccess: selectedNodes[0].data.orderSuccess,
                            deliveryCom: selectedNodes[0].data.deliveryCom,
                            postNum: selectedNodes[0].data.postNum,
                            deliveryInfo: selectedNodes[0].data.deliveryInfo
                        },
                        success: function (data) {
                            Swal.fire({
                                icon: 'success',
                                title: 'Good',
                                text: '배송을 시작하였습니다.',
                            });
                            TimeOut();
                        },
                    })
                })
            }
        }
    })

    function TimeOut(){
            setTimeout(function (){
                location.href = "${pageContext.request.contextPath}/manager";
            } , 1000);
    }


    document.addEventListener('DOMContentLoaded', () => {
        showOrderGrid();
        new agGrid.Grid(myGrid, OrderGridOptions);
    });

</script>

</body>
</html>