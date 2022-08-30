package com.seongjin.shopping.users.to;


import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class BasketTO {
    private String userId;
    private String productName;
    private String productSize;
    private String productAmount;
    private String productTotalPrice;
}
