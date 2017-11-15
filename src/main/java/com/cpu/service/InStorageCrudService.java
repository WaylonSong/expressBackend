package com.cpu.service;

import com.cpu.model.InStorage;
import com.cpu.model.OutStorage;
import com.cpu.repository.hiber.InStorageRepository;
import com.cpu.repository.hiber.OutStorageRepository;
import com.cpu.repository.hiber.StorageCubeRepository;
import com.cpu.util.SequenceFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
* Created by song.
*/
@Service
public class InStorageCrudService extends BaseService{
    @Resource
    InStorageRepository inStorageRepository;
    @Resource
    StorageCubeRepository storageCubeRepository;
    @Resource
    OutStorageRepository outStorageRepository;

    public int add(InStorage inStorage) {
        try{
            return inStorageRepository.save(inStorage).getId();
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
    }

    public int update(InStorage inStorage) {
        return add(inStorage);
    }

    @Transactional
    public int cancel(InStorage inStorage) {
        String[] occupiedCubeIds;
        if(inStorage.getStorageCubIds() != null){
            occupiedCubeIds = inStorage.getStorageCubIds().split(",");
            for(String idStr : occupiedCubeIds){
                storageCubeRepository.findOne(Integer.parseInt(idStr)).setOccupy("可用");
            }
        }
        inStorage.setStorageCubIds("");
        return update(inStorage);
    }

    public int delete(Integer id) {
        try{
            inStorageRepository.delete(id);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
    }

    public InStorage get(java.lang.Integer id) {
        return inStorageRepository.findOne(id);
    }

    public Page<InStorage> getList(PageRequest pageRequest, String q) {
        return getList(pageRequest, q, null, null);
    }

    public Page<InStorage> getList(PageRequest pageRequest, String q, String asc, String desc) {
    //全文检索 优先使用fulltext索引 还可以利用lucence，like等
        return inStorageRepository.findAll(pageRequest);
    }

    @Transactional
    public int confirm(InStorage inStorage) {
        InStorage inStorageDo = inStorageRepository.findOne(inStorage.getId());
        inStorage.setState("已处理");
        inStorageDo.getOrderT().setState("已入库");
        OutStorage outStorage = new OutStorage();
        BeanUtils.copyProperties(inStorageDo, outStorage);
        outStorage.setNumber(SequenceFactory.getOutStorageNumber());
        outStorage.setState("待处理");
        outStorage.setOrderT(inStorageDo.getOrderT());
        outStorageRepository.save(outStorage);
        return inStorageRepository.save(inStorage).getId();
    }
}