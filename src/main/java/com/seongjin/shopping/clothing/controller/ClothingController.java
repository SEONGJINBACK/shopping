package com.seongjin.shopping.clothing.controller;


import com.seongjin.shopping.clothing.service.ClothingService;
import com.seongjin.shopping.clothing.to.TshirtTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@RestController
@RequestMapping("/clothing/*")
public class ClothingController {

    @Autowired
    private ClothingService clothingService;

    ModelMap map = null;

    @RequestMapping(value = "/shirtList" , method = RequestMethod.GET)
    public ModelMap ShirtList(HttpServletRequest request , HttpServletResponse response){
        System.out.println("의류 컨트롤러 호출");

        map = new ModelMap();

        ArrayList<TshirtTO> shirtList = clothingService.getShirtList();

        try {
            HttpSession session = request.getSession();
            session.setAttribute("shirt" , shirtList);
            session.setAttribute("shirtLength" , shirtList.size());
            map.put("shirtList",shirtList);
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
