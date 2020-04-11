package com.example.demo.rest;

import com.example.demo.entity.Hotel;
import com.example.demo.repository.HotelRepository;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("rest/hotel")
public class HotelController {
    @Autowired
    private HotelRepository HotelRepository;

    @GetMapping
    public Iterable<Hotel> getAllHotel() {
        return HotelRepository.findAll();
    }

    @PostMapping
    public Hotel createHotel(@RequestBody Hotel hotel) {

        return HotelRepository.save(hotel);
    }
    @GetMapping("/login/{id}")
    public String login(@PathVariable int id, @RequestParam(required=false) String displayName){
        return "You (" + id + ", name: " + displayName +") just logged in";
    }
    @GetMapping("{id}")
    public Optional<Hotel> getSpecificHotel(@PathVariable int id) {
        return HotelRepository.findById(id);
    }


    @DeleteMapping("all")
    private void deleteAllHotel() {
        HotelRepository.deleteAll();
    }

    @DeleteMapping("{id}")
    public void deleteHotel(@PathVariable int id) {
        HotelRepository.deleteById(id);
    }




}
