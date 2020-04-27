<template>
  <div>
    <h2 class="text-warning text-center mb-4">Booking cart</h2>
    <div class="d-flex justify-content-end mb-5">
      <div>
        <h4>
          <strong>
            <u>Personal Information</u>
          </strong>
        </h4>

        <p>
          <b>First Name:</b>
          {{getLoggedinUser.firstName}}
        </p>
        <p>
          <b>Last Name:</b>
          {{getLoggedinUser.lastName}}
        </p>
        <p>
          <b>Email:</b>
          {{getLoggedinUser.email}}
        </p>
        <p v-if="getPhoneNumber">
            <b>Phone:</b>
            {{getPhoneNumber}}
        </p>
      </div>
    </div>
    <section v-if="getBookingsOfCurrentUser.length" class="container">
      <div class="row font-weight-bolder border-bottom mb-3 text-warning">
        <p class="col-md-2">Hotel</p>
        <p class="col-md-2">Room No.</p>
        <p class="col-md-2">Check-In</p>
        <p class="col-md-2">Check-Out</p>
        <p class="col-md-2">Payment</p>
        <p class="col-md-2">Board</p>
      </div>
      <div class="row mb-3 border-bottom" v-for="b in getBookingsOfCurrentUser" :key="b.id">
        <p class="col-md-2">{{b.room.hotel.name}},{{b.room.hotel.location}}</p>
        <router-link class="col-md-2" :to="'/roomdetail/'+ b.room.id">{{b.room.id}}</router-link>
        <p class="col-md-2">{{b.check_in}}</p>
        <p class="col-md-2">{{b.check_out}}</p>
        <p class="col-md-2">€{{b.totalPrice}}</p>
        <p class="col-md-2">{{b.addition}}</p>
        <div class="col-12 d-flex justify-content-center">
          <button class="m-3">Update</button>
          <button class="m-3" @click="deleteB(b)">Delete</button>
        </div>
      </div>
    </section>
    <section class="h3 text-center" v-else>Not any booking done yet</section>
  </div>
</template>

<script>
import { mapState, mapGetters, mapActions, mapMutations } from "vuex";
import { fetch2 } from "@/helper";

export default {
  computed: {
    ...mapState([]),
    ...mapGetters(["getLoggedinUser", "getBookingsOfCurrentUser","getPhoneNumber"])
  },

  methods: {
    ...mapActions(["bookingsOfLoggedInUser", "deleteBooking"]),
    ...mapMutations([]),
    async deleteB(b) {
      if (confirm("Are you sure you want to delete the booking?")) {
        await fetch2("bookings/" + b.id, "delete");
        this.bookingsOfLoggedInUser(this.getLoggedinUser.id);
      }
    }
  },
  mounted() {
    this.bookingsOfLoggedInUser(this.getLoggedinUser.id);
    console.log(this.getBookingsOfCurrentUser);
  }
};
</script>