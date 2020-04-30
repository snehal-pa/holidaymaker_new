<template >
  <div class="container">
    <div
      class="row room clearfix d-flex justify-content-between my-5 mx-2 border-bottom border-warning"
    >
      <div class="col-md-5 mb-3">
        <img class="w-100 h-100" :src="require('../assets/' + room.image + '.jpg')" />
      </div>

      <div class="col-md-4 text-center mb-3">
        <p>
          <strong>Room type:</strong>
          {{room.type}}
        </p>

        <p>
          <strong>Hotel :</strong>
          {{room.hotel.name}}, {{room.hotel.location}}
        </p>
        <p>
          <strong>People capacity :</strong>
          {{room.maxPeople}}
        </p>
        <p>
          <strong>Price :</strong>
          €{{room.price}}
        </p>
        <i class="fas fa-star" v-for="k in room.rating" :key="k.index"></i>
        <i class="far fa-star" v-for="j in (5 -room.rating)" :key="j.index"></i>
      </div>

      <div class="col-md-3 text-center" v-if="room.booked">
        <button disabled class="btn btn-danger btn-lg text-white">Not Available</button>
      </div>
      <div class="col-md-3 text-center d-flex flex-column justify-content-around" v-else>
        <router-link to="/signin">
          <button class="btn btn-warning btn-lg" @click="addToBooking(room)">Book now</button>
        </router-link>
        
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapGetters } from "vuex";
export default {
  // "props" är egna HTML-attribut som vi kan låta en annan komponent skicka in data med.
  props: ["room", "addToBooking"],

  computed: {
    ...mapGetters(["allBookings"]),
    ...mapState([])
  },
  data() {
    return {};
  },
  methods: {}
};
</script>