package com.example.demo.entity;

import javax.persistence.*;
import java.sql.Date;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

@Entity
public class Booking {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne
    @JoinColumn(name = "custId",referencedColumnName = "id",nullable = false)
    private Customer customer;
    //private int custId;
    @OneToOne
    @JoinColumn(name = "roomId", referencedColumnName ="id",nullable = false)
    private Room room;
    //private int roomId;
    private LocalDate check_in;
    private LocalDate check_out;
    private double totalPrice;

    private String addition;

    public  Booking(){}

    public int daysOfStaying(){
        return (int) ChronoUnit.DAYS.between(check_in,check_out);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public LocalDate getCheck_in() {
        return check_in;
    }

    public void setCheck_in(LocalDate check_in) {
        this.check_in = check_in;
    }

    public LocalDate getCheck_out() {
        return check_out;
    }

    public void setCheck_out(LocalDate check_out) {
        this.check_out = check_out;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getAddition() {
        return addition;
    }

    public void setAddition(String addition) {
        this.addition = addition;
    }
}
