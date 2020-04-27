package com.example.demo.repository;

import com.example.demo.entity.Booking;
import com.example.demo.entity.Customer;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface BookingRepository extends CrudRepository<Booking, Integer> {
    @Query(value = "SELECT * FROM booking b where b.custId =:custId",nativeQuery = true)
    List<Booking> findByCustomer(@Param("custId") int id);

    @Query(value = "SELECT * FROM booking b where b.custId =:custId AND b.roomId = :roomId AND b.check_in = :in",nativeQuery = true)
    List<Booking> findByCustomerBookDate(@Param("custId") long cId, @Param("roomId") int rId, @Param("in") LocalDate checkIn);

}
