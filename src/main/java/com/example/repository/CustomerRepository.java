package com.example.repository;

import com.example.model.CustomerDetails;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerRepository extends CrudRepository<CustomerDetails,Integer> {

    CustomerDetails findByCustomerAccountNumber(String accountNumber);
}
