<template>
  <div class="container">
    <div class="row">
      <div class="col d-flex justify-content-end mr-5">
        <button type="button" class="btn btn-warning btn-sm" @click="showAll">show all rooms</button>
      </div>
    </div>

    <form class="row inputs pb-3">
      <div class="col d-flex flex-column">
        <label class="mb-2" for="locations">Locations</label>
        <select class="custom-select" id="locations" v-model="selectedLocation">
          <option v-for="location in allLocations" :key="location">{{location}}</option>
        </select>
      </div>
      <div class="col d-flex flex-column">
        <label class="mb-2" for="people">Guests</label>
        <select class="custom-select" id="locations" v-model="selectedPeople">
          <option v-for="i in 10" :key="i">{{i}}</option>
        </select>
      </div>
      <div class="col d-flex flex-column">
        <label for="check-in">Check-in</label>
        <input class="custom-select" id="check-in" type="date" v-model="check_in" />
      </div>
      <div class="col d-flex flex-column">
        <label for="check-out">Check-out</label>
        <input class="custom-select" id="check-out" type="date" v-model="check_out" />
      </div>
      <div class="col">
        <button
          type="button"
          class="btn btn-warning btn-lg mt-4"
          @click="filterRoom"
        >Check avaibility</button>
      </div>
    </form>
    <hr class="bg-warning" />
    <section class="container" v-if="showGallary">
      <div class="row">
        <aside class="col-3 mt-5">
          <h4>Facilities</h4>
          <br />
          <form action="/action_page.php">
            <div v-for="f in allFacilities" :key="f">
              <input type="checkbox" v-model="checkedFacilities" :value="f.name" />
              <label :for="f">{{ f.name }}</label>
              <br />
            </div>

            <span>You selected: {{ checkedFacilities }}</span>
          </form>
        </aside>
        <div class="col-9">
          <Room
            v-for="room in filteredRoom"
            :key="room.id"
            :room="room"
            :changeRoomStatus="changeRoomStatus"
          ></Room>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
/*import { fetch2 } from "@/helper";*/
import Room from "@/components/Room";
import { mapState, mapGetters, mapActions } from "vuex";
export default {
  components: {
    Room
  },

  computed: {
    ...mapGetters([
      "allRooms",
      "getSelectedRoom",
      "allLocations",
      "allBookings",
      "allFacilities"
    ]),
    ...mapState(["rooms", "selectedRoom", "locations", "bookings"])
  },

  data() {
    return {
      check_in: "",
      check_out: "",
      selectedLocation: "",
      selectedPeople: "",
      showGallary: false,
      showLoginForm: false,
      checkedFacilities: [],
      filteredRoom: []
    };
  },

  mounted() {
    this.getRooms();
    this.getBookings();
    this.getFacilities();
  },

  methods: {
    /*...mapMutations([]),*/
    ...mapActions([
      "getRooms",
      "roomStatusChanged",
      "getBookings",
      "getFacilities"
    ]),

    changeRoomStatus(room) {
      this.roomStatusChanged(room);
    },

    addToBooking: function() {
      console.log("hi");
    },

    showAll() {
      this.filteredRoom = this.allRooms;
      this.showGallary = true;
    },

    filterRoom() {
      this.filteredRoom = this.allRooms.filter(
        r =>
          r.hotel.location == this.selectedLocation &&
          r.maxPeople >= this.selectedPeople
      );

      const sameDateBookings = this.allBookings.filter(
        b => this.check_in >= b.check_in && this.check_in < b.check_out
      );

      for (let b of sameDateBookings) {
        for (let i = 0; i < this.filteredRoom.length; i++) {
          if (this.filteredRoom[i].id == b.room.id) {
            this.filteredRoom.splice(i, 1);
          }
        }
      }

      console.log(sameDateBookings);
      this.showGallary = true;
    }
  },
  created() {
    console.log("hi");
    console.log(this.allRooms);
    console.log(this.allBookings);
  }
};
</script>

<style scoped>
.custom-select select {
  display: none;
}

.btn {
  border: 1px solid #ddd;
  cursor: pointer;
}

.btn:hover {
  background-color: rgb(192, 107, 11);
}
</style>

