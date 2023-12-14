package com.example.service;

import com.example.model.CustomerStatement;

import java.util.List;

public interface CustomerStatementService {

    List<CustomerStatement> getAllCustomerStatement();

    boolean verifyCustomerChecks(int statementId);

    List<CustomerStatement> getCustomerStatement(int customerId);
}
