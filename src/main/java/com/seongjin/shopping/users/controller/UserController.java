package com.seongjin.shopping.users.controller;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.seongjin.shopping.users.service.UserService;
import com.seongjin.shopping.users.to.BasketTO;
import com.seongjin.shopping.users.to.DeliveryTO;
import com.seongjin.shopping.users.to.OrderTO;
import com.seongjin.shopping.users.to.UserTO;
import org.apache.tomcat.util.json.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/users/*")
public class UserController {

    @Autowired
    private UserService userService;

    ModelMap map = null;
    String totalPrice = "";

    //private static Gson gson = new Gson();

    @RequestMapping(value = "/doublecheck" , method = RequestMethod.GET)
    public ModelMap doubleCheck(HttpServletRequest request , HttpServletResponse response){

        String id = request.getParameter("id");
        System.out.println("회원 중복 확인 요청 : " + id);

        map = new ModelMap();

            ArrayList<UserTO> datalist =  userService.getUserDetailSearch(id);
            System.out.println("datalist = " + datalist);

        try {
            map.put("arraylist",datalist);
            map.put("errorCode", 1);
            map.put("errorMsg", "성공!");

        }catch(Exception exception){
            exception.printStackTrace();
            map.put("errorCode", -1);
            map.put("errorMsg", exception.getMessage());
        }

        return map;
    }
    @RequestMapping(value = "/userinsert" , method = RequestMethod.POST)
    public ModelMap UserInsert(HttpServletRequest request , HttpServletResponse response){

        String id = request.getParameter("id");
        String pw_1 = request.getParameter("pw_1");
        String pw_2 = request.getParameter("pw_2");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");
        String birth = request.getParameter("birth");

        System.out.println("회원가입 정보 요청");
        System.out.println("id = " + id);
        System.out.println("pw_1 = " + pw_1);
        System.out.println("pw_2 = " + pw_2);
        System.out.println("name = " + name);
        System.out.println("address = " + address);
        System.out.println("tel = " + tel);
        System.out.println("email = " + email);
        System.out.println("birth = " + birth);

        map = new ModelMap();
        UserTO users = new UserTO();
        users.setUserId(id);
        users.setPassword(pw_1);
        users.setConfirmPw(pw_2);
        users.setNames(name);
        users.setAddress(address);
        users.setTel(tel);
        users.setEmail(email);
        users.setBirthday(birth);
        userService.setUserInsert(users);



        try {
            HttpSession session = request.getSession();
            session.setAttribute("id",users.getUserId());
            session.setAttribute("name",users.getNames());
            map.put("errorCode", 1);
            map.put("errorMsg", "성공!");

        }catch(Exception exception){
            exception.printStackTrace();
            map.put("errorCode", -1);
            map.put("errorMsg", exception.getMessage());
        }

        return map;
    }

    @RequestMapping(value = "/session/logout" , method = RequestMethod.GET)
    public void Logout(HttpServletRequest request , HttpServletResponse response){

        map = new ModelMap();

        try {
            HttpSession session = request.getSession();
            session.invalidate();
            response.sendRedirect("/");
        }catch(Exception exception){
            exception.printStackTrace();
            map.put("errorCode", -1);
            map.put("errorMsg", exception.getMessage());
        }
    }

    @RequestMapping(value = "/loginAction" , method = RequestMethod.GET)
    public ModelMap Login(HttpServletRequest request , HttpServletResponse response){

        map = new ModelMap();
        String userId = request.getParameter("id");
        String userPw = request.getParameter("pw");

        System.out.println("userId = " + userId);
        System.out.println("userPw = " + userPw);

        ArrayList<UserTO> userLogin = userService.getUserLogin(userId,userPw);

        System.out.println("userLogin = " + userLogin);

        if(userLogin==null){
            try {
                map.put("loginUser",userLogin);
                map.put("errorCode", 1);
                map.put("errorMsg", "성공");
            }catch(Exception exception){
                exception.printStackTrace();
                map.put("errorCode", -1);
                map.put("errorMsg", exception.getMessage());
            }
        }else{
            try {
                HttpSession session = request.getSession();
                for(UserTO user : userLogin){
                    session.setAttribute("name" , user.getNames());
                    session.setAttribute("id" , user.getUserId());
                }
                map.put("loginUser",userLogin);
                map.put("errorCode", 1);
                map.put("errorMsg", "성공");
            }catch(Exception exception){
                exception.printStackTrace();
                map.put("errorCode", -1);
                map.put("errorMsg", exception.getMessage());
            }
        }


        return map;
    }

    @RequestMapping(value = "/privacy" , method = RequestMethod.GET)
    public ModelMap PrivacyData(HttpServletRequest request , HttpServletResponse response){

        String id = request.getParameter("id");
        System.out.println(" 개인정보 요청 : " + id);

        map = new ModelMap();

        UserTO users = userService.PrivacyData(id);

        try {
            map.put("usersData" , users);
            map.put("errorCode", 1);
            map.put("errorMsg", "성공!");

        }catch(Exception exception){
            exception.printStackTrace();
            map.put("errorCode", -1);
            map.put("errorMsg", exception.getMessage());
        }

        return map;
    }
    @RequestMapping(value = "/updateAction" , method = RequestMethod.PUT)
    public ModelMap UsersUpdateAction(HttpServletRequest request , HttpServletResponse response){

        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");

        System.out.println(" 정보 업데이트 요청 : " + id);
        System.out.println(" 정보 업데이트 요청 : " + pw);
        System.out.println(" 정보 업데이트 요청 : " + address);
        System.out.println(" 정보 업데이트 요청 : " + email);
        System.out.println(" 정보 업데이트 요청 : " + tel);

        map = new ModelMap();

       userService.UserUpdateData(id , pw , address ,email, tel);

        try {
            HttpSession session = request.getSession();
            session.invalidate();
            map.put("errorCode", 1);
            map.put("errorMsg", "성공!");

        }catch(Exception exception){
            exception.printStackTrace();
            map.put("errorCode", -1);
            map.put("errorMsg", exception.getMessage());
        }

        return map;
    }

    @RequestMapping(value = "/deleteAction" , method = RequestMethod.DELETE)
    public ModelMap UsersDeleteAction(HttpServletRequest request , HttpServletResponse response){

        String id = request.getParameter("id");

        System.out.println(" 회원탈퇴 요청 : " + id);

        map = new ModelMap();

        userService.UserDeleteAction(id);

        try {
            HttpSession session = request.getSession();
            session.invalidate();
            map.put("errorCode", 1);
            map.put("errorMsg", "성공!");

        }catch(Exception exception){
            exception.printStackTrace();
            map.put("errorCode", -1);
            map.put("errorMsg", exception.getMessage());
        }

        return map;
    }
    @RequestMapping(value = "/basket" , method = RequestMethod.POST)
    public ModelMap UsersBasketAction(HttpServletRequest request , HttpServletResponse response){

        String id = request.getParameter("id");
        String productName = request.getParameter("productName");
        String productSize = request.getParameter("productSize");
        String productAmount = request.getParameter("productAmount");
        String productTotalPrice = request.getParameter("productTotalPrice");

        System.out.println("id = " + id);
        System.out.println("productName = " + productName);
        System.out.println("productSize = " + productSize);
        System.out.println("productAmount = " + productAmount);
        System.out.println("productTotalPrice = " + productTotalPrice);


        map = new ModelMap();
        userService.setUserBasketData(id,productName,productSize,productAmount,productTotalPrice);
        try {
            map.put("errorCode", 1);
            map.put("errorMsg", "성공!");

        }catch(Exception exception){
            exception.printStackTrace();
            map.put("errorCode", -1);
            map.put("errorMsg", exception.getMessage());
        }

        return map;
    }
    @RequestMapping(value = "/basketList" , method = RequestMethod.GET)
    public ModelMap UsersBasketList(HttpServletRequest request , HttpServletResponse response){

        String id = request.getParameter("id");

        System.out.println("id = " + id);

        map = new ModelMap();

        ArrayList<BasketTO> basketList = userService.getBasketList(id);

        try{
            map.put("basketList",basketList);
            map.put("errorCode", 1);
            map.put("errorMsg", "성공!");

        }catch(Exception exception){
            exception.printStackTrace();
            map.put("errorCode", -1);
            map.put("errorMsg", exception.getMessage());
        }

        return map;
    }

    @RequestMapping(value = "/kakaoPay")
    @ResponseBody
    public String KakaoPay(HttpServletRequest request , HttpServletResponse response){

        String id = request.getParameter("id");
        totalPrice = request.getParameter("total");
        ArrayList<BasketTO> basketList = userService.getBasketList(id);

        int sum = 0;
        String product = basketList.get(0).getProductName();
        int subProduct = basketList.size()-1;
        String ProductEncode = "";
        String SubProductEncode = "";
        String str1 = "외";
        String str2 = "개의 상품";
        String str1Encode ="";
        String str2Encode ="";
        try {
            ProductEncode = URLEncoder.encode(product,"UTF-8");
            SubProductEncode = URLEncoder.encode(String.valueOf(subProduct),"UTF-8");
            str1Encode = URLEncoder.encode(str1,"UTF-8");
            str2Encode = URLEncoder.encode(str2,"UTF-8");

        }catch (Exception e){
            e.printStackTrace();
        }

        for(BasketTO List : basketList){
            sum += Integer.parseInt(List.getProductTotalPrice());
        }
        System.out.println("product = " + product);
        System.out.println("sum = " + sum);
        System.out.println("subProduct = " + subProduct);

        try {
        URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
        HttpURLConnection serverMapping = (HttpURLConnection) address.openConnection();
        serverMapping.setRequestMethod("POST");
        serverMapping.setRequestProperty("Authorization","KakaoAK 18df0af20da89061eadf2f0619c2d30c");
        serverMapping.setRequestProperty("Content-type","application/x-www-form-urlencoded;charset=utf-8");
        serverMapping.setDoOutput(true);
        String parameter = "cid=TC0ONETIME&partner_order_id="+id+"&partner_user_id="+id+"&item_name="+ ProductEncode +" "+str1Encode +" "+SubProductEncode + str2Encode + "&quantity=1&total_amount="+sum+"&vat_amount=200&tax_free_amount=0&approval_url=\t\n" +
                "http://localhost:8405/users/success&fail_url=\t\n" +
                "http://localhost:8405/users/fail&cancel_url=\t\n" +
                "http://localhost:8405/users/mypage";
        OutputStream direct = serverMapping.getOutputStream();
        DataOutputStream dataDirect = new DataOutputStream(direct);
        dataDirect.writeBytes(parameter);
        dataDirect.close();

        int result = serverMapping.getResponseCode();

        InputStream requests;
        if(result==200){
            requests = serverMapping.getInputStream();
        }else{
            requests = serverMapping.getErrorStream();
        }
        InputStreamReader read = new InputStreamReader(requests);
        BufferedReader bufferReader = new BufferedReader(read);
        return bufferReader.readLine();
        }catch (MalformedURLException e1){
            e1.printStackTrace();
        }catch (IOException e2){
            e2.printStackTrace();
        }
        return "main";
    }

    @RequestMapping(value = "/deleteBasket" , method = RequestMethod.DELETE)
    public ModelMap UsersBasketListDelete(HttpServletRequest request , HttpServletResponse response){

        String id = request.getParameter("userId");
        
        map = new ModelMap();

        userService.deleteBasketList(id);

        try{
            map.put("errorCode", 1);
            map.put("errorMsg", "성공!");

        }catch(Exception exception){
            exception.printStackTrace();
            map.put("errorCode", -1);
            map.put("errorMsg", exception.getMessage());
        }

        return map;
    }

    @RequestMapping(value = "/insertOrderList" , method = RequestMethod.POST)
    public ModelMap UsersInsertOrderList(HttpServletRequest request , HttpServletResponse response){

        String id = request.getParameter("id");

        map = new ModelMap();
        System.out.println("insert = " + id);

        userService.insertOrderList(id , totalPrice);

        try{
            map.put("errorCode", 1);
            map.put("errorMsg", "성공!");

        }catch(Exception exception){
            exception.printStackTrace();
            map.put("errorCode", -1);
            map.put("errorMsg", exception.getMessage());
        }

        return map;
    }

    @RequestMapping(value = "/OrderList" , method = RequestMethod.GET)
    public ModelMap UsersOrderList(HttpServletRequest request , HttpServletResponse response){

        String id = request.getParameter("id");

        map = new ModelMap();
        System.out.println("select = " + id);

        ArrayList<OrderTO> orderList = userService.getOrderList(id);

        try{
            map.put("orderList" , orderList);
            map.put("errorCode", 1);
            map.put("errorMsg", "성공!");

        }catch(Exception exception){
            exception.printStackTrace();
            map.put("errorCode", -1);
            map.put("errorMsg", exception.getMessage());
        }

        return map;
    }

    @RequestMapping(value = "/OrderListAll" , method = RequestMethod.GET)
    public ModelMap UsersOrderListAll(HttpServletRequest request , HttpServletResponse response){

        map = new ModelMap();

        ArrayList<OrderTO> orderListAll = userService.getOrderListAll();

        try{
            map.put("orderListAll" , orderListAll);
            map.put("errorCode", 1);
            map.put("errorMsg", "성공!");

        }catch(Exception exception){
            exception.printStackTrace();
            map.put("errorCode", -1);
            map.put("errorMsg", exception.getMessage());
        }

        return map;
    }

    @RequestMapping(value = "/deliveryInfo" , method = RequestMethod.POST)
    public ModelMap InsertDeliveryInfo(HttpServletRequest request , HttpServletResponse response){

        map = new ModelMap();

        String orderNum = request.getParameter("orderNum");
        String userId = request.getParameter("userId");
        String orderDate = request.getParameter("orderDate");
        String orderTotalPrice = request.getParameter("orderTotalPrice");
        String orderSuccess = request.getParameter("orderSuccess");
        String deliveryCom = request.getParameter("deliveryCom");
        String postNum = request.getParameter("postNum");
        String deliveryInfo = request.getParameter("deliveryInfo");

        System.out.println("배송처리");
        System.out.println("orderNum = " + orderNum);
        System.out.println("userId = " + userId);
        System.out.println("orderDate = " + orderDate);
        System.out.println("orderTotalPrice = " + orderTotalPrice);
        System.out.println("orderSuccess = " + orderSuccess);
        System.out.println("deliveryCom = " + deliveryCom);
        System.out.println("postNum = " + postNum);
        System.out.println("deliveryInfo = " + deliveryInfo);

        userService.setUserOrderInfoUpdate(orderNum,deliveryInfo);
        userService.setDeliveryInfo(orderNum,userId,orderDate,orderTotalPrice,orderSuccess,deliveryCom,postNum,deliveryInfo);

        try{
            map.put("errorCode", 1);
            map.put("errorMsg", "성공!");

        }catch(Exception exception){
            exception.printStackTrace();
            map.put("errorCode", -1);
            map.put("errorMsg", exception.getMessage());
        }

        return map;
    }

    @RequestMapping(value = "/SelectDetailOrder" , method = RequestMethod.GET)
    public ModelMap SelectDetailOrder(HttpServletRequest request , HttpServletResponse response){

        String OrderNum = request.getParameter("OrderNum");

        map = new ModelMap();
        System.out.println("OrderNum = " + OrderNum);

        ArrayList<OrderTO> selectDetailOrder = userService.getDetailOrder(OrderNum);

        try{
            map.put("selectDetailOrder",selectDetailOrder);
            map.put("errorCode", 1);
            map.put("errorMsg", "성공!");

        }catch(Exception exception){
            exception.printStackTrace();
            map.put("errorCode", -1);
            map.put("errorMsg", exception.getMessage());
        }

        return map;
    }

    @RequestMapping(value = "/DeliveryList" , method = RequestMethod.GET)
    public ModelMap SelectDeliveryList(HttpServletRequest request , HttpServletResponse response){

        String id = request.getParameter("id");

        map = new ModelMap();
        System.out.println("id = " + id);

        ArrayList<DeliveryTO> deliveryList = userService.getDeliveryList(id);

        try{
            map.put("deliveryList",deliveryList);
            map.put("errorCode", 1);
            map.put("errorMsg", "성공!");

        }catch(Exception exception){
            exception.printStackTrace();
            map.put("errorCode", -1);
            map.put("errorMsg", exception.getMessage());
        }

        return map;
    }

//    @RequestMapping(value = "/DeliveryInfo" , method = RequestMethod.POST)
//    public ModelMap adminDeliveryInfo(HttpServletRequest request , HttpServletResponse response){
//
//        String id = request.getParameter("id");
//        String list1 = request.getParameter("1");
//        System.out.println("list1 = " + list1);
//        System.out.println("id = " + id);
//
//        try{
//            map.put("errorCode", 1);
//            map.put("errorMsg", "성공!");
//
//        }catch(Exception exception){
//            exception.printStackTrace();
//            map.put("errorCode", -1);
//            map.put("errorMsg", exception.getMessage());
//        }
//
//        return map;
//    }


}
