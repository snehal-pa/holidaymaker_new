import { fetch2 } from "@/helper";

const state = {
  facilities: [],
  locations: [
    "Alhambra",
    "Barcelona",
    "Granada",
    "Madrid",
    "Seville",
    "Valencia"
  ]
};

const getters = {
  allFacilities: state => state.facilities,
  allLocations: state => state.locations
};

const actions = {
  async getFacilities({ commit }) {
    const fetchedFacilities = await fetch2("facility");
    commit("SET_FACILITY", fetchedFacilities);
  }
};

const mutations = {
  SET_FACILITY: (state, f) => (state.facilities = f)
};

export default {
  state,
  getters,
  actions,
  mutations
};
