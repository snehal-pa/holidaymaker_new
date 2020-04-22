<template>
  <div>
    <header>
      <nav class="nav d-flex justify-content-center">
        <router-link to="/about" class="text-sm-right nav-link">About us</router-link>
        <router-link to="/contact" class="text-sm-right nav-link">Contact us</router-link>
        <router-link to="/login" class="text-sm-right nav-link">Login</router-link>
        <router-link to="/allrooms" class="text-sm-right nav-link">All rooms</router-link>
      </nav>
    </header>
    <hr class="bg-warning" />

    <main>
      <router-view />
    </main>

    <section class=" container all-Rooms">
      <div
        v-for="room in allRooms"
        :key="room.id"
        class="row border-bottom d-flex justify-content-around my-5"
      >
        <div class=" col-12 col-md-4 ">
          <img class="w-100 h-100 mr-5 mb-5" src="..\assets\11.jpg" />
        </div>

        <div class="col-6 col-md-4 content">
          <strong>{{room.id}}</strong>
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
        <div class="col-6 col-md-4">
          <u>Facilities included:</u>
          <p v-for="f in room.hotel.facilities" :key="f.id">* {{f.name}}</p>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  computed: {
    ...mapGetters(["allRooms"])
  }
};
</script>