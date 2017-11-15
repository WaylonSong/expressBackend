package com.cpu.controller;

import com.cpu.repository.hiber.OrderTRepository;
import com.cpu.service.OrderTCrudService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
* Created by song.
*/
@Controller
@RequestMapping("/statistics")
public class OrderStatisticsController extends BaseController {

    @Resource
    OrderTCrudService orderTCrudService;
    @Resource
    OrderTRepository orderTRepository;

    @RequestMapping(value = "/api/dailyOrder", method = RequestMethod.GET)
    @ResponseBody
    public List dailyOrder(HttpServletRequest request){

        List list = orderTRepository.dailyCount(oneWeekAgo());
        return list;
    }
    @RequestMapping(value = "/dailyOrder", method = RequestMethod.GET)
    public String dailyOrderPage(HttpServletRequest request){
        return "/statistics/dailyOrder";
    }
    @RequestMapping(value = "/api/locationDistribution", method = RequestMethod.GET)
    @ResponseBody
    public List locationDistribution(HttpServletRequest request){
        List list = orderTRepository.locationCount(oneWeekAgo());
        return list;
    }
    @RequestMapping(value = "/locationDistribution", method = RequestMethod.GET)
    public String locationDistributionPage(HttpServletRequest request){
        return "/statistics/locationDistribution";
    }

    private Date oneWeekAgo(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        cal.add(Calendar.DAY_OF_MONTH, -7);
        return cal.getTime();
    }
}
