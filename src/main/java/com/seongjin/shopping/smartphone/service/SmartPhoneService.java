package com.seongjin.shopping.smartphone.service;

import com.seongjin.shopping.smartphone.to.GalaxyTO;
import com.seongjin.shopping.smartphone.to.IPhoneTO;

import java.util.ArrayList;

public interface SmartPhoneService {
    public ArrayList<IPhoneTO> getIphoneList();

    public IPhoneTO getSmartPhoneDetail(String productName);

}
