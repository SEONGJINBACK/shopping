package com.seongjin.shopping.users.to;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class OrderTO {

    private String orderNum;
    private String userId;
    private String orderDate;
    private String orderTotalPrice;
    private String orderSuccess;
    private String deliveryInfo;

}
