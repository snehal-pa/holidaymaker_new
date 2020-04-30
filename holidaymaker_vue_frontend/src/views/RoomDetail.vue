<template>
  <div>
    <section class="container">
      <div class="row d-flex justify-content-around my-5+">
        <div class="col-12 text-center">
          <img class="w-75" :src="require('../assets/' + room.image + '.jpg')" />
        </div>
        <div class="col-12 d-flex flex-column text-center">
          <div class="m-3">
            <p class="h3">
              <router-link to="/"> <strong>Room: {{room.id}}</strong></router-link>
            </p>

            <p>
              <i class="fas fa-star" v-for="k in room.rating" :key="k.index"></i>
              <i class="far fa-star" v-for="j in (5 - room.rating)" :key="j.index"></i>
            </p>

            <p class="h4">
              <strong>Room type:</strong>
              {{room.type}}
            </p>

            <p class="h4">
              <strong>Hotel :</strong>
              {{room.hotel.name}}, {{room.hotel.location}}
            </p>
            <p class="h4">
              <strong>People capacity :</strong>
              {{room.maxPeople}}
            </p>
            <p class="h4">
              <strong>Price :</strong>
              €{{room.price}}
            </p>
          </div>
          <div class="m-3">
            <p class="h1">
              <u>Facilities:</u>
            </p>

            <p class="h4" v-for="f in room.hotel.facilities" :key="f.id">{{f.name}}</p>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>


<script>
import { fetch2 } from "@/helper";
export default {
  data() {
    return {
      room: {}
    };
  },
  async mounted() {
    this.room = await fetch2("room/" + this.$route.params.id);
  }
};
</script>

<style scoped>
.transp {
  opacity: 1.1;
}
</style>
