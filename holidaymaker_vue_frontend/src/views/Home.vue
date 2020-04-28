<template>
  <div class="container">
    <!-- <header>
      <nav class="nav d-flex justify-content-center">
        <router-link to="/about" class="text-sm-right nav-link">About us</router-link>
        <router-link to="/contact" class="text-sm-right nav-link">Contact us</router-link>
        <router-link to="/login" class="text-sm-right nav-link">Login</router-link>
        <router-link to="/allrooms" class="text-sm-right nav-link">All rooms</router-link>
      </nav>
    </header>
    <hr class="bg-warning" />-->

    <main>
      <router-view />
    </main>
    <form class="row inputs pb-3">
      <div class="col-xs-12 col-md-3 col-lg-2 d-flex flex-column">
        <label class="mb-2" for="locations">Locations</label>
        <select class="custom-select" id="locations" v-model="selectedLocation">
          <option v-for="location in allLocations" :key="location.id">{{location}}</option>
        </select>
      </div>
      <div class="col-xs-12 col-md-3 col-lg-2 d-flex flex-column">
        <label class="mb-2" for="people">Guests</label>
        <select class="custom-select" id="locations" v-model="selectedPeople">
          <option v-for="i in 6" :key="i">{{i}}</option>
        </select>
      </div>
      <div class="col-xs-12 col-md-3 col-lg-3 d-flex flex-column">
        <label for="check-in">Check-in</label>
        <input
          class="custom-select"
          id="check-in"
          type="date"
          v-model="check_in"
        />
      </div>
      <div class="col-xs-12 col-md-3 col-lg-3 d-flex flex-column">
        <label for="check-out">Check-out</label>
        <input class="custom-select" id="check-out" type="date" v-model="check_out" />
      </div>
      <div class="col-xs-12 col-md-5 col-lg-2 justify-content-center">
        <button type="button" class="btn btn-lg mt-4" @click="filterRoom">Check avaibility</button>
      </div>
    </form>

    <hr class="bg-warning" />
    <section class="container" v-if="showGallary">
      <div class="row">
        <aside class="col-lg-3 mt-5">
          <h4>Facilities</h4>
          <br />
          <form>
            <div v-for="f in allFacilities" :key="f.id">
              <input
                class="option-input checkbox"
                type="checkbox"
                v-model="checkedFacilities"
                :value="f.name"
              />
              <label :for="f">{{ f.name }}</label>
              <br />
            </div>

            <br />
            <button class="btn btn-sm" type="button" @click="filterByFacility">check</button>
          </form>
        </aside>
        <div class="col-lg-9">
          <Room
            v-for="room in filteredRooms"
            :key="room.id"
            :room="room"
            :addToBooking="addToBooking"
          ></Room>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
/*import { fetch2 } from "@/helper";*/
import Room from "@/components/Room";
import { mapState, mapGetters, mapActions, mapMutations } from "vuex";
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
      "allFacilities",
      "allHotels"
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
      filteredRooms: [],
      filteredHotels: [],
      filteredRoomsByFacility: []
    };
  },

  mounted() {
    this.getRooms();
    this.getBookings();
    this.getFacilities();
    this.getHotels();
  },

  methods: {
    /*...mapMutations([]),*/
    ...mapActions([
      "getRooms",
      "roomStatusChangedToTrue",
      "roomStatusChangedToFalse",
      "getBookings",
      "getFacilities",
      "getHotels",
      "addToBookingStore",
      "changeStatusFalse"
    ]),

    ...mapMutations(["SET_CHECK_IN", "SET_CHECK_OUT", "setSelectedRoom"]),

    showAll(e) {
      e.preventDefault();

      this.showGallary = true;
      this.filteredRooms = this.allRooms;
    },

    addToBooking(room) {
      //this.SET_ROOM_ID(room.id);
      this.SET_CHECK_IN(this.check_in);
      this.SET_CHECK_OUT(this.check_out);
      this.setSelectedRoom(room);
      //this.check_in =""
      //this.check_out =""
      //this.roomStatusChanged(room);
    },

    filterRoom(e) {
      e.preventDefault();

      if (this.checkDate()) {
        this.showGallary = true;

        this.filteredRooms = [];
        this.filteredRooms = this.allRooms;
        if (this.selectedLocation != "") {
          this.filteredRooms = this.filteredRooms.filter(
            r => r.hotel.location == this.selectedLocation
          );
        }
        if (this.selectedPeople != "") {
          this.filteredRooms = this.filteredRooms.filter(
            r => r.maxPeople >= this.selectedPeople
          );
        }
        console.log("Location", this.selectedLocation);
        console.log("People", this.selectedPeople);

        const sameDateBookings = this.allBookings.filter(
          b =>
            (this.check_in >= b.check_in && this.check_in < b.check_out) ||
            (this.check_out >= b.check_in && this.check_out < b.check_out) ||
            (this.check_in <= b.check_in && this.check_out >= b.check_out)
        );
        console.log("Filter by dates",sameDateBookings);

        for (let b of sameDateBookings) {
          for (let i = 0; i < this.filteredRooms.length; i++) {
            if (this.filteredRooms[i].id == b.room.id) {
              //this.roomStatusChangedToTrue(this.filteredRooms[i]);
              this.filteredRooms.splice(i, 1);
            }
          }
        }
      }
      console.log(this.filteredRooms);
    },

    checkDate() {
      let inDate = new Date(this.check_in);
      let outDate = new Date(this.check_out);
      let now = new Date();
      if (inDate < now || outDate < now) {
        alert("Date must be in the future");
        return false;
      }
      if (this.check_in == "" || this.check_out == "") {
        alert("Enter check-in/check-out date");
        return false;
      }
      if (this.check_in > this.check_out) {
        alert("check-out date must be in future of check-in date");
        return false;
      }
      return true;
    },
    
    isValidDate() {
      let d = new Date();
      if (
        this.check_in < d ||
        this.check_out < d ||
        this.check_out < this.check_in
      ) {
        alert("Wrong input of dates");
        return false;
      } else {
        return true;
      }
    },

    filterByFacility(e) {
      e.preventDefault();
      this.filteredHotels = [];
      this.filteredRoomsByFacility = [];
      for (let h of this.allHotels) {
        const names = h.facilities.map(function(obj) {
          return obj.name;
        });
        if (this.checkedFacilities.every(f => names.indexOf(f) > -1)) {
          this.filteredHotels.push(h);
        }
      }
      console.log("filtered hotel", this.filteredHotels);

      for (let h of this.filteredHotels) {
        for (let r of this.filteredRooms) {
          if (r.hotel.hotelId === h.hotelId) {
            this.filteredRoomsByFacility.push(r);
          }
        }
      }
      console.log("filter by facility", this.filteredRoomsByFacility);
      this.filteredRooms = this.filteredRoomsByFacility;
    }
  },
  created() {
    console.log(this.allRooms);
    console.log(this.allBookings);
    console.log(this.allHotels);
    //let dateToCompare = moment(new Date(),"MMDDYYYY");
    //console.log(dateToCompare);
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

