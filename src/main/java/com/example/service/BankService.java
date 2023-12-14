package com.example.service;

import com.example.model.BankDetails;

import java.util.List;

public interface BankService {
    BankDetails saveBankBranchDetails(BankDetails bankDetails);

    List<String> retrieveBankCode();

    List<BankDetails> findByBankCode(String bankCode);

}
