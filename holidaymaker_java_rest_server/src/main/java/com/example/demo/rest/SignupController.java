package com.example.demo.rest;

import com.example.demo.entity.Customer;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/signup")

public class SignupController {
    @Autowired
    private UserService userService;

    @PostMapping
    public Customer createUser(@RequestBody Customer customer) {

        //return customerRepository.save(customer);
        return userService.registerUser(customer);
    }

}
