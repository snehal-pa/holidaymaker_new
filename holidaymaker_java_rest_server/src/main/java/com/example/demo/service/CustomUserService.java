package com.example.demo.service;


import com.example.demo.entity.Customer;
import com.example.demo.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class CustomUserService {
    @Autowired
    private CustomerRepository customerRepository;
    private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
    private Customer currentUser;

    public Customer getCurrentUser() {
        return currentUser;
    }

    public Customer customLogin(Customer customer){
        Customer dbCustomer = customerRepository.findByEmail(customer.getEmail());
        if(dbCustomer == null) {return null;}
        else{
            System.out.println("found");
        }

        if (encoder.matches(customer.getPassword(),dbCustomer.getPassword())){
            System.out.println("found current customer");
            this.currentUser = dbCustomer;
            return dbCustomer;
        }
        return null;
    }
    public Customer logOut(){
        this.currentUser = null;
        return this.currentUser;
    }


    public Customer customRegister(Customer customer){
        Customer newCustomer = new Customer(customer.getFirstName(),customer.getLastName(),customer.getEmail(),encoder.encode(customer.getPassword()));
        return customerRepository.save(newCustomer);
    }
}
