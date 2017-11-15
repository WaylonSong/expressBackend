package com.cpu.service;

import com.cpu.model.FinancialItem;
import com.cpu.model.InStorage;
import com.cpu.model.OrderT;
import com.cpu.model.StorageCube;
import com.cpu.repository.hiber.FinancialItemRepository;
import com.cpu.repository.hiber.InStorageRepository;
import com.cpu.repository.hiber.OrderTRepository;
import com.cpu.repository.hiber.StorageCubeRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
* Created by song.
*/
@Service
public class OrderTCrudService extends BaseService{
    @Resource
    OrderTRepository orderTRepository;

    @Resource
    StorageCubeRepository cubeRepository;

    @Resource
    InStorageRepository inStorageRepository;

    @Resource
    FinancialItemRepository financialItemRepository;
//    @Resource
//    StorageCubeRepository cubeRepository;

    @Transactional
    public int add(OrderT orderT) {
        if(confirm(orderT) == -1) {
            orderT.setState("待处理");
            return orderTRepository.save(orderT).getId();
        }
        return 1;
    }

    @Transactional
    public int confirm(OrderT orderT) {
        try{
            if(orderT.getState().equals("已出库")){
                orderT.setState("已收货");
                return orderTRepository.save(orderT).getId();
            }

            List<StorageCube> availableCube = cubeRepository.findByOccupy("可用");
            if(availableCube.size() >= orderT.getStorageCubCount()) {
                InStorage inStorage = new InStorage();
                BeanUtils.copyProperties(orderT, inStorage);
                String cubIds = "";
                for(int i = 0; i < orderT.getStorageCubCount();i++){
                    availableCube.get(i).setOccupy("占用");
                    cubIds += availableCube.get(i).getId()+",";
                }
                orderT.setState("等待入库");
                FinancialItem financialItem = new FinancialItem();
                financialItem.setNumber(orderT.getNumber());
                financialItem.setType("收入");
                financialItem.setPrice(orderT.getPrice());
                financialItemRepository.save(financialItem);
                inStorage.setState("待处理");
                inStorage.setOrderT(orderT);
                inStorage.setStorageCubIds(cubIds.substring(0, cubIds.length()-1));
                inStorageRepository.save(inStorage);
                return orderTRepository.save(orderT).getId();
            }else
                return -1;
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
    }

    public int delete(Integer id) {
        try{
            orderTRepository.delete(id);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
    }

    public OrderT get(java.lang.Integer id) {
        return orderTRepository.findOne(id);
    }

    public Page<OrderT> getList(PageRequest pageRequest, String q) {
        return getList(pageRequest, q, null, null);
    }

    public Page<OrderT> getList(PageRequest pageRequest, String q, String asc, String desc) {
    //全文检索 优先使用fulltext索引 还可以利用lucence，like等
        return orderTRepository.findAll(pageRequest);
    }

    public int update(OrderT orderT) {
        try{
            orderTRepository.save(orderT);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
    }
}