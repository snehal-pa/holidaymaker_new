<template>
  <div id="app" class="page corners padding transp">
    <header>
      <nav class="nav flex-column flex-sm-row">
        <router-link to="/" class="flex-sm-fill flex-grow-1 text-sm-center nav-link active">
          <h1>Holiday-maker</h1>
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
import { mapState } from "vuex";
export default {
  computed: {
    ...mapState(["logIn"])
  }
};
</script>

<style src="@/styles/style.css">
</style>
