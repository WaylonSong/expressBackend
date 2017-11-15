package com.cpu.controller;

import com.cpu.model.InStorage;
import com.cpu.service.InStorageCrudService;
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
@RequestMapping("/inStorage")
public class InStorageCrudController extends BaseController {

    @Resource
    InStorageCrudService inStorageCrudService;

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public InStorage view(@PathVariable java.lang.Integer id, HttpServletRequest request){
        return ObjectNullCheck.getNonNullObject(InStorage.class, inStorageCrudService.get(id));
    }

    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Result create(@RequestBody InStorage inStorage, HttpServletRequest request){
        inStorage.setNumber(SequenceFactory.getInStorageNumber());
        int opId = inStorageCrudService.add(inStorage);
        return responseById(opId, "创建失败");
    }

    //确认入库
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public Result update(@PathVariable java.lang.Integer id, @RequestBody InStorage inStorage, HttpServletRequest request){
        inStorage.setState("已处理");
        int opId = inStorageCrudService.confirm(inStorage);
        return responseById(opId, "更新失败");
    }

    //取消入库
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public Result delete(@PathVariable java.lang.Integer id,@RequestBody InStorage inStorage,  HttpServletRequest request){
        inStorage.setState("已取消");
        int opId = inStorageCrudService.cancel(inStorage);
        return responseById(opId, "删除失败");
    }

    @RequestMapping(value = "/list/{pageNum}", method = RequestMethod.GET)
    @ResponseBody
    public PageDecorator<InStorage> viewList(@PathVariable int pageNum, String q, String asc, String desc, HttpServletRequest request/*,Model model*/){
        if(q!=null)
        q = URLDecoder.decode(q);
        final PageRequest pageRequest = new PageRequest(pageNum-1, PageUtil.PAGE_SIZE);
        PageDecorator pageDecorator = PageUtil.pageWrap(inStorageCrudService.getList(pageRequest, q, asc, desc));
        return pageDecorator;
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String redirectAdd(){
        return "inStorage/add";
    }
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String redirectEdit(){
        return "inStorage/edit";
    }
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String redirectDelete(){
        return "inStorage/delete";
    }
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String redirectList(){
        return "inStorage/list";
    }
}
