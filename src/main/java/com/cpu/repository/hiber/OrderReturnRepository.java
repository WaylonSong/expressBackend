package com.cpu.repository.hiber;

import com.cpu.model.OrderReturn;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
* Created by song.
*/
@Repository
    public interface OrderReturnRepository extends PagingAndSortingRepository<OrderReturn, Integer> {
    public List<OrderReturn> findByNumber(String number);
}
