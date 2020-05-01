import { fetch2 } from "@/helper";

const state = {
  hotels: [],
};

const getters = {
  allHotels: state => state.hotels,
};

const actions = {
  async getHotels({ commit }) {
    const fetchedhotels = await fetch2("hotel");
    commit("SET_hotels", fetchedhotels);
  },

};

const mutations = {
  SET_hotels: (state, b) => (state.hotels = b),
};

export default {
  state,
  getters,
  actions,
  mutations
};
