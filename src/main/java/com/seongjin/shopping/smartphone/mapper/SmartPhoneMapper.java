package com.seongjin.shopping.smartphone.mapper;

import com.seongjin.shopping.smartphone.to.IPhoneTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface SmartPhoneMapper {

    public ArrayList<IPhoneTO> selectAllIphoneList();

    public IPhoneTO selectSmartPhoneDetail(String productName);
}
