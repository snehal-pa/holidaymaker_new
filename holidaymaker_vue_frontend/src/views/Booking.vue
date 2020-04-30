<template>
  <div class="container">
    <div class="row justify-content-center" v-if="getSelectedRoom">
      <div class="col-lg-10 card">
        <div class="card-body">
          <h3 class="card-title text-warning text-center">Your Reservation</h3>
          <div class="d-flex justify-content-between row">
            <div class="col-md-6 card-text text-dark mb-5">
              <div class="d-flex flex-column">
                <p class="h5">Room:-- {{getSelectedRoom.id}}</p>
                <p>
                  <i class="fas fa-star" v-for="k in getSelectedRoom.rating" :key="k.index"></i>
                  <i class="far fa-star" v-for="j in (5 -getSelectedRoom.rating)" :key="j.index"></i>
                </p>
              </div>
              <br />
              <div class="h6">
                <p>
                  <b>Hotel :</b>
                  {{getSelectedRoom.hotel.name}}, {{getSelectedRoom.hotel.location}}
                </p>
                <p>
                  <b>check_in date :</b>
                  {{getCheckIn}}
                </p>
                <p>
                  <b>check_out date :</b>
                  {{getCheckOut}}
                </p>
              </div>

              <div class="h5 mb-5">
                <b>Price :</b>
                €{{getSelectedRoom.price}}
                <span
                  v-if="picked.price!=0"
                >+ €{{picked.price}} = €{{getTotalPrice}}</span>
              </div>

              <div class="md-form">
                <div class="d-flex justify-content-between">
                  <label for="phone">Phone number (with country code)</label>
                  <div @click="removePhoneNumber">
                    <i class="fas fa-trash"></i>
                  </div>
                </div>

                <input
                  type="text"
                  id="phone"
                  class="form-control"
                  v-model="phone"
                  @input="acceptNumber"
                />
              </div>
            </div>
            <aside class="col-md-6 text-dark p-3">
              <h4>
                <strong>Select a Board</strong>
              </h4>
              <div v-for="p in allPackages" :key="p.name">
                <label>
                  <input
                    type="radio"
                    class="option-input radio"
                    :value="p"
                    @change="updatePrice"
                    v-model="picked"
                  />
                  {{p.name}}
                  <span v-if="p.price!=0">__€{{p.price}}</span>
                </label>
                <br />
              </div>
            </aside>
          </div>
        </div>
        <div class="card-body d-flex justify-content-around">
          <button v-if="bookingDone" class="btn disabled">Submitted</button>
          <button v-else class="btn-warning" type="button" @click="addNewBooking">Submit</button>

          <router-link to="/cart">
            <h5
              v-if="bookingDone"
              class="text-warning font-weight-bolder loading"
            >Reservation has been sent!</h5>
          </router-link>
          <router-link to="/">
            <button class="btn-warning" type="button">Cancel</button>
          </router-link>
        </div>
      </div>
    </div>
    <div v-else class="d-flex justify-content-center">
      <h3>You have not selected any room</h3>
    </div>
  </div>
</template>

<script>
import { mapState, mapGetters, mapActions, mapMutations } from "vuex";
export default {
  data() {
    return {
      picked: { name: "Room only (No extra charges)", price: 0 },
      phone: ""
      //picked: this.allPackages[0]
    };
  },

  mounted() {
    //this.calcTotalPrice();
    console.log(this.picked.price);
    this.updatePrice();
  },

  computed: {
    ...mapState([]),
    ...mapGetters([
      "getCheckIn",
      "getCheckOut",
      "getLoggedinUser",
      "getSelectedRoom",
      "getTotalPrice",
      "allPackages",
      "bookingDone"
    ])
  },
  methods: {
    ...mapMutations(["ADD_PRICE", "SET_PHONE", "SET_BOOKING_STATUS"]),
    ...mapActions(["addNewBookingToDb"]),

    acceptNumber() {
      let x = this.phone
        .replace(/\D/g, "")
        //.match(/^(\d[\s-]?){7,14}$/)
        .match(/(\d{0,2})(\d{0,2})(\d{0,3})(\d{0,2})(\d{0,2})/);
      this.phone = !x[2]
        ? x[1]
        : "(+" +
          x[1] +
          ") " +
          x[2] +
          (x[3] ? "-" + x[3] : "") +
          (x[4] ? "-" + x[4] : "") +
          (x[5] ? "-" + x[5] : "") +
          " ";
    },
    removePhoneNumber() {
      this.phone = "";
    },

    updatePrice() {
      this.ADD_PRICE(this.picked.price);
    },

    addNewBooking(e) {
      e.preventDefault();
      const newBooking = {
        customer: this.getLoggedinUser,
        room: this.getSelectedRoom,
        check_in: this.getCheckIn,
        check_out: this.getCheckOut,
        totalPrice: this.getTotalPrice,
        addition: this.picked.name
      };
      this.SET_PHONE(this.phone);
      console.log(newBooking);
      this.addNewBookingToDb(newBooking);
      this.SET_BOOKING_STATUS(true);
     }
  }
};
</script>
<style scoped>
aside {
  background-color: blanchedalmond;
}
</style>