package com.cpu.service;

import com.cpu.model.Car;
import com.cpu.repository.hiber.CarRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;

/**
* Created by song.
*/
@Service
public class CarCrudService extends BaseService{
    @Resource
    CarRepository carRepository;

    public int add(Car car) {
        try{
            return carRepository.save(car).getId();
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
    }

    public int update(Car car) {
        return add(car);
    }

    public int delete(Integer id) {
        try{
            carRepository.delete(id);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
    }

    public Car get(java.lang.Integer id) {
        return carRepository.findOne(id);
    }

    public Page<Car> getList(PageRequest pageRequest, String q) {
        return getList(pageRequest, q, null, null);
    }

    public Page<Car> getList(PageRequest pageRequest, String q, String asc, String desc) {
    //全文检索 优先使用fulltext索引 还可以利用lucence，like等
        return carRepository.findAll(pageRequest);
    }

}