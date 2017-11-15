package com.cpu.repository.hiber;

import com.cpu.model.OutStorage;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

/**
* Created by song.
*/
@Repository
    public interface OutStorageRepository extends PagingAndSortingRepository<OutStorage, Integer> {
}
