package com.seongjin.shopping.users.to;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class UserTO {
    private String userId;
    private String password;
    private String confirmPw;
    private String names;
    private String address;
    private String tel;
    private String email;
    private String birthday;
}
