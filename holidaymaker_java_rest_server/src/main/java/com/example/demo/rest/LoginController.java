package com.example.demo.rest;

import com.example.demo.entity.Customer;
import com.example.demo.service.CustomUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("")
public class LoginController {
    @Autowired
    private CustomUserService userService;

    @PostMapping("auth/login")
    public Customer loginUser(@RequestBody Customer customer) {
        return userService.customLogin(customer);
    }

    @GetMapping("/currentuser")
    public Customer getCurrentUser() {
        return userService.getCurrentUser();
    }

    @PostMapping("customsignup")
    public Customer createUser(@RequestBody Customer customer) {

        //return customerRepository.save(customer);
        return userService.customRegister(customer);
    }

    @GetMapping("/logout")
    public Customer logout(){
        return userService.logOut();
    }


}
