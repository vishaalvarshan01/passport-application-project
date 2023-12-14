package com.example.service;

import com.example.model.BankDetails;
import com.example.model.CustomerDetails;

import java.util.List;
import java.util.Optional;

public interface CustomerService {

    CustomerDetails saveCustomerDetails(CustomerDetails customerDetails);

    List<CustomerDetails> getAllCustomerDetails();

    void deleteCustomerDetail(int id);

    CustomerDetails getCustomerDetails(int id);
}
