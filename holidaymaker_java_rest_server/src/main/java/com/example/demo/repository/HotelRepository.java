package com.example.demo.repository;

import com.example.demo.entity.Facility;
import com.example.demo.entity.Hotel;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.List;

@Repository
public interface HotelRepository extends CrudRepository<Hotel, Integer> {
    @Query(value = "SELECT * FROM hotel h INNER JOIN hotel_facility hf ON h.hotelId = hf.hotelId WHERE hf.f_id = ?1",nativeQuery = true)
    List<Hotel> findByFacilityId(@Param("id") int id);

    @Query(value = "SELECT * FROM hotel h INNER JOIN hotel_facility hf ON h.hotelId = hf.hotelId WHERE hf.f_id IN :ids",nativeQuery = true)
    List<Hotel> findByFacilityIds(@Param("ids") List<Integer> ids);

//    @Query("select h from Hotel h INNER JOIN h.Facility f where f in(:facilities)")
//    List<Hotel> findByFacilities(@Param("facilities") List<Facility> facilities);

    
    //native query
}
