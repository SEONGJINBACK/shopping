package com.seongjin.shopping.users.service;

import com.seongjin.shopping.users.mapper.UserMapper;
import com.seongjin.shopping.users.to.BasketTO;
import com.seongjin.shopping.users.to.OrderTO;
import com.seongjin.shopping.users.to.UserTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public ArrayList<UserTO> getUserDetailSearch(String id){
        System.out.println("서비스 호출");
        ArrayList<UserTO> datalist = userMapper.doubleCheck(id);
        return datalist;
    }
    @Override
    public void setUserInsert(UserTO users){
        userMapper.userInsert(users);
    }
    @Override
    public ArrayList<UserTO> getUserLogin(String userId , String userPw){
        ArrayList<UserTO> userLoginAction = userMapper.userLogin(userId,userPw);
        return userLoginAction;
    }
    @Override
    public UserTO PrivacyData(String id){
        UserTO userPrivacyData = userMapper.privacyData(id);
        return userPrivacyData;
    }

    @Override
    public void UserUpdateData(String id ,String pw ,String address, String email ,String tel){
        userMapper.updateData(id , pw , address , email , tel);
    }

    @Override
    public void UserDeleteAction(String id){
        userMapper.deleteData(id);
    }


    @Override
    public void setUserBasketData(String id, String productName, String productSize, String productAmount, String productTotalPrice){
        userMapper.insertBasketData(id,productName,productSize,productAmount,productTotalPrice);
    }

    @Override
    public ArrayList<BasketTO> getBasketList(String id){
        ArrayList<BasketTO> basketList = userMapper.selectBasketList(id);
        return basketList;
    }

    @Override
    public void deleteBasketList(String id){
        userMapper.deleteBasketList(id);
    }


    @Override
    public void insertOrderList(String id, String totalPrice){
        userMapper.insertOrderList(id,totalPrice);
    }

    @Override
    public ArrayList<OrderTO> getOrderListAll(){
        ArrayList<OrderTO> orderListAll = userMapper.selectOrderListAll();
        return orderListAll;
    }
    @Override
    public ArrayList<OrderTO> getOrderList(String id){
        ArrayList<OrderTO> orderList = userMapper.selectOrderList(id);
        return orderList;
    }

    @Override
    public ArrayList<OrderTO> getDetailOrder(String orderNum){
        ArrayList<OrderTO> detailOrder = userMapper.detailOrder(orderNum);
        return detailOrder;
    }
}
