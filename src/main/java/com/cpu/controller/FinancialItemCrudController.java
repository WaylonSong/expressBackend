package com.cpu.controller;

import com.cpu.model.FinancialItem;
import com.cpu.service.FinancialItemCrudService;
import com.cpu.util.ObjectNullCheck;
import com.cpu.util.PageDecorator;
import com.cpu.util.PageUtil;
import com.cpu.util.Result;
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
@RequestMapping("/financialItem")
public class FinancialItemCrudController extends BaseController {

    @Resource
    FinancialItemCrudService financialItemCrudService;

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public FinancialItem view(@PathVariable java.lang.Integer id, HttpServletRequest request){
        return ObjectNullCheck.getNonNullObject(FinancialItem.class, financialItemCrudService.get(id));
    }

    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Result create(@RequestBody FinancialItem financialItem, HttpServletRequest request){
        int opId = financialItemCrudService.add(financialItem);
        return responseById(opId, "创建失败");
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public Result update(@PathVariable java.lang.Integer id, @RequestBody FinancialItem financialItem, HttpServletRequest request){
        int opId = financialItemCrudService.update(financialItem);
        return responseById(opId, "更新失败");
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public Result delete(@PathVariable java.lang.Integer id, HttpServletRequest request){
        int opId = financialItemCrudService.delete(id);
        return responseById(opId, "删除失败");
    }

    @RequestMapping(value = "/list/{pageNum}", method = RequestMethod.GET)
    @ResponseBody
    public PageDecorator<FinancialItem> viewList(@PathVariable int pageNum, String q, String asc, String desc, HttpServletRequest request/*,Model model*/){
        if(q!=null)
        q = URLDecoder.decode(q);
        final PageRequest pageRequest = new PageRequest(pageNum-1, PageUtil.PAGE_SIZE);
        PageDecorator pageDecorator = PageUtil.pageWrap(financialItemCrudService.getList(pageRequest, q, asc, desc));
        return pageDecorator;
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String redirectAdd(){
        return "financialItem/add";
    }
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String redirectEdit(){
        return "financialItem/edit";
    }
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String redirectDelete(){
        return "financialItem/delete";
    }
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String redirectList(){
        return "financialItem/list";
    }
}
