package com.cpu.controller;

import com.cpu.model.OrderT;
import com.cpu.service.OrderTCrudService;
import com.cpu.util.*;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.net.URLDecoder;

/**
* Created by song.
*/
@Controller
@RequestMapping("/orderT")
public class OrderTCrudController extends BaseController {

    @Resource
    OrderTCrudService orderTCrudService;

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public OrderT view(@PathVariable java.lang.Integer id, HttpServletRequest request){
        return ObjectNullCheck.getNonNullObject(OrderT.class, orderTCrudService.get(id));
    }

    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Result create(@RequestBody OrderT orderT, HttpServletRequest request){
        orderT.setState("待处理");
        orderT.setNumber(SequenceFactory.getOrderNumber());
        int opId = orderTCrudService.add(orderT);
        return responseById(opId, "创建失败");
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    @ResponseBody
    //处理订单根据库存量生成出库单
    public Result update(@PathVariable java.lang.Integer id, @RequestBody OrderT orderT, HttpServletRequest request){
//        orderT.setState("已处理");
        int opId = orderTCrudService.confirm(orderT);
        return responseById(opId, "库位不足");
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public Result delete(@PathVariable java.lang.Integer id, @RequestBody OrderT orderT, HttpServletRequest request){
        orderT.setState("已取消");
        int opId = orderTCrudService.update(orderT);
        return responseById(opId, "删除失败");
    }

    @RequestMapping(value = "/list/{pageNum}", method = RequestMethod.GET)
    @ResponseBody
    public PageDecorator<OrderT> viewList(@PathVariable int pageNum, String q, String asc, String desc, HttpServletRequest request/*,Model model*/){
        if(q!=null)
        q = URLDecoder.decode(q);
        final PageRequest pageRequest = new PageRequest(pageNum-1, PageUtil.PAGE_SIZE);
        PageDecorator pageDecorator = PageUtil.pageWrap(orderTCrudService.getList(pageRequest, q, asc, desc));
        return pageDecorator;
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String redirectAdd(){
        return "orderT/add";
    }
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String redirectEdit(){
        return "orderT/edit";
    }
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String redirectDelete(){
        return "orderT/delete";
    }
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String redirectList(){
        return "orderT/list";
    }
}
