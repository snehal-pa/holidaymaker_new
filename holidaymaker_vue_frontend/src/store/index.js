import Vue from 'vue'
import Vuex from 'vuex'
import rooms from './modules/rooms'
import customer from './modules/customer'
import checkBox from './modules/checkBox'
import booking from './modules/booking'



Vue.use(Vuex)

export default new Vuex.Store({
  state: {
  },
  getters:{

  },
  mutations: {
  },
  actions: {
  },
  modules: {
    rooms,
    customer,
    checkBox,
    booking
  }
})
