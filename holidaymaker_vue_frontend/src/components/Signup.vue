<template>
  <div id="signUp" class="border border-warning my-3 w-50">
    <form>
      <p class="h4 text-center mb-4">Sign up</p>
      <div v-if="errors.length">
        <b>please correct the error(s):</b>
        <ul>
          <li v-for="error in errors" :key="error">{{error}}</li>
        </ul>
      </div>
      <div class="d-flex justify-content-between">
        <div>
          <label for="defaultFormRegisterFirstNameEx" class="grey-text">Your Firstname</label>
          <input
            type="text"
            id="defaultFormRegisterFirstNameEx"
            class="form-control"
            v-model="signUpUser.firstName"
          />
        </div>
        <div>
          <label for="defaultFormRegisterLastNameEx" class="grey-text">Your Lastname</label>
          <input
            type="text"
            id="defaultFormRegisterLastNameEx"
            class="form-control"
            v-model="signUpUser.lastName"
          />
        </div>
      </div>
      <br />
      <label for="defaultFormRegisterEmailEx" class="grey-text">Your email</label>
      <input
        type="email"
        id="defaultFormRegisterEmailEx"
        class="form-control"
        v-model="signUpUser.email"
      />
      <br />
      <label for="defaultFormRegisterPasswordEx" class="grey-text">Your password</label>
      <input
        type="password"
        id="defaultFormRegisterPasswordEx"
        class="form-control"
        v-model="signUpUser.password"
      />
      <div class="text-center mt-4">
        <button class="btn btn-warning btn-lg" type="submit" @click="checkForm">Register</button>
      </div>
    </form>
  </div>
</template>
<script>
export default {
  props: ["errors", "signUpUser", "checkForm"]
};
</script>
<style scoped>
#signUp {
  width: 500px;
  margin: auto;
  padding: 20px;
}
</style>