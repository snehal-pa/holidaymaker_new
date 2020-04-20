import { fetch2 } from "@/helper";

const state = {
  bookings: [],
  custId : "",
  roomId: "",
  check_in:"",
  check_out:""
};

const getters = {
  allBookings: state => state.bookings,
  getCustId : state => state.custId,
  getRoomId : state => state.roomId,
  getCheckIn : state => state.check_in,
  getCheckOut : state => state.check_out,
};

const actions = {
  async getBookings({ commit }) {
    const fetchedBookings = await fetch2("bookings");
    commit("SET_BOOKINGS", fetchedBookings);
  },

  async addToBookingStore({commit},newBooking){
    const response = await fetch2("booking","post",newBooking)
    commit("ADD_BOOKINGS",response)
    
  }

};

const mutations = {
  ADD_BOOKINGS: (state,b) => (state.bookings.push(b)),
  SET_BOOKINGS: (state, b) => (state.bookings = b),
  SET_ROOM_ID:(state, id) =>(state.roomId = id),
  SET_CUST_ID:(state,id) => (state.custId =id),
  SET_CHECK_IN:(state,checkIn) =>(state.check_in = checkIn),
  SET_CHECK_OUT:(state,checkOut)=>(state.check_out = checkOut)
};

export default {
  state,
  getters,
  actions,
  mutations
};
