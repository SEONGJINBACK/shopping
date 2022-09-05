package com.seongjin.shopping.sys.Controller;


import com.seongjin.shopping.smartphone.service.SmartPhoneService;
import com.seongjin.shopping.smartphone.to.GalaxyTO;
import com.seongjin.shopping.smartphone.to.IPhoneTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
public class ViewController {

    @Autowired
    private SmartPhoneService smartPhoneService;
    @RequestMapping("/")
    public String startView(HttpServletRequest request , HttpServletResponse response){
        System.out.println("요청이들어와서 이미지를 불러옴");
        ArrayList<IPhoneTO> smartPhoneList = smartPhoneService.getIphoneList();
        HttpSession session = request.getSession();
        session.setAttribute("iphoneList" , smartPhoneList);
        return "main";
    }

    @RequestMapping(value = "/{viewName}")
    public String view(@PathVariable String viewName ) {
        System.out.println("요청한 JSP : " + "/" + viewName);
        return viewName;
    }

    @RequestMapping(value="/{pack}/{viewName}")
    public String packView(@PathVariable String pack, @PathVariable String viewName) {
        System.out.println("폴더 : "+pack+" "+" 요청한 JSP : "+viewName);
        return pack+"/"+viewName;
    }

}
