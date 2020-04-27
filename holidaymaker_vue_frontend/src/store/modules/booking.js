import { fetch2 } from "@/helper";

const state = {
  bookings: [],
  check_in: "",
  check_out: "",
  bookingsOfCurrentUser: [],
  phone:"",


  packages: [
    { name: "Room only (No extra charges)", price: 0 },
    { name: "Self Catering", price: 50 },
    { name: "Bed & Breakfast", price: 150 },
    { name: "Half Board", price: 200 },
    { name: "Full Board", price: 300 },
    { name: "All Inclusive", price: 400 },
  ],
};

const getters = {
  allBookings: (state) => state.bookings,
  getCheckIn: (state) => state.check_in,
  getCheckOut: (state) => state.check_out,
  allPackages: (state) => state.packages,
  getBookingsOfCurrentUser:(state)=> state.bookingsOfCurrentUser,
  getPhoneNumber: (state) => state.phone

};

const actions = {
  async getBookings({ commit }) {
    const fetchedBookings = await fetch2("bookings");
    commit("SET_BOOKINGS", fetchedBookings);
  },

  async addNewBookingToDb({ commit }, newBooking) {
    const response = await fetch2("bookings", "post", newBooking);
    commit("ADD_BOOKINGS", response);
  },

  async bookingsOfLoggedInUser({commit},id){
    const bookings = await fetch2("bookings/customer/"+id)
    console.log(bookings)
    commit("SET_CURRENT_USER_BOOKING",bookings)
  },

  
   
};

const mutations = {
  ADD_BOOKINGS: (state, b) => state.bookings.push(b),
  SET_BOOKINGS: (state, b) => (state.bookings = b),
  SET_CHECK_IN: (state, checkIn) => (state.check_in = checkIn),
  SET_CHECK_OUT: (state, checkOut) => (state.check_out = checkOut),
  SET_CURRENT_USER_BOOKING: (state,booking) =>(state.bookingsOfCurrentUser =booking),
  SET_PHONE:(state,ph)=>state.phone=ph

};

export default {
  state,
  getters,
  actions,
  mutations,
};
