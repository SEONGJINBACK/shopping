package com.seongjin.shopping.users.service;

import com.seongjin.shopping.users.to.UserTO;

import java.util.ArrayList;

public interface UserService {
    public ArrayList<UserTO> getUserDetailSearch(String id);

    public void setUserInsert(UserTO users);

    public ArrayList<UserTO> getUserLogin(String userId , String userPw);
}