<template>
  <div>
    <div v-if="logIn" id="login" class="border border-warning my-3 w-xs-100 w-50">
      <form action class="my-form">
        <p class=" h4 text-center mb-4">Log in</p>
        <span v-if="emailNotFound">Wrong email-id</span>
        <!-- Email address -->
        <div class="md-form">
          <i class="fas fa-envelope prefix pr-2"></i>
          <label for="emailExample">E-mail address</label>
          <input type="email" id="emailExample" class="form-control" v-model="loginUser.email" />
        </div>
        <br />
        <!-- Password -->
        <div class="md-form">
          <i class="fas fa-lock prefix pr-2"></i>
          <label for="passwordExample">Password</label>
          <input
            type="password"
            id="passwordExample"
            class="form-control"
            v-model="loginUser.password"
          />
        </div>
        <div  class="text-center mt-4">
          <button class="btn btn-lg"  @click="springSignIn">Login</button>
        </div>
        <router-link v-if="found" to="/booking">go to your reservation</router-link>

        <hr class="bg-warning mt-5" />
        <div class="d-flex justify-content-end">
          <p class="mr-2 mt-2">Not a member?</p>
          <button type="button" @click="logIn=false">Sign up</button>
        </div>
      </form>
    </div>
    <div v-if="!logIn">
      <Signup :errors="errors" :signUpUser="signUpUser" :checkForm="checkForm"></Signup>
    </div>
    <div v-if="showLoginButton">
      <hr class="bg-warning mt-5" />
      <P>Hey {{registeredFirstName}}! Welcome to Holiday-maker</P>
      <button type="button" class="btn btn-outline-warning" @click="showLoginPage">Log in</button>
    </div>
  </div>
</template>

<script>
import { springLogin, fetch2 } from "@/helper";

import Signup from "@/components/Signup";
import { mapState, mapGetters, mapActions, mapMutations } from "vuex";

export default {
  components: {
    Signup
  },

  computed: {
    ...mapState(["customers"]),
    ...mapGetters(["allCustomers", "getCheckedFacilities"])
  },

  data() {
    return {
      logIn: true,
      errors: [],
      showLoginButton: false,
      registeredFirstName: "",
      emailNotFound: false,
      found:false,

      loginUser: {
        email: "",
        password: ""
      },

      signUpUser: {
        firstName: "",
        lastName: "",
        email: "",
        password: ""
      }
    };
  },
  methods: {
    ...mapActions(["getCustomers", "addCustomer", "addToBookingStore"]),
    ...mapMutations(["SET_CUST_ID", "SET_CURRENT_CUSTOMER"]),

    async springSignIn(e) {
      e.preventDefault();
      const customer = await fetch2("customer/" + this.loginUser.email);
      if (customer != null) {
        springLogin(this.loginUser.email, this.loginUser.password);
        this.SET_CUST_ID(customer.id);
        this.SET_CURRENT_CUSTOMER(customer);
        this.found =true
      } else {
        this.emailNotFound = true;
      }
    },

    checkForm(e) {
      e.preventDefault();

      if (
        this.signUpUser.firstName != "" &&
        this.signUpUser.email != "" &&
        this.signUpUser.password != ""
      ) {
        this.showLoginButton = true;
        this.registerThisCustomer();
        this.registeredFirstName = this.signUpUser.firstName;
        this.clearForm();

        return true;
      }
      this.errors = [];

      if (this.signUpUser.firstName == "") {
        this.errors.push("Name required.");
      }
      if (this.signUpUser.email == "") {
        this.errors.push("Email required.");
      }
      if (this.signUpUser.password == "") {
        this.errors.push("Password required.");
      }
    },

    registerThisCustomer() {
      const newCustomer = {
        firstName: this.signUpUser.firstName,
        lastName: this.signUpUser.lastName,
        email: this.signUpUser.email,
        password: this.signUpUser.password
      };
      this.addCustomer(newCustomer);
      console.log("Hey " + this.signUpUser.firstName + " you are registered");
      /*e.preventDefault();*/
    },

    showLoginPage(e) {
      e.preventDefault();
      this.logIn = true;
      this.showLoginButton = false;
    },

    clearForm() {
      (this.signUpUser.firstName = ""),
        (this.signUpUser.lastName = ""),
        (this.signUpUser.email = ""),
        (this.signUpUser.password = "");
    }

   }
};
</script>

<style scoped>
#login {
  width: 500px;
  margin: auto;
  padding: 20px;
}
</style>