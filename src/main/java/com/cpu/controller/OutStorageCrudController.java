package com.cpu.controller;

import com.cpu.dto.OutStorageDTO;
import com.cpu.model.Car;
import com.cpu.model.OutStorage;
import com.cpu.repository.hiber.CarRepository;
import com.cpu.service.OutStorageCrudService;
import com.cpu.util.PageDecorator;
import com.cpu.util.PageUtil;
import com.cpu.util.Result;
import org.springframework.beans.BeanUtils;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.net.URLDecoder;
import java.util.List;

/**
* Created by song.
*/
@Controller
@RequestMapping("/outStorage")
public class OutStorageCrudController extends BaseController {

    @Resource
    OutStorageCrudService outStorageCrudService;
    @Resource
    CarRepository carRepository;

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public OutStorageDTO view(@PathVariable java.lang.Integer id, HttpServletRequest request){
        OutStorageDTO outStorageDTO = new OutStorageDTO();
        OutStorage outStorage = outStorageCrudService.get(id);
        if(outStorage != null)
            BeanUtils.copyProperties(outStorage, outStorageDTO);
        if(outStorage.getCarNumbers()==null||outStorage.getCarNumbers().equals("")){
            List<Car> carList = carRepository.findByState("可用");
            String carNumbers = "";
            for(Car car : carList){
                carNumbers += car.getNumber()+",";
            }
            if(carNumbers !="")
                outStorageDTO.setCarNumbers(carNumbers.substring(0, carNumbers.length()-1));
        }
        return outStorageDTO;
    }

    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Result create(@RequestBody OutStorage outStorage, HttpServletRequest request){
        int opId = outStorageCrudService.add(outStorage);
        return responseById(opId, "创建失败");
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public Result confirm(@PathVariable java.lang.Integer id, @RequestBody OutStorage outStorage, HttpServletRequest request){
        int opId = outStorageCrudService.confirm(outStorage);
        return responseById(opId, "可用车辆不足");
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public Result delete(@PathVariable java.lang.Integer id,@RequestBody OutStorage outStorage, HttpServletRequest request){
        outStorage.setState("已取消");
        int opId = outStorageCrudService.cancel(outStorage);
        return responseById(opId, "删除失败");
    }

    @RequestMapping(value = "/list/{pageNum}", method = RequestMethod.GET)
    @ResponseBody
    public PageDecorator<OutStorage> viewList(@PathVariable int pageNum, String q, String asc, String desc, HttpServletRequest request/*,Model model*/){
        if(q!=null)
        q = URLDecoder.decode(q);
        final PageRequest pageRequest = new PageRequest(pageNum-1, PageUtil.PAGE_SIZE);
        PageDecorator pageDecorator = PageUtil.pageWrap(outStorageCrudService.getList(pageRequest, q, asc, desc));
        return pageDecorator;
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String redirectAdd(){
        return "outStorage/add";
    }
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String redirectEdit(){
        return "outStorage/edit";
    }
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String redirectDelete(){
        return "outStorage/delete";
    }
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String redirectList(){
        return "outStorage/list";
    }
}
