package com.cpu.service;

import com.cpu.model.FinancialItem;
import com.cpu.repository.hiber.FinancialItemRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;

/**
* Created by song.
*/
@Service
public class FinancialItemCrudService extends BaseService{
    @Resource
    FinancialItemRepository financialItemRepository;

    public int add(FinancialItem financialItem) {
        try{
            return financialItemRepository.save(financialItem).getId();
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
    }

    public int update(FinancialItem financialItem) {
        return add(financialItem);
    }

    public int delete(Integer id) {
        try{
            financialItemRepository.delete(id);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
    }

    public FinancialItem get(java.lang.Integer id) {
        return financialItemRepository.findOne(id);
    }

    public Page<FinancialItem> getList(PageRequest pageRequest, String q) {
        return getList(pageRequest, q, null, null);
    }

    public Page<FinancialItem> getList(PageRequest pageRequest, String q, String asc, String desc) {
    //全文检索 优先使用fulltext索引 还可以利用lucence，like等
        return financialItemRepository.findAll(pageRequest);
    }

}