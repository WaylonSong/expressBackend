package com.cpu.repository.hiber;

import com.cpu.model.OrderT;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
* Created by song.
*/
@Repository
public interface OrderTRepository extends PagingAndSortingRepository<OrderT, Integer> {

//    @Query(value = "select sum(storage_cub_count) from OrderT where TO_DAYS(NOW())-TO_DAYS(create_time) <=7 group by date_format(create_time, '%Y-%m-%d')")
//    List sumCountByDate();


    @Query(value = "select count(id),date_format(create_time, '%Y-%m-%d') from OrderT where createTime >= ?1 group by date_format(create_time, '%Y-%m-%d')")
    List dailyCount(Date time);
    @Query(value = "select count(id),destination from OrderT where createTime >= ?1 group by destination")
    List locationCount(Date date);
    public List<OrderT> findByNumber(String number);
}
