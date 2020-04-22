import { fetch2 } from "@/helper";

const state = {
  rooms: [],
  selectedRoom: null,
  totalPrice: 0
};

const getters = {
  allRooms: (state) => state.rooms,
  getSelectedRoom: (state) => state.selectedRoom,
  getTotalPrice: (state) => state.totalPrice
};

const actions = {
  async getRooms({ commit }) {
    const fetchedRooms = await fetch2("room");
    commit("SET_ROOMS", fetchedRooms);
  },
  async roomStatusChangedToFalse(room) {
    room.booked = false;
    await fetch2("room/" + room.id, "put", room);
  },
  async roomStatusChangedToTrue({ commit }, room) {
    room.booked = true;
    await fetch2("room/" + room.id, "put", room);

    console.log("Room number: " + room.id + " booked:" + room.booked);
    commit("setSelectedRoom", room);
  },
};

const mutations = {
  SET_ROOMS: (state, rooms) => (state.rooms = rooms),
  setSelectedRoom: (state, selectedRoom) => (state.selectedRoom = selectedRoom),
  ADD_PRICE: (state, extraPrice) => state.totalPrice = state.selectedRoom.price+ extraPrice,
};

export default {
  state,
  getters,
  actions,
  mutations,
};
