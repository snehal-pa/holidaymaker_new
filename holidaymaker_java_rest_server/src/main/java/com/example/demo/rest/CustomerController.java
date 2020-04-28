package com.example.demo.rest;

import com.example.demo.entity.Customer;
import com.example.demo.repository.CustomerRepository;
import com.example.demo.service.SpringUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("rest/customer")
public class CustomerController {

    @Autowired
    private SpringUserService userService;

    @Autowired
    private CustomerRepository customerRepository;

    @GetMapping
    public Iterable<Customer> getAllCustomer() {
        return customerRepository.findAll();
    }

    @GetMapping("/{email}")
    public Customer getByEmail(@PathVariable String email) {

        Customer c = customerRepository.findByEmail(email);
//        if (c == null) {
//            throw new UsernameNotFoundException("Customer not found");
//        }
        return c;
    }

    @GetMapping("/currentuser")
    public Customer currentUser(){
        Customer c = userService.findCurrentUser();
        if(c!= null){
            return c;
        }
        return null;


    }


    @PostMapping
    public Customer createUser(@RequestBody Customer customer) {

        //return customerRepository.save(customer);
        return userService.registerUser(customer);
    }
//    @GetMapping("/login/{id}")
//    public String login(@PathVariable int id, @RequestParam(required=false) String displayName){
//        return "You (" + id + ", name: " + displayName +") just logged in";
//    }
//    @GetMapping("{id}")
//    public Optional<Customer> getSpecificCustomer(@PathVariable Long id) {
//        return customerRepository.findById(id);
//    }


    @DeleteMapping("all")
    private void deleteAllCustomer() {
        customerRepository.deleteAll();
    }

    @DeleteMapping("{id}")
    public void deleteCustomer(@PathVariable Long id) {
        customerRepository.deleteById(id);
    }




}
