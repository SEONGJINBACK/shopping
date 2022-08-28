package com.seongjin.shopping.sys.Controller;


import com.seongjin.shopping.clothing.service.ClothingService;
import com.seongjin.shopping.clothing.to.TshirtTO;
import com.seongjin.shopping.users.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Array;
import java.util.ArrayList;

@Controller
public class ViewController {

    @RequestMapping("/")
    public String startView(){
        System.out.println("요청이들어와서 이미지를 불러옴");
        return "main";
    }

    @RequestMapping(value = "/{viewName}")
    public String view(@PathVariable String viewName) {

        System.out.println("요청한 JSP : " + "/" + viewName);
        return viewName;
    }

    @RequestMapping(value="/{pack}/{viewName}")
    public String packView(@PathVariable String pack, @PathVariable String viewName) {
        System.out.println("폴더 : "+pack+" "+" 요청한 JSP : "+viewName);
        return pack+"/"+viewName;
    }

}
