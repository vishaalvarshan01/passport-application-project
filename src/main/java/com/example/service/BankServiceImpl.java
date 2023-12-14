package com.example.service;

import com.example.model.BankDetails;
import com.example.repository.BankRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BankServiceImpl implements BankService{

    @Autowired
    BankRepository bankRepository;
    @Override
    public BankDetails saveBankBranchDetails(BankDetails bankDetails) {
        return bankRepository.save(bankDetails);
    }

    @Override
    public List<String> retrieveBankCode() {
        List<BankDetails> bankDetailsList = (List<BankDetails>) bankRepository.findAll();
        List<String> bankCodes = new ArrayList<>();

        for (BankDetails bankDetails : bankDetailsList) {
            bankCodes.add(bankDetails.getBankBranch());
        }

        return bankCodes;
    }

    @Override
    public List<BankDetails> findByBankCode(String bankCode) {
        return bankRepository.findByBankBranch(bankCode);
    }

}
