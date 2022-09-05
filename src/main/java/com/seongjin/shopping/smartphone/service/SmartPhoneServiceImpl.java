package com.seongjin.shopping.smartphone.service;


import com.seongjin.shopping.smartphone.mapper.SmartPhoneMapper;
import com.seongjin.shopping.smartphone.to.GalaxyTO;
import com.seongjin.shopping.smartphone.to.IPhoneTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class SmartPhoneServiceImpl implements SmartPhoneService{

@Autowired
    private SmartPhoneMapper smartPhoneMapper;

@Override
public ArrayList<IPhoneTO> getIphoneList(){
    ArrayList<IPhoneTO> getIphoneList = smartPhoneMapper.selectAllIphoneList();
    return getIphoneList;
}

@Override
public IPhoneTO getSmartPhoneDetail(String productName){
    IPhoneTO getSmartPhoneDetail = smartPhoneMapper.selectSmartPhoneDetail(productName);
    return getSmartPhoneDetail;
}

}
