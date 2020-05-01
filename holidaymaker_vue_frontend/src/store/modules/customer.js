import { fetch2, fetch3/*, transformRequest */} from "@/helper";

const state = {
  customers: [],
  currentCustomer: null,
  loggedIn :false

  //logIn : true
};

const getters = {
  allCustomers: (state) => state.customers,
  getLoggedinUser: (state) => state.currentCustomer,
  getStatus:(state) => state.loggedIn

};

const actions = {
  async getCustomers({ commit }) {
    const fetchedCustomers = await fetch2("customer");
    commit("setCustomers", fetchedCustomers);
  },

  async addCustomer({ commit }, customer) {
    commit("addNewCustomer", await fetch3(customer));
  },

  /*async springLoginn(credentials) {
    await fetch("http://localhost:2020/login", {
      method: "POST",
      body: transformRequest(credentials),
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
    }).then(function(response) {
      let successfulLogin = !response.url.includes("error");
      console.log("the login result is:", successfulLogin);
    });
  },*/

  async setCurrentCustomer({ commit }) {
    let currentUser = await fetch2("customer/currentUser");
    commit("SET_LOGGED_IN_USER", currentUser);
  },

 
};

const mutations = {
  setCustomers: (state, customers) => (state.customers = customers),
  addNewCustomer: (state, newCust) => state.customers.push(newCust),
  SET_LOGGED_IN_USER: (state, currentC) => (state.currentCustomer = currentC),
  SET_LOG_OUT(state) {
    state.currentCustomer = null;
  },
  SET_STATUS:(state,status)=>(state.loggedIn = status)
};

export default {
  state,
  getters,
  actions,
  mutations,
};
