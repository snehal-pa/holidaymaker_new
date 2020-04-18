<template >
  <div class=" row room clearfix d-flex justify-content-between my-5 mx-2">
     <img  class="mr-2" src="../assets/3.jpg" />


    <div class="col-4 content">
      <p>{{room.id}} :{{room.type}}</p>
      <p>Location: {{room.hotel.location}}</p>
      <p>People capacity: {{room.maxPeople}}</p>
      <p>Price: €{{room.price}}</p>

      <i class="fas fa-star" v-for="i in room.rating" :key="i"></i>
      <i class="far fa-star" v-for="j in (5 -room.rating)" :key="j"></i>
    </div>
    <div class="col-3" v-if="room.booked">
      <button disabled class="btn btn-danger btn-lg text-white">Not Available</button>
    </div>
    <div  class="col-3" v-else>
      <router-link to="/Login">
        <button class="btn btn-warning btn-lg" @click="changeRoomStatus(room)">Book now</button>
      </router-link>
    </div>
  </div>
</template>

<script>
import {mapState,mapGetters} from 'vuex'
export default {
  // "props" är egna HTML-attribut som vi kan låta en annan komponent skicka in data med.
  props: ["room", "changeRoomStatus"],

  computed:{
    ...mapGetters(['allBookings']),
    ...mapState([])

  },
  methods:{

  }
};
</script>