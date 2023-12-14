package com.example.repository;

import com.example.model.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends CrudRepository<User,Integer> {

    @Query("SELECT COUNT(u) > 0 FROM User u WHERE u.email = ?1 AND u.password = ?2")
    boolean existsByEmailAndPassword(String email, String password);

    @Query("SELECT u FROM User u WHERE u.email = ?1")
    User findUserByEmail(String email);

}
