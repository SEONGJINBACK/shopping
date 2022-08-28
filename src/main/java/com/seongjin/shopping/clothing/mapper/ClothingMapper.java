package com.seongjin.shopping.clothing.mapper;


import com.seongjin.shopping.clothing.to.TshirtTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface ClothingMapper {

    public ArrayList<TshirtTO> shirtList();
}
