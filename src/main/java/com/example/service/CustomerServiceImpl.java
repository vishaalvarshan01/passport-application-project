package com.example.service;

import com.example.model.BankDetails;
import com.example.model.CustomerDetails;
import com.example.repository.BankRepository;
import com.example.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    CustomerRepository customerRepository;

    @Autowired
    BankRepository bankRepository;

    @Override
    public CustomerDetails saveCustomerDetails(CustomerDetails customerDetails) {
        List<BankDetails> bankDetailsList = bankRepository.findByBankBranch(customerDetails.getCustomer_BankBranch());
        BankDetails bankDetails = null;
        if (!bankDetailsList.isEmpty()) {
            bankDetails = bankDetailsList.get(0);
        }
        customerDetails.setBankDetails(bankDetails);
        System.out.println("from service: " + customerDetails);
        return customerRepository.save(customerDetails);
    }

    @Override
    public List<CustomerDetails> getAllCustomerDetails(){
        return (List<CustomerDetails>) customerRepository.findAll();
    }

    @Override
    public void deleteCustomerDetail(int id) {
        customerRepository.deleteById(id);
    }

    @Override
    public CustomerDetails getCustomerDetails(int id) {
        Optional<CustomerDetails> customerDetails = customerRepository.findById(id);
        return customerDetails.orElse(null);
    }

}
