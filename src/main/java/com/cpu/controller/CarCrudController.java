package com.cpu.controller;

import com.cpu.model.Car;
import com.cpu.service.CarCrudService;
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
@RequestMapping("/car")
public class CarCrudController extends BaseController {

    @Resource
    CarCrudService carCrudService;

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Car view(@PathVariable java.lang.Integer id, HttpServletRequest request){
        return ObjectNullCheck.getNonNullObject(Car.class, carCrudService.get(id));
    }

    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Result create(@RequestBody Car car, HttpServletRequest request){
        int opId = carCrudService.add(car);
        return responseById(opId, "创建失败");
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public Result update(@PathVariable java.lang.Integer id, @RequestBody Car car, HttpServletRequest request){
        int opId = carCrudService.update(car);
        return responseById(opId, "更新失败");
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public Result delete(@PathVariable java.lang.Integer id, HttpServletRequest request){
        int opId = carCrudService.delete(id);
        return responseById(opId, "删除失败");
    }

    @RequestMapping(value = "/list/{pageNum}", method = RequestMethod.GET)
    @ResponseBody
    public PageDecorator<Car> viewList(@PathVariable int pageNum, String q, String asc, String desc, HttpServletRequest request/*,Model model*/){
        if(q!=null)
        q = URLDecoder.decode(q);
        final PageRequest pageRequest = new PageRequest(pageNum-1, PageUtil.PAGE_SIZE);
        PageDecorator pageDecorator = PageUtil.pageWrap(carCrudService.getList(pageRequest, q, asc, desc));
        return pageDecorator;
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String redirectAdd(){
        return "car/add";
    }
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String redirectEdit(){
        return "car/edit";
    }
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String redirectDelete(){
        return "car/delete";
    }
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String redirectList(){
        return "car/list";
    }
}
