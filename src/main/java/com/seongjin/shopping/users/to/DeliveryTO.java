package com.seongjin.shopping.users.to;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class DeliveryTO {
    private String deliveryNum;
    private String orderNum;
    private String userId;
    private String orderDate;
    private String orderTotalPrice;
    private String orderSuccess;
    private String deliveryCom;
    private String postNum;
    private String deliveryInfo;
}
