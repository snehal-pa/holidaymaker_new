package com.example.demo.repository;

import com.example.demo.entity.Room;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoomRepository extends CrudRepository<Room, Integer> {
//    @Modifying
//    @Query("UPDATE Room r SET r.isBooked = :status WHERE c.id = :roomId")
//    int updateAddress(@Param("roomId") int companyId, @Param("status") String address);
    @Query(value = "SELECT * FROM room r WHERE r.maxPeople >:people AND r.hotelId IN (SELECT h.hotelId FROM hotel h WHERE LOWER(h.location) = LOWER(:location)",nativeQuery = true)
    List<Room> findByPeopleAndLocation(@Param("people") Integer people, @Param("location") String location);

    @Query(value = "select * from room r  inner join hotel h on r.hotelId = h.hotelId where r.maxPeople > ?1 AND h.location = ?2",nativeQuery = true)
    List<Room> findByPeopleAndLocationn(Integer maxPeople,String location);

}
