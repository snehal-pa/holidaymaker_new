<template>
  <div id="app" class="page corners padding transp">
    <header>
      <nav class="nav flex-column flex-sm-row">
        <router-link to="/" class="flex-sm-fill flex-grow-1 text-sm-center nav-link active">
        <div> 
          <h1>Bream & Hall</h1>
        </div>
          
          
        </router-link>
        <router-link to="/allrooms" class="text-sm-right nav-link">All rooms</router-link>
        <router-link to="/about" class="text-sm-right nav-link">About us</router-link>
        <router-link to="/contact" class="text-sm-right nav-link">Contact us</router-link>
        <router-link v-if="getStatus==true" to="/cart" class="text-sm-right nav-link">My booking(s)</router-link>
        <router-link v-if="getStatus==false" to="/signin" class="text-sm-right nav-link">Login</router-link>
      </nav>
      <nav class="d-flex justify-content-end" v-if="getStatus== true">
        <router-link to="/signin">
          <p class="text-warning">
            <i class="fas fa-user"></i>
            {{getLoggedinUser.firstName}} {{getLoggedinUser.lastName}}
          </p>
        </router-link>
        <router-link to="/logout" class="mx-4">
          <p>Logout</p>
        </router-link>
      </nav>
    </header>
    <hr class="bg-warning" />

    <main>
      <router-view />
    </main>
  </div>
</template>
<script>
import { mapState,mapGetters, mapMutations } from "vuex";
export default {
  computed: {
    ...mapState([]),
    ...mapGetters(["getLoggedinUser","getStatus"])
  },
  mounted() {
    this.getLoggedinUser;
  },
  method: {
    ...mapMutations(["SET_LOGGED_IN_USER"]),

    async logOut(e) {
      e.preventDefault();
      let response = await fetch("http://localhost:2020/logout");
      response = await response.json();
      this.SET_LOGGED_IN_USER(response);
      this.getLoggedinUser;
    }
  }
};
</script>

<style src="@/styles/style.css">
</style>
