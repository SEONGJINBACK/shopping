package com.seongjin.shopping.sys.Controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {

    @RequestMapping("/")
    public String startView(){
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
