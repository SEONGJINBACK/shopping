package com.seongjin.shopping.users.service;

import com.seongjin.shopping.users.mapper.UserMapper;
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
}
