package com.seongjin.shopping.users.controller;


import com.seongjin.shopping.users.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/users/*")
public class UserController {

    @Autowired
    private UserService userService;

    ModelMap map = null;


}
