package com.seongjin.shopping.users.mapper;

import com.seongjin.shopping.users.to.BasketTO;
import com.seongjin.shopping.users.to.OrderTO;
import com.seongjin.shopping.users.to.UserTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface UserMapper {

   public ArrayList<UserTO> doubleCheck(String id);

   public void userInsert(UserTO users);

   public ArrayList<UserTO> userLogin(String userId , String userPw);

   public UserTO privacyData(String id);

   public void updateData(String id ,String pw ,String address , String email ,String tel);

   public void deleteData(String id);

   public void insertBasketData(String id, String productName, String productSize, String productAmount, String productTotalPrice);

   public ArrayList<BasketTO> selectBasketList(String id);

   public void deleteBasketList(String id);

   public void insertOrderList(String id, String totalPrice);

   public ArrayList<OrderTO> selectOrderList(String id);
}
