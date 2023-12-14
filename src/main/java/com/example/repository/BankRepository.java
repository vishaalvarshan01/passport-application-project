package com.example.repository;

import com.example.model.BankDetails;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BankRepository extends CrudRepository<BankDetails, Integer> {

    @Query("SELECT b FROM BankDetails b WHERE b.bankBranch = :branch")
    List<BankDetails> findByBankBranch(@Param("branch") String branch);

}
