package com.seongjin.shopping.clothing.service;

import com.seongjin.shopping.clothing.mapper.ClothingMapper;
import com.seongjin.shopping.clothing.to.TshirtTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class ClothingServiceImpl implements ClothingService {

    @Autowired
    private ClothingMapper clothingMapper;


    @Override
    public ArrayList<TshirtTO> getShirtList(){
        ArrayList<TshirtTO> list = clothingMapper.shirtList();
        return list;
    }

}
