package com.example.service;

import com.example.model.BankDetails;
import com.example.model.User;
import com.example.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    UserRepository userRepository;

    @Override
    public String loginValidation(User user) {
        boolean foundUser = userRepository.existsByEmailAndPassword(user.getEmail(),user.getPassword());
        if(foundUser){
            return "found";
        }
        return "notFound";
    }

    @Override
    public String changePassword(String email, String newPassword, String oldPassword) {

        User user = userRepository.findUserByEmail(email);
        if(!user.getEmail().equals(email)){
            return "user not found in database";
        }
        if(!newPassword.equals(oldPassword)){
            return "passwords do not match";
        }
        user.setPassword(newPassword);
        userRepository.save(user);
        return "success";
    }


}
