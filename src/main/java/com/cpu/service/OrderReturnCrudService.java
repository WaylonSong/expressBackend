package com.cpu.service;

import com.cpu.model.FinancialItem;
import com.cpu.model.OrderReturn;
import com.cpu.model.OrderT;
import com.cpu.repository.hiber.FinancialItemRepository;
import com.cpu.repository.hiber.OrderReturnRepository;
import com.cpu.repository.hiber.OrderTRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
* Created by song.
*/
@Service
public class OrderReturnCrudService extends BaseService{
    @Resource
    OrderReturnRepository orderReturnRepository;
    @Resource
    OrderTRepository orderTRepository;
    @Resource
    FinancialItemRepository financialItemRepository;
    public int add(OrderReturn orderReturn) {
        try{
            orderReturn.setNumber(orderReturn.getNumber().trim());
            List<OrderT> orderTList = orderTRepository.findByNumber(orderReturn.getNumber());
            if(orderTList == null||orderTList.get(0).getState().equals("退货中")||orderTList.get(0).getState().equals("已退货")){
                return -1;//订单没找到
            }
            orderTList.get(0).setState("退货中");
            orderReturn.setState("待处理");
            return orderReturnRepository.save(orderReturn).getId();
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
    }

    public int update(OrderReturn orderReturn) {
        orderReturn.setState("已确认");
        List<OrderT> orderTList = orderTRepository.findByNumber(orderReturn.getNumber());
        if(orderTList == null){
            return -1;//订单没找到
        }
        orderTList.get(0).setState("已退货");
        FinancialItem financialItem = new FinancialItem();
        financialItem.setNumber(orderReturn.getNumber());
        financialItem.setType("退货");
        financialItem.setPrice(0-orderTList.get(0).getPrice());
        financialItemRepository.save(financialItem);
        return orderReturnRepository.save(orderReturn).getId();
    }

    public int delete(Integer id) {
        try{
            orderReturnRepository.delete(id);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
    }

    public OrderReturn get(java.lang.Integer id) {
        return orderReturnRepository.findOne(id);
    }

    public Page<OrderReturn> getList(PageRequest pageRequest, String q) {
        return getList(pageRequest, q, null, null);
    }

    public Page<OrderReturn> getList(PageRequest pageRequest, String q, String asc, String desc) {
    //全文检索 优先使用fulltext索引 还可以利用lucence，like等
        return orderReturnRepository.findAll(pageRequest);
    }

}