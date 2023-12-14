package com.example.repository;

import com.example.model.CustomerStatement;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CustomerStatementRepository extends CrudRepository<CustomerStatement,Integer> {
    @Query("SELECT cs FROM CustomerStatement cs " +
            "JOIN cs.customerDetails cd " +
            "WHERE cd.customerId = :customerId " +
            "AND cs.action = 'verified'")
    List<CustomerStatement> findByCustomerIdAndStatusVerified(@Param("customerId") int customerId);
}
