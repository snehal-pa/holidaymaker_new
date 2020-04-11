<template>
  <div>
    <form class="inputs" >
      <div class="d-flex flex-column">
        <label for="locations">Choose a Location:</label>
        <select id="locations" v-model="selectedLocation">
          <option>A</option>
          <option>B</option>
          <option>C</option>
        </select>
      </div>
      <div class="d-flex flex-column">
        <label for="people">People</label>
        <select id="locations" v-model="selectedPeople">
          <option v-for="i in 10" :key="i">{{i}}</option>
        </select>

      </div>
      <div class="d-flex flex-column">
        <label for="check-in">Check-in</label>
        <input id="check-in" type="date" v-model="check_in" />
      </div>
      <div class="d-flex flex-column">
        <label for="check-out">Check-out</label>
        <input id="check-out" type="date" v-model="check_out" />
      </div>
      <div>
        <button
          type="button"
          class="btn btn-light btn-lg mt-4"
          @click="showGallary = true"
        >Check avaibility</button>
      </div>
    </form>
    <section v-if="showGallary">
      <Room v-for="room in rooms" :key="room.id" :room="room" :addToBooking="addToBooking"></Room>
    </section>
  </div>
</template>

<script>
import { fetch2 } from "@/helper";
import Room from "@/components/Room";
export default {
  components: {
    Room
  },

  data() {
    return {
      check_in: "",
      check_out: "",
      selectedLocation: "",
      selectedPeople:"",
      people: "",
      rooms: [],
      showGallary: false
    };
  },

  mounted(){
    this.getRooms();
  },

  methods: {
    getRooms: async function() {
      this.rooms = await fetch2("room");
    },
    addToBooking: function(){
      
      console.log('hi')
    }
  }
};
</script>

<style scoped>
.inputs {  
  display: flex;
  /*flex-flow: row wrap;
  align-items: center;*/
  flex-direction: row;
  justify-content: space-between;
}

.inputs label {
  margin: 5px 10px 5px 0;
}

.inputs input {
  vertical-align: middle;
  margin: 5px 10px 5px 0;
  padding: 10px;
  background-color: #fff;
  border: 1px solid #ddd;
}

.btn {
  padding: 10px 20px;
  background-color: rgb(248, 232, 14);
  border: 1px solid #ddd;
  color: rgb(121, 10, 10);
  cursor: pointer;
}

.btn:hover {
  background-color: royalblue;
}

@media (max-width: 800px) {
  .inputs input {
    margin: 10px 0;
  }
  
  .inputs {
    flex-direction: column;
    /*align-items: stretch;*/
  }
}

</style>

