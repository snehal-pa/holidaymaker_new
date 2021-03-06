package com.example.demo.service;

import com.example.demo.entity.Customer;
import com.example.demo.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class SpringUserService {
    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private MyUserDetailsService myUserDetailsService;



    public Customer findCurrentUser() {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        Customer c =customerRepository.findByEmail(username);
        System.out.println("from findCurrentUser  " + c.getFirstName() + " " + c.getLastName());
        return c;
    }

    public Customer registerUser(Customer customer) {
        return myUserDetailsService.addCustomer(customer.getFirstName(),customer.getLastName(),customer.getEmail(),customer.getPassword());
    }


}