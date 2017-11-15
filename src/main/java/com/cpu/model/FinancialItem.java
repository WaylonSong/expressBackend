package com.cpu.model;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by song on 2017/7/24.
 */
@Data
@Entity
public class FinancialItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;
    String number;//编号
    Double price;
    String type;
    @Column(columnDefinition = "TIMESTAMP")
    Date createTime;

}
