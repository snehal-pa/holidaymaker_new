package com.example.demo.entity;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
public class Hotel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int hotelId;
    private String name;
    private String location;

    @OneToMany(mappedBy = "hotel")
    private Set<Room> rooms;

    @ManyToMany(cascade = {CascadeType.ALL},fetch= FetchType.EAGER)
    @JoinTable(
            name="Hotel_facility",
            joinColumns = {
                    @JoinColumn(name="hotelId")
            },
            inverseJoinColumns = {
                    @JoinColumn(name="f_id")
            }

    )
    private Set<Facility> facilities;

    public Hotel() {
    }

    public int getHotelId() {
        return hotelId;
    }

    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

//    public void setFacilities(Set<Facility> facilities){
//        for(Facility f: facilities){
//            f.getHotels().add(this);
//            this.facilities.add(f);
//        }
//    }

    public Set<Facility> getFacilities() {
        return facilities;
    }

//    public Set<Room> getRooms() {
//        return rooms;
//    }
//
//    public void setRooms(Set<Room> rooms) {
//        this.rooms = rooms;
//    }
}
