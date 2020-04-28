<template>
  <div>You are logged out</div>
</template>

<script>
import { mapState, mapGetters, mapActions, mapMutations } from "vuex";
export default {
  computed: {
    ...mapState(["loggedIn"]),
    ...mapGetters(["getLoggedinUser", "getStatus","bookingDone"])
  },

  methods: {
    ...mapMutations(["SET_STATUS","SET_LOG_OUT","SET_BOOKING_STATUS","setSelectedRoom"]),
    ...mapActions(["logOut"])
  },
  mounted() {
    this.SET_LOG_OUT()
    this.SET_STATUS(false)
    this.SET_BOOKING_STATUS(false)
    this.setSelectedRoom(null)
    //this.getStatus;
    console.log(this.getStatus)
    this.getLoggedinUser;
  },

  created() {
      
  }
};
</script>