import { fetch2 } from "@/helper";

const state = {
  bookings: [],
};

const getters = {
  allBookings: state => state.bookings,
};

const actions = {
  async getBookings({ commit }) {
    const fetchedBookings = await fetch2("bookings");
    commit("SET_BOOKINGS", fetchedBookings);
  },

};

const mutations = {
  SET_BOOKINGS: (state, b) => (state.bookings = b),
};

export default {
  state,
  getters,
  actions,
  mutations
};
