<template>
  <div
    class="container bg-light w-100 h-75 shadow-lg rounded-2 d-flex flex-column aic px-4 py-4"
  >
    <h2 class="display-6 f-roboto">Create an account</h2>
    <p class="f-roboto fs-5 text-dark">Sign up now and unlock new features.</p>
    <form class="w-75 h-100 d-flex flex-column">
      <div class="w-100 d-flex flex-column">
        <label for="" class="mb-2">Your name</label>
        <div
          class="w-100 d-flex flex-row rounded-2 jcc aic text-secondary border ps-4 border-1"
        >
          <i class="fa-solid fa-user me-3"></i>
          <input
            v-model="name"
            type="text"
            class="form-control bg-light text-dark shadow-0 border-0 py-2 text-capitalize"
            placeholder="eg. Nelson Kamau"
          />
        </div>
      </div>
      <div class="w-100 d-flex flex-column">
        <label for="" class="mb-2">Email</label>
        <div
          class="w-100 d-flex flex-row rounded-2 jcc aic text-secondary border ps-4 border-1"
        >
          <i class="fa-solid fa-envelope me-3"></i>
          <input
            v-model="email"
            type="text"
            class="form-control bg-light text-dark shadow-0 border-0 py-2"
            placeholder="eg. you@gmail.com"
          />
        </div>
      </div>
      <div class="w-100 d-flex flex-column">
        <label for="" class="mb-2">Password</label>
        <div
          class="w-100 d-flex flex-row rounded-2 jcc aic text-secondary border ps-4 border-1"
        >
          <i class="fa-solid fa-lock me-3"></i>
          <input
            v-model="password"
            type="password"
            class="form-control bg-light text-dark shadow-0 border-0 py-2"
            placeholder="**********"
          />
        </div>
      </div>
      <div class="w-100 d-flex flex-column">
        <label for="" class="mb-2">Confirm password</label>
        <div
          class="w-100 d-flex flex-row rounded-2 jcc aic text-secondary border ps-4 border-1"
        >
          <i class="fa-solid fa-circle-exclamation me-3"></i>
          <input
            v-model="password_conf"
            type="password"
            class="form-control bg-light text-dark shadow-0 border-0 py-2"
            placeholder="**********"
          />
        </div>
      </div>
      <div class="w-100 d-flex flex-column jcc py-3 aic">
        <button
          class="btn btn-primary w-100 rounded"
          @click.prevent="signUpUser"
        >
          SIGN UP
        </button>
        <button
          class="btn btn-light w-100 rounded d-flex jcc aic my-2 border-0"
          type="button"
          @click.prevent="toggleView"
        >
          Already have an account?
          <p class="p-0 ms-1 m-0 text-primary">Sign in</p>
        </button>
      </div>
    </form>
  </div>
</template>

<script lang="ts">
import notification from "../../notification";
export default {
  data() {
    return {
      name: "",
      email: "",
      password: "",
      password_conf: "",
    };
  },
  methods: {
    toggleView() {
      this.$emit("toggle-view");
    },
    signUpUser() {
      if (this.password !== this.password_conf) {
        notification("Password mismatch!", "#ffc107");
        return;
      }

      this.$store.dispatch("register", {
        username: this.name,
        email: this.email,
        password: this.password,
      });
    },
  },
};
</script>

<style lang="scss" scoped></style>
