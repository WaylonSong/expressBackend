package com.cpu.dto;

import lombok.Data;

import java.util.Date;

/**
 * Created by song on 2017/7/18.
 */
@Data
public class OutStorageDTO {
    Integer id;
    String number;//编号
    String productName;
    String count;
    String description;
    String companyName;
    String mobile;
    String destination;
    String transTime;
    String state;
    Double price;
    Integer storageCubCount;
    String storageCubIds;
    String carNumbers;
    Date createTime;
}
