import { fetch2,fetch3 } from "@/helper";

const state = {
    customers: [],
    currentCustomer:null
    //logIn : true
 };

const getters = {
  allCustomers: state => state.customers,
  getCurrentCustomer: state => state.currentCustomer
};

const actions = {
    async getCustomers({commit}){
        const fetchedCustomers = await fetch2("customer");
        commit('setCustomers',fetchedCustomers);
    },

    async addCustomer({commit},customer){
        commit('addNewCustomer',await fetch3(customer))
    }
    
};

const mutations = {
    setCustomers :(state,customers)=>(state.customers=customers),
    addNewCustomer:(state,newCust)=> state.customers.push(newCust),
    SET_CURRENT_CUSTOMER:(state,currentC)=> state.currentCustomer =currentC
};

export default {
  state,
  getters,
  actions,
  mutations
};
