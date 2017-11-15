package com.cpu.service;

import com.cpu.model.OutStorage;
import com.cpu.repository.hiber.CarRepository;
import com.cpu.repository.hiber.OutStorageRepository;
import com.cpu.repository.hiber.StorageCubeRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
* Created by song.
*/
@Service
public class OutStorageCrudService extends BaseService{
    @Resource
    OutStorageRepository outStorageRepository;
    @Resource
    CarRepository carRepository;
    @Resource
    StorageCubeRepository storageCubeRepository;

    public int add(OutStorage outStorage) {
        try{
            return outStorageRepository.save(outStorage).getId();
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
    }

    public int update(OutStorage outStorage) {
        return add(outStorage);
    }

    public int delete(Integer id) {
        try{
            outStorageRepository.delete(id);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
    }

    public OutStorage get(java.lang.Integer id) {
        return outStorageRepository.findOne(id);
    }

    public Page<OutStorage> getList(PageRequest pageRequest, String q) {
        return getList(pageRequest, q, null, null);
    }

    public Page<OutStorage> getList(PageRequest pageRequest, String q, String asc, String desc) {
    //全文检索 优先使用fulltext索引 还可以利用lucence，like等
        return outStorageRepository.findAll(pageRequest);
    }

    public int cancel(OutStorage outStorage) {

        return 0;
    }
    @Transactional
    public int confirm(OutStorage outStorage) {
        if(outStorage.getCarNumbers().equals(""))
            return -1;
        String[] carNumbers = outStorage.getCarNumbers().split(",");
        for(String number : carNumbers){
            carRepository.findByNumber(number).get(0).setState("运输在途");
        }
        if(outStorage.getStorageCubIds()!=null&& !outStorage.getStorageCubIds().equals("")){
            String[] cubIds =  outStorage.getStorageCubIds().split(",");
            for(String id : cubIds){
                storageCubeRepository.findOne(Integer.parseInt(id)).setOccupy("可用");
            }
        }
        OutStorage outStorageDo = outStorageRepository.findOne(outStorage.getId());
        outStorageDo.setCarNumbers(outStorage.getCarNumbers());
        outStorageDo.setState("已处理");
        outStorageDo.getOrderT().setState("已出库");
        return 1;
    }
}