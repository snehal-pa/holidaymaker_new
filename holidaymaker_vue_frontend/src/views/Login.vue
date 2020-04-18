<template>
  <div>
    <div v-if="logIn" id="login" class="border border-warning my-3 w-50">
      <form action class="my-form">
        <p class="h4 text-center mb-4">Log in</p>
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
          <button class="btn btn-warning btn-lg" type="submit" @click="springSignIn">Login</button>
        </div>
        <hr class="bg-warning mt-5" />
        <div class="d-flex justify-content-end">
        <p class="mr-2 mt-2">Not a member?</p>
        <button type="button" class="btn btn-outline-warning" @click="logIn=false">Sign up</button>

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
import { springLogin } from "@/helper";

import Signup from "@/components/Signup";
import { mapState,mapGetters,mapActions } from "vuex";

export default {
  components: {
    Signup
  },

  computed: {
    ... mapState(['customers']),
    ...mapGetters(['allCustomers','getCheckedFacilities'])
  },

  data() {
    return {
      logIn: true,
      errors: [],
      showLoginButton: false,
      registeredFirstName:"",

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
    ...mapActions(["getCustomers","addCustomer"]),

    springSignIn(e){
        e.preventDefault();
        springLogin(this.loginUser.email,this.loginUser.password);
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

    registerThisCustomer(){
      const newCustomer = { firstName: this.signUpUser.firstName, 
                            lastName:this.signUpUser.lastName,
                            email: this.signUpUser.email,
                            password: this.signUpUser.password

      }
      this.addCustomer(newCustomer);
      console.log("Hey " + this.signUpUser.firstName + " you are registered");
      /*e.preventDefault();*/
    },

    showLoginPage(e){
      e.preventDefault();
      this.logIn =true;
      this.showLoginButton=false;


    },

    clearForm(){
        this.signUpUser.firstName ="",
        this.signUpUser.lastName ="",
        this.signUpUser.email ="",
        this.signUpUser.password =""

    },

    /*login() {
      if (this.loginUser.email != "" && this.loginUser.password != "") {
        if (
          this.loginUser.email == this.$parent.mockAccount.username &&
          this.loginUser.password == this.$parent.mockAccount.password
        ) {
          this.$emit("authenticated", true);
          this.$router.replace({ name: "secure" });
        } else {
          console.log("The username and / or password is incorrect");
        }
      } else {
        console.log("A username and password must be present");
      }
    }*/
  }
};
</script>

<style scoped>
#login {
  width: 500px;
  margin: auto;
  padding: 20px;
}
#signUp {
  width: 500px;
  margin: auto;
  padding: 20px;
}
</style>