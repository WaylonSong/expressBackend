package com.cpu.repository.hiber;

import com.cpu.model.InStorage;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

/**
* Created by song.
*/
@Repository
    public interface InStorageRepository extends PagingAndSortingRepository<InStorage, Integer> {
}
