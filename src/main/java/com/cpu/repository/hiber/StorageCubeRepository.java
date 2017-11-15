package com.cpu.repository.hiber;

import com.cpu.model.StorageCube;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
* Created by song.
*/
@Repository
public interface StorageCubeRepository extends PagingAndSortingRepository<StorageCube, Integer> {
    public List<StorageCube> findByOccupy(String occupy);
}
