<template>
  <div>
    <div v-if="logIn" id="login" class="border border-warning my-3 w-xs-100 w-50">
      <form v-if="!getStatus" class="my-form">
        <p class="h2 text-center mb-4">Log in</p>
        <h4 v-if="emailNotFound" class="text-center text-warning">Wrong Email or Password</h4>
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
        <div class="text-center mt-4">
          <button class="btn btn-lg" @click="signIn">Login</button>
        </div>

        <hr class="bg-warning mt-5" />
        <div class="d-flex justify-content-end">
          <p class="mr-2 mt-2">Not a member?</p>
          <button type="submit" @click="logIn=false">Sign up</button>
        </div>
      </form>
      <div v-if="getStatus">
        <h3>Hey {{getLoggedinUser.firstName}}, you are logged in</h3>
        <div v-if="getSelectedRoom">
          <router-link to="/booking" class="text-warning">Check your reservation</router-link>
        </div>
      </div>
    </div>
    <div v-if="!logIn">
      <div v-if="showWelcome">
        <P>Hey {{registeredFirstName}}! Welcome to Holiday-maker</P>
      </div>

      <Signup
        :errors="errors"
        :signUpUser="signUpUser"
        :checkForm="checkForm"
        :showLoginPage="showLoginPage"
      ></Signup>
    </div>
  </div>
</template>

<script>
//import { transformRequest } from "@/helper";
//import { fetch2 } from "@/helper";

import Signup from "@/components/Signup";
import { mapState, mapGetters, mapActions, mapMutations } from "vuex";

export default {
  components: {
    Signup
  },
  computed: {
    ...mapState(["customers"]),
    ...mapGetters(["allCustomers", "getLoggedinUser", "getSelectedRoom","getStatus"])
  },

  data() {
    return {
      logIn: true,
      errors: [],
      showWelcome: false,
      registeredFirstName: "",
      emailNotFound: false,
      currentUserLoggedIn: false,

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
    ...mapActions([
      "getCustomers",
      "addCustomer",
      "springLogin",
      "springLoginn"
    ]),
    ...mapMutations(["SET_LOGGED_IN_USER","SET_STATUS"]),

    async signIn(e) {
      e.preventDefault();
      

      const credentials = {
        email: this.loginUser.email,
        password: this.loginUser.password
      };

      let response = await fetch("http://localhost:2020/auth/login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(credentials)
      });
      try {
        let currentUser = await response.json();
        console.log(currentUser);
        this.SET_LOGGED_IN_USER(currentUser);
        this.SET_STATUS(true);
      } catch {
        this.emailNotFound = true;
        console.log("Wrong username/password");
      }

      /*let r = await fetch("http://localhost:2020/currentuser");
      const currentuser = await r.json();
      this.SET_LOGGED_IN_USER(currentuser);*/

      /*
      (with transformRequest)
      ---------------------------------------------------------------------------------------------------------*/
      /*
      await fetch("/login", {
        method: "POST",
        mode: "no-cors",
        body: transformRequest({
          username: this.loginUser.email,
          password: this.loginUser.password
        }),
        headers: { "Content-Type": "application/x-www-form-urlencoded" }
      }).then(function(response) {
        let successfulLogin = !response.url.includes("error");
        console.log("the login result is:", successfulLogin);
      });
      let user = await fetch("/rest/customer/currentuser", {
        mode: "no-cors",
        credentials: "include"
      });
      if (user.url.includes("error")) {
        this.emailNotFound = true;
        console.log("Wrong username/password");
      } else {
        user = await user.json();
        console.log(user);
        this.SET_LOGGED_IN_USER(user);
      }

      /* 
      ---------------------------------------------------------------------------------------------*/
      /*
      let username = this.loginUser.email;
      let password = this.loginUser.password;

      const credentials =
        "email=" +
        encodeURIComponent(username) +
        "&password=" +
        encodeURIComponent(password);

      let response = await fetch("http://localhost:2020/login", {
        method: "POST",
        mode:"no-cors",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: credentials
      });

      if (response.url.includes("error")) {
        console.log("Wrong username/password");
      }
      const user = await fetch2("customer/currentUser")
       this.SET_LOGGED_IN_USER(user);*/
       
    },

    checkForm(e) {
      e.preventDefault();

      if (
        this.signUpUser.firstName != "" &&
        this.signUpUser.email != "" &&
        this.signUpUser.password != ""
      ) {
        this.showWelcome = true;
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

    async registerThisCustomer() {
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
      this.showWelcome = false;
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
  /*width: 500px;*/
  margin: auto;
  padding: 20px;
}
</style>