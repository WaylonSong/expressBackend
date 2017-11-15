package com.cpu.service;

import com.cpu.model.User;
import com.cpu.repository.hiber.UserRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;

/**
* Created by song.
*/
@Service
public class UserCrudService extends BaseService{
    @Resource
    UserRepository userRepository;

    public int add(User user) {
        try{
            return userRepository.save(user).getId();
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
    }

    public int update(User user) {
        return add(user);
    }

    public int delete(Integer id) {
        try{
            userRepository.delete(id);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
    }

    public User get(java.lang.Integer id) {
        return userRepository.findOne(id);
    }

    public Page<User> getList(PageRequest pageRequest, String q) {
        return getList(pageRequest, q, null, null);
    }

    public Page<User> getList(PageRequest pageRequest, String q, String asc, String desc) {
    //全文检索 优先使用fulltext索引 还可以利用lucence，like等
        return userRepository.findAll(pageRequest);
    }

}