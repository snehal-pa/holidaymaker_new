<template>
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-10 card">
        <div class="card-body">
          <h3 class="card-title text-warning text-center">Your Reservation</h3>
          <div class="d-flex justify-content-between">
            <div class="card-text text-dark">
              <div class="d-flex flex-column">
                <p class="h5">Room:-- {{getSelectedRoom.id}}</p>
                <p>
                  <i class="fas fa-star" v-for="k in getSelectedRoom.rating" :key="k.index"></i>
                  <i class="far fa-star" v-for="j in (5 -getSelectedRoom.rating)" :key="j.index"></i>
                </p>
              </div>
              <br />
              <div class="h6">
                <p><b>Hotel : </b>{{getSelectedRoom.hotel.name}}, {{getSelectedRoom.hotel.location}}</p>
                <p><b>check_in date : </b> {{getCheckIn}}</p>
                <p><b>check_out date :</b>{{getCheckOut}}</p>
                <p>{{getCurrentCustomer.firstName}} {{getCurrentCustomer.lastName}}</p>
              </div>

              <div class="h5">
                <b> Price :</b>€{{getSelectedRoom.price}}
                <span
                  v-if="picked.price!=0"
                >+ €{{picked.price}} = €{{getTotalPrice}}</span>
              </div>
            </div>
            <aside class="text-dark w-50 p-3">
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

                  {{p.name}} <span v-if="p.price!=0"> for €{{p.price}} </span>
                </label>
                <br>
              </div>
            </aside>
          </div>
        </div>
        <div class="card-body d-flex justify-content-around">
          <button class="btn-warning" type="button">Submit</button>
          <button class="btn-warning" type="button">cancel</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapGetters, mapActions, mapMutations } from "vuex";
export default {
  data() {
    return {
      picked: { name: "Room only (extra charge = 0)", price: 0 },

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
      "getCustId",
      "getRoomId",
      "getCheckIn",
      "getCheckOut",
      "getCurrentCustomer",
      "getSelectedRoom",
      "getTotalPrice",
      "allPackages"
    ])
  },
  methods: {
    ...mapMutations(["ADD_PRICE"]),
    ...mapActions([]),

    updatePrice() {
      this.ADD_PRICE(this.picked.price);
    }
  }
};
</script>
<style scoped>
aside {
  background-color: blanchedalmond;
}


</style>