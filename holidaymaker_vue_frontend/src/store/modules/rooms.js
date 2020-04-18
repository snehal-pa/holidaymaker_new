import { fetch2 } from "@/helper";

const state = {
  rooms: [],
  selectedRoom: null
};

const getters = {
  allRooms: state => state.rooms,
  getSelectedRoom: state => state.selectedRoom
};

const actions = {
  async getRooms({ commit }) {
    const fetchedRooms = await fetch2("room");
    commit("SET_ROOMS", fetchedRooms);
  },
  async roomStatusChanged({ commit }, room) {
    room.booked = true;
    await fetch2("room/" + room.id, "put", room);

    console.log("Room number: " + room.id + " booked:" + room.booked);
    commit("setSelectedRoom", room);
  }
};

const mutations = {
  SET_ROOMS: (state, rooms) => (state.rooms = rooms),
  setSelectedRoom: (state, selectedRoom) => (state.selectedRoom = selectedRoom)
};

export default {
  state,
  getters,
  actions,
  mutations
};
