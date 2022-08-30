package com.seongjin.shopping.smartphone.to;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class IPhoneTO {
    private String rowNum;
    private String rotNum;
    private String productName;
    private String productSize;
    private String productPrice;
    private String productColor;
    private String productImage;

}
