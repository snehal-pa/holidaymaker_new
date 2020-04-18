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

    public Facility() {
    }

    @ManyToMany(mappedBy = "facilities",cascade = {CascadeType.ALL})
    private Set<Hotel> hotels;

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
