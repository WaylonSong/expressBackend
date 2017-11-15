package com.cpu.repository.hiber;

import com.cpu.model.FinancialItem;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
* Created by song.
*/
@Repository
    public interface FinancialItemRepository extends PagingAndSortingRepository<FinancialItem, Integer> {
    List<FinancialItem> findByNumber(String number);
}
