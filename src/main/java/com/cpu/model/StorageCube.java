package com.cpu.model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * Created by song on 2017/7/12.
 */
@Entity
@Data
public class StorageCube {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;
    String occupy;
}
