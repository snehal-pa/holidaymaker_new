package com.example.demo.repository;

import com.example.demo.entity.Facility;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FacilityRepository extends CrudRepository<Facility,Integer> {
}
