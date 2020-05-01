package com.example.demo.rest;

import com.example.demo.entity.Facility;
import com.example.demo.repository.FacilityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("rest/facility")
public class FacilityController {
    @Autowired
    private FacilityRepository facilityRepository;

    @GetMapping()
    public Iterable<Facility> getAllFacility(){
        return facilityRepository.findAll();
    }
}
