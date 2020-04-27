package com.example.demo.rest;

import com.example.demo.entity.Customer;
import com.example.demo.service.SpringUserService;
import com.example.demo.service.CustomUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/signup")

public class SignupController {
    @Autowired
    private SpringUserService userService;
    private CustomUserService userService2;

    @PostMapping
    public Customer createUser(@RequestBody Customer customer) {

        //return customerRepository.save(customer);
        return userService.registerUser(customer);
    }


}
