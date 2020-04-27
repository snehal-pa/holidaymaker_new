package com.example.demo.rest;

import com.example.demo.entity.Room;
import com.example.demo.repository.RoomRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("rest/room")
public class RoomController {
    @Autowired
    private RoomRepository roomRepository;

    @GetMapping
    public Iterable<Room> getAllRoom() {
        return roomRepository.findAll();
    }

    @PostMapping
    public Room createRoom(@RequestBody Room room) {

        return roomRepository.save(room);
    }

    @GetMapping("{id}")
    public Optional<Room> getSpecificRoom(@PathVariable int id) {
        return roomRepository.findById(id);
    }


    @DeleteMapping("all")
    private void deleteAllRoom() {
        roomRepository.deleteAll();
    }

    @DeleteMapping("{id}")
    public void deleteRoom(@PathVariable int id) {
        roomRepository.deleteById(id);
    }

    @GetMapping("{people}/{location}")
    private List<Room> getFilteredRoom( @PathVariable int people,@PathVariable String location){
        return roomRepository.findByPeopleAndLocation(people,location);
    }

//    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
//    public Room updateById(@PathVariable("id") int id, @RequestBody Room newRoom) {
//        return roomRepository.findById(id)
//                .map(room -> {
//                    room.setType(newRoom.getType());
//                    room.setHotel(newRoom.getHotel());
//                    room.setPrice(newRoom.getPrice());
//                    room.setRating(newRoom.getRating());
//                    room.setMaxPeople(newRoom.getMaxPeople());
//                    room.setBooked(newRoom.isBooked());
//                    room.setImage(newRoom.getImage());
//
//                    room.setBooked(newRoom.isBooked());
//                    return roomRepository.save(room);
//                })
//                .orElseGet(() -> {
//                    newRoom.setId(id);
//                    return roomRepository.save(newRoom);
//                });
//
//
//    }
    @PutMapping("{id}")
    public Room updateById( @RequestBody Room room) {
        return roomRepository.save(room);
    }

}
