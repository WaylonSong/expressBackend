package com.cpu.dto;

import lombok.Data;

import java.util.List;

/**
 * Created by song on 2017/7/10.
 */
@Data
public class OrderDTO {
    Integer id;
    String number;//编号
    String productName;
    String count;
    String companyName;
    String state;
    List<Integer> itemIdList;
}
