package com.example.demo.repository;

import com.example.demo.entity.Room;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RoomRepository extends CrudRepository<Room, Integer> {
//    @Modifying
//    @Query("UPDATE Room r SET r.isBooked = :status WHERE c.id = :roomId")
//    int updateAddress(@Param("roomId") int companyId, @Param("status") String address);
}
