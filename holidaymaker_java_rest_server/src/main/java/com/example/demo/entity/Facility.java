package com.example.demo.entity;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
public class Facility {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;

    @ManyToMany(mappedBy = "facilities",cascade = {CascadeType.ALL}, fetch = FetchType.LAZY)
    private Set<Hotel> hotels;

    public Facility() {
    }

//    public Set<Hotel> getHotels() {
//        return hotels;
//    }

    public void setHotels(Set<Hotel> hotels) {
        this.hotels = hotels;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
