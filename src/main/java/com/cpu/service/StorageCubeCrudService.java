package com.cpu.service;

import com.cpu.model.StorageCube;
import com.cpu.repository.hiber.StorageCubeRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;

/**
* Created by song.
*/
@Service
public class StorageCubeCrudService extends BaseService{
    @Resource
    StorageCubeRepository storageCubeRepository;

    public int add(StorageCube storageCube) {
        try{
            return storageCubeRepository.save(storageCube).getId();
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
    }

    public int update(StorageCube storageCube) {
        return add(storageCube);
    }

    public int delete(Integer id) {
        try{
            storageCubeRepository.delete(id);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
    }

    public StorageCube get(java.lang.Integer id) {
        return storageCubeRepository.findOne(id);
    }

    public Page<StorageCube> getList(PageRequest pageRequest, String q) {
        return getList(pageRequest, q, null, null);
    }

    public Page<StorageCube> getList(PageRequest pageRequest, String q, String asc, String desc) {
    //全文检索 优先使用fulltext索引 还可以利用lucence，like等
        return storageCubeRepository.findAll(pageRequest);
    }

}