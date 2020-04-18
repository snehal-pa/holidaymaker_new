import { fetch2,fetch3 } from "@/helper";

const state = {
    customers: [],
    logIn : true
 };

const getters = {
  allCustomers: state => state.customers
};

const actions = {
    async getCustomers({commit}){
        const fetchedCustomers = await fetch2("room");
        commit('setCustomers',fetchedCustomers);
    },

    async addCustomer({commit},customer){
        commit('addNewCustomer',await fetch3(customer))
    }
    
};

const mutations = {
    setCustomers :(state,customers)=>(state.customers=customers),
    addNewCustomer:(state,newCust)=> state.customers.push(newCust)
};

export default {
  state,
  getters,
  actions,
  mutations
};
