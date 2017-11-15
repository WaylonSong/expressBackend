package com.cpu.repository.hiber;

import com.cpu.model.User;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

/**
* Created by song.
*/
@Repository
    public interface UserRepository extends PagingAndSortingRepository<User, Integer> {
}
