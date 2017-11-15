package com.cpu.model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * Created by song on 2017/7/13.
 */
@Entity
@Data
public class Car {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;
    String number;
    String driver;
    String capacity;
    String description;
    String state;
    String createTime;
}
