package com.seongjin.shopping.users.mapper;

import com.seongjin.shopping.users.to.UserTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface UserMapper {

   public ArrayList<UserTO> doubleCheck(String id);

   public void userInsert(UserTO users);

   public ArrayList<UserTO> userLogin(String userId , String userPw);
}
