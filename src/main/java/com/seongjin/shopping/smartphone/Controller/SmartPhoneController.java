package com.seongjin.shopping.smartphone.Controller;


import com.seongjin.shopping.smartphone.service.SmartPhoneService;
import com.seongjin.shopping.smartphone.to.GalaxyTO;
import com.seongjin.shopping.smartphone.to.IPhoneTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("/smartphone/*")
public class SmartPhoneController {
    @Autowired
    private SmartPhoneService smartPhoneService;

    ModelMap map = null;


    @RequestMapping(value = "/iphoneDetailInfo" , method = RequestMethod.GET)
    public ModelMap SmartPhoneDetailInfo(HttpServletRequest request , HttpServletResponse response){

        String productName = request.getParameter("productName");

        map = new ModelMap();

        IPhoneTO smartPhoneDetail = smartPhoneService.getSmartPhoneDetail(productName);

        try {

            map.put("smartPhoneDetail",smartPhoneDetail);
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
