package com.cpu.model;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by song on 2017/7/10.
 */

@Entity
@Data
public class InStorage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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
    @Column(columnDefinition = "TIMESTAMP")
    Date createTime;
    @OneToOne
    OrderT orderT;
}
