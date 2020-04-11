package com.example.demo.rest;

import com.example.demo.entity.Customer;
import com.example.demo.repository.CustomerRepository;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("rest/customer")
public class CustomerController {
    @Autowired
    private CustomerRepository customerRepository;

    @GetMapping
    public Iterable<Customer> getAllCustomer() {
        return customerRepository.findAll();
    }

    @PostMapping
    public Customer createUser(@RequestBody Customer customer) {

        return customerRepository.save(customer);
    }
    @GetMapping("/login/{id}")
    public String login(@PathVariable int id, @RequestParam(required=false) String displayName){
        return "You (" + id + ", name: " + displayName +") just logged in";
    }
    @GetMapping("{id}")
    public Optional<Customer> getSpecificCustomer(@PathVariable int id) {
        return customerRepository.findById(id);
    }


    @DeleteMapping("all")
    private void deleteAllCustomer() {
        customerRepository.deleteAll();
    }

    @DeleteMapping("{id}")
    public void deleteCustomer(@PathVariable int id) {
        customerRepository.deleteById(id);
    }




}
