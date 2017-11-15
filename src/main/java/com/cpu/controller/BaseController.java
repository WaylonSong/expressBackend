package com.cpu.controller;

import com.cpu.util.Result;

/**
 * Created by song on 2017/7/10.
 */
public class BaseController {
    protected Result success(Object data){
        Result result = new Result();
        result.setSuccess("success", data);
        return result;
    }
    protected Result error(String msg){
        Result result = new Result();
        result.setFailed(msg);
        return result;
    }

    protected <E> Result<E> newResult(int status, String message, E data){
        Result<E> result = new Result<E>();
        result.setStatus(status);
        result.setMessage(message);
        result.setData(data);
        return result;
    }

    protected Result responseById(int id, String msg){
        return id > 0?success(id):error(msg);
    }

}
