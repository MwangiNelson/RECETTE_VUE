<template>
  <div
    class="container bg-light w-100 shadow-lg rounded-2 d-flex flex-column aic px-4 py-4"
  >
    <h2 class="display-6 text-dark f-roboto">Welcome back!</h2>
    <p class="f-roboto fs-5">Resume your journey.</p>
    <div class="w-75 b-or mb-4"></div>
    <form class="w-75 h-100 d-flex flex-column jcc aic">
      <div class="w-100 d-flex flex-column">
        <label for="" class="mb-2">Enter your email here</label>
        <div
          class="w-100 d-flex flex-row rounded-2 jcc aic text-secondary border ps-4 border-1"
        >
          <i class="fa-solid fa-envelope me-3"></i>
          <input
            v-model="email"
            type="text"
            class="form-control bg-light text-dark shadow-0 border-0 py-2"
            placeholder="example@gmail.com"
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

      <div class="w-100 d-flex flex-column jcc py-3 aic">
        <button class="btn btn-primary w-100 rounded" @click.prevent="login">
          SIGN UP
        </button>
        <button
          class="btn btn-light w-100 rounded d-flex jcc aic my-2 border-0"
          type="button"
          @click.prevent="toggleView"
        >
          Don't have an account?
          <p class="p-0 ms-1 m-0 text-primary">Create one for free!</p>
        </button>
      </div>
    </form>
  </div>
</template>

<script lang="ts">
export default {
  data() {
    return {
      email: "",
      password: "",
    };
  },
  methods: {
    toggleView() {
      this.$emit("toggle-view");
    },
    login() {
      this.$store.dispatch("login", {
        email: this.email,
        password: this.password,
      });
    },
  },
};
</script>

<style lang="scss" scoped></style>
