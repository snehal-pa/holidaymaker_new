<template>
  <div id="app" class="page corners padding transp">
    <header>
      <nav class="nav flex-column flex-sm-row">
        <router-link to="/" class="flex-sm-fill flex-grow-1 text-sm-left nav-link active">
          <h1>Holiday-maker</h1>
        </router-link>
        <router-link to="/about" class="text-sm-right nav-link">About us</router-link>
        <router-link to="/contact" class="text-sm-right nav-link">Contact us</router-link>
        <router-link to="/login" class="text-sm-right nav-link">Login</router-link>
        <router-link to="/booking" class="text-sm-right nav-link">My Booking</router-link>


      </nav>
    </header>
    <hr class="bg-warning">

    <main>
      <router-view />
    </main>
  </div>
</template>

<script>
import {mapState} from "vuex"
export default {
  computed:{
    ...mapState(["logIn"])
  }
}
</script>

<style src="@/styles/style.css">
</style>
