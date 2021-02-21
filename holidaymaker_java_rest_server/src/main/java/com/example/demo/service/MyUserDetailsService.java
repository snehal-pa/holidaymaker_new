package com.example.demo.service;

import com.example.demo.entity.Customer;
import com.example.demo.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;

@Service
public class MyUserDetailsService implements UserDetailsService {

    private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
    public BCryptPasswordEncoder getEncoder(){
        return encoder;
    }

    @Autowired
    CustomerRepository customerRepository;

//    @PostConstruct
//    private void addDefaultCustomer(){
//        Customer exist = customerRepository.findByEmail("se@gmail.com");
//        if(exist != null){
//            return;
//        }
//        Customer c = new Customer("Sia","svensoon","se@gmail.com",getEncoder().encode("hi"));
//        try {
//            customerRepository.save(c);
//        }catch (Exception ex){
//            ex.printStackTrace();
//        }
//    }

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        Customer customer = customerRepository.findByEmail(s);
        if(customer == null){
            throw new UsernameNotFoundException("Login failed");
        }
        System.out.println("logged in");
        System.out.println(customer.getFirstName() + "  " +customer.getLastName());
        return toCustomerDetails(customer);
    }

    private UserDetails toCustomerDetails(Customer customer){
        return org.springframework.security.core.userdetails.User.withUsername(customer.getEmail())
                .password(customer.getPassword())
                .roles("USER")
                .build();
    }

    public Customer addCustomer(String firstName, String lastName,String email, String password){
        Customer c= new Customer(firstName,lastName,email, encoder.encode(password));
        try {
            return customerRepository.save(c);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}
