package com.example.demo.rest;

import com.example.demo.entity.Booking;
import com.example.demo.entity.Customer;
import com.example.demo.repository.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("rest/bookings")
public class BookingController {
    @Autowired
    private BookingRepository bookingRepository;

    @GetMapping
    public Iterable getBookings() {
        return bookingRepository.findAll();
    }

    @PostMapping
    public Booking createBooking(@RequestBody Booking newBooking) {

        return bookingRepository.save(newBooking);
    }

    @GetMapping("{id}")
    public Optional<Booking> getSpecificBooking(@PathVariable int id) {
        return bookingRepository.findById(id);
    }


    @DeleteMapping("all")
    private void deleteAllBooking() {
        bookingRepository.deleteAll();
    }

    @DeleteMapping("{id}")
    public void deleteBooking(@PathVariable int id) {
        bookingRepository.deleteById(id);
    }

    @PutMapping("{id}")
    public Booking replaceEmployee(@RequestBody Booking newBooking, @PathVariable int id) {

        return bookingRepository.findById(id)
                .map(booking -> {
                    booking.setCustomer(newBooking.getCustomer());
                    booking.setRoom(newBooking.getRoom());
                    return bookingRepository.save(booking);
                })
                .orElseGet(() -> {
                    newBooking.setId(id);
                    return bookingRepository.save(newBooking);
                });
    }

    @PutMapping(value = "/{booking}")
    public Booking updateBooking(@ModelAttribute Booking booking, @RequestBody Booking req) {
        booking.setCustomer(req.getCustomer());
        booking.setRoom(req.getRoom());
        booking.setCheck_in(req.getCheck_in());
        booking.setCheck_out(req.getCheck_out());

        return booking;
    }


}
