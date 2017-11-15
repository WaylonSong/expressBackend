package com.cpu.repository.hiber;

import com.cpu.model.Car;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
* Created by song.
*/
@Repository
public interface CarRepository extends PagingAndSortingRepository<Car, Integer> {
    public List<Car> findByNumber(String number);
    public List<Car> findByState(String state);
}
