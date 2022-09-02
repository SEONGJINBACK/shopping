package com.seongjin.shopping.users.service;

import com.seongjin.shopping.users.to.BasketTO;
import com.seongjin.shopping.users.to.OrderTO;
import com.seongjin.shopping.users.to.UserTO;

import java.util.ArrayList;

public interface UserService {
    public ArrayList<UserTO> getUserDetailSearch(String id);

    public void setUserInsert(UserTO users);

    public ArrayList<UserTO> getUserLogin(String userId , String userPw);

    public UserTO PrivacyData(String id);

    public void UserUpdateData(String id ,String pw ,String address , String email ,String tel);

    public void UserDeleteAction(String id);

    public void setUserBasketData(String id, String productName, String productSize, String productAmount, String productTotalPrice);

    public ArrayList<BasketTO> getBasketList(String id);

    public void deleteBasketList(String id);

    public void insertOrderList(String id, String totalPrice);

    public ArrayList<OrderTO> getOrderList(String id);

    public ArrayList<OrderTO> getOrderListAll();

    public ArrayList<OrderTO> getDetailOrder(String orderNum);
}