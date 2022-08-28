package com.seongjin.shopping.clothing.to;


import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class TshirtTO {
    private String rowNum;
    private String rotNum;
    private String productName;
    private String productSize;
    private String productColor;
    private String productPrice;
    private String productImage;
}
