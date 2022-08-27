package com.seongjin.shopping.users.controller;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.seongjin.shopping.users.service.UserService;
import com.seongjin.shopping.users.to.UserTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;

@RestController
@RequestMapping("/users/*")
public class UserController {

    @Autowired
    private UserService userService;

    ModelMap map = null;

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

}
