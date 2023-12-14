package com.example.service;

import com.example.model.CustomerDetails;
import com.example.model.CustomerStatement;
import com.example.repository.CustomerRepository;
import com.example.repository.CustomerStatementRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CustomerStatementServiceImpl implements CustomerStatementService{

    @Autowired
    CustomerStatementRepository customerStatementRepository;

    @Autowired
    CustomerRepository customerRepository;

    @Override
    public List<CustomerStatement> getAllCustomerStatement() {
        return (List<CustomerStatement>) customerStatementRepository.findAll();
    }

    @Override
    public boolean verifyCustomerChecks(int statementId) {
        Optional<CustomerStatement> _statement = customerStatementRepository.findById(statementId);
        CustomerStatement statement = null;
        if(_statement.isPresent()){
            statement = _statement.get();
            statement.setAction("verified");
            CustomerDetails customerDetails = customerRepository.findByCustomerAccountNumber(statement.getAccountNumber());

            double balance = customerDetails.getBalance();
            if(statement.getType().equals("credit")){
                balance += statement.getAmount();
            }else{
                balance -= statement.getAmount();
            }
            customerDetails.setBalance(balance);

            customerRepository.save(customerDetails);
            customerStatementRepository.save(statement);
            return true;
        }
        return false;
    }

    @Override
    public List<CustomerStatement> getCustomerStatement(int customerId) {
        return customerStatementRepository.findByCustomerIdAndStatusVerified(customerId);
    }
}
