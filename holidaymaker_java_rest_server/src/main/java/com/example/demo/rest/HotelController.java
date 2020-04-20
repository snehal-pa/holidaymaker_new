package com.example.demo.rest;

import com.example.demo.entity.Facility;
import com.example.demo.entity.Hotel;
import com.example.demo.repository.HotelRepository;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.*;

import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@RestController
@RequestMapping("rest/hotel")
public class HotelController {
    @Autowired
    private HotelRepository hotelRepository;

    @GetMapping
    public Iterable<Hotel> getAllHotel() {
        return hotelRepository.findAll();
    }

    @PostMapping
    public Hotel createHotel(@RequestBody Hotel hotel) {

        return hotelRepository.save(hotel);
    }
    @GetMapping("/login/{id}")
    public String login(@PathVariable int id, @RequestParam(required=false) String displayName){
        return "You (" + id + ", name: " + displayName +") just logged in";
    }
    @GetMapping("{id}")
    public Optional<Hotel> getSpecificHotel(@PathVariable int id) {
        return hotelRepository.findById(id);
    }


    @DeleteMapping("all")
    private void deleteAllHotel() {
        hotelRepository.deleteAll();
    }

    @DeleteMapping("{id}")
    public void deleteHotel(@PathVariable int id) {
        hotelRepository.deleteById(id);
    }

//    @GetMapping("{facilities}")
//    public List<Hotel> findByfacility(@PathVariable List<Facility> facilities){
//        return hotelRepository.findByFacilities(facilities);
//    }

    @GetMapping("facilities/{ids}")
    public List<Hotel> findByfacilities(@PathVariable List<Integer> ids){
        return hotelRepository.findByFacilityIds(ids);
    }

    @GetMapping("facility/{id}")
    public List<Hotel> findByfacility(@PathVariable int id){
        return hotelRepository.findByFacilityId(id);
    }


}
