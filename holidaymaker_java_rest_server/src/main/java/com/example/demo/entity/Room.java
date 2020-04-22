package com.example.demo.entity;

import javax.persistence.*;

@Entity
public class Room {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String type;

    @ManyToOne
    @JoinColumn(name = "hotelId",referencedColumnName = "hotelId",nullable = false)
    private Hotel hotel;

    private double price;
    private int rating;
    private int maxPeople;
    //private int maxKids;
    private boolean isBooked;
    private int image;
    @OneToOne(mappedBy = "room")
    private Booking booking;

    public Room(){}

    public int getImage() {
        return image;
    }

    public void setImage(int image) {
        this.image = image;

    }

    public int getId(){
        return id;
    }


    public String getType() {
        return type;
    }

    public Hotel getHotel() {
        return hotel;
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }

//    public Booking getBooking() {
//        return booking;
//    }
//
//    public void setBooking(Booking booking) {
//        this.booking = booking;
//    }

    public void setType(String type) {
        this.type = type;
    }

//    public String getLocation() {
//        return location;
//    }
//
//    public void setLocation(String location) {
//        this.location = location;
//    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public int getMaxPeople() {
        return maxPeople;
    }

    public void setMaxPeople(int maxPeople) {
        this.maxPeople = maxPeople;
    }

//    public int getMaxKids() {
//        return maxKids;
//    }
//
//    public void setMaxKids(int maxKids) {
//        this.maxKids = maxKids;
//    }

    public void setId(int id) {
        this.id = id;
    }

    public boolean isBooked() {
        return isBooked;
    }

    public void setBooked(boolean booked) {
        isBooked = booked;
    }


}
