package com.cpu.controller;

import com.cpu.model.User;
import com.cpu.service.UserCrudService;
import com.cpu.util.ObjectNullCheck;
import com.cpu.util.PageDecorator;
import com.cpu.util.PageUtil;
import com.cpu.util.Result;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

/**
* Created by song.
*/
@Controller
@RequestMapping("/user")
public class UserCrudController extends BaseController {

    @Resource
    UserCrudService userCrudService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String view(HttpServletRequest request){
        return "/user/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(String name, String password, HttpServletRequest request){
        Map<String,Object> data = new HashMap<String,Object>();
        data.put("errorMsg","用户名或者密码错");
        if(!(name.equals("qiye")||name.equals("yuanqu"))){
            return new ModelAndView("/user/login",data);
        }
        if(!password.equals("123456")){
            return new ModelAndView("/user/login",data);
        }
        if(name.equals("qiye")){
            request.getSession().setAttribute("user","企业客户");
        }else
            request.getSession().setAttribute("user","园区管理");

        return new ModelAndView("/index",data);
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request){
        request.getSession().invalidate();
        return "/user/login";
    }


    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public User view(@PathVariable java.lang.Integer id, HttpServletRequest request){
        return ObjectNullCheck.getNonNullObject(User.class, userCrudService.get(id));
    }

    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Result create(@RequestBody User user, HttpServletRequest request){
        int opId = userCrudService.add(user);
        return responseById(opId, "创建失败");
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public Result update(@PathVariable java.lang.Integer id, @RequestBody User user, HttpServletRequest request){
        int opId = userCrudService.update(user);
        return responseById(opId, "更新失败");
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public Result delete(@PathVariable java.lang.Integer id, HttpServletRequest request){
        int opId = userCrudService.delete(id);
        return responseById(opId, "删除失败");
    }

    @RequestMapping(value = "/list/{pageNum}", method = RequestMethod.GET)
    @ResponseBody
    public PageDecorator<User> viewList(@PathVariable int pageNum, String q, String asc, String desc, HttpServletRequest request/*,Model model*/){
        if(q!=null)
        q = URLDecoder.decode(q);
        final PageRequest pageRequest = new PageRequest(pageNum-1, PageUtil.PAGE_SIZE);
        PageDecorator pageDecorator = PageUtil.pageWrap(userCrudService.getList(pageRequest, q, asc, desc));
        return pageDecorator;
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String redirectAdd(){
        return "user/add";
    }
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String redirectEdit(){
        return "user/edit";
    }
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String redirectDelete(){
        return "user/delete";
    }
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String redirectList(){
        return "user/list";
    }
}
