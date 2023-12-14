package com.example.service;

import com.example.model.BankDetails;
import com.example.model.User;

public interface UserService {

    String loginValidation(User user);

    String changePassword(String email ,String newPassword, String oldPassword);
}
