package com.example.demo.rest;

import com.example.demo.entity.Room;
import com.example.demo.repository.RoomRepository;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("rest/room")
public class RoomController {
    @Autowired
    private RoomRepository RoomRepository;

    @GetMapping
    public Iterable<Room> getAllRoom() {
        return RoomRepository.findAll();
    }

    @PostMapping
    public Room createRoom(@RequestBody Room room) {

        return RoomRepository.save(room);
    }

    @GetMapping("{id}")
    public Optional<Room> getSpecificRoom(@PathVariable int id) {
        return RoomRepository.findById(id);
    }


    @DeleteMapping("all")
    private void deleteAllRoom() {
        RoomRepository.deleteAll();
    }

    @DeleteMapping("{id}")
    public void deleteRoom(@PathVariable int id) {
        RoomRepository.deleteById(id);
    }


}
