<template>
  <div
    class="w-25 d-flex flex-column rounded bg-light shadow-lg position-absolute top-100 end-0 me-2 mt-2 p-2"
  >
    <div class="w-100 d-flex flex-row justify-content-between">
      <router-link to="/" class="d-flex w-50 m-0 p-0">
        <img
          src="../../assets/recette_logo.svg"
          alt=""
          class="logo img-fluid w-50 m-0 p-0"
        />
      </router-link>

      <button
        class="btn btn-outline-danger border-1 rounded bg-light text-danger"
        @click="logOut"
      >
        Sign out
      </button>
    </div>
    <div class="w-100 d-flex flex-row mt-2">
      <div class="w-25">
        <img
          src="../../assets/man.png"
          alt=""
          class="contain rounded-circle profile p-2 w-100"
        />
      </div>
      <div class="w-75 d-flex flex-column jcc ms-3">
        <p class="text-dark fs-5 m-0">{{ userDetails.username }}</p>
        <p class="text-secondary fs-6">{{ userDetails.email }}</p>
        <button class="btn btn-outline-primary fs-sm w-100 rounded">Manage account</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      user: "",
    };
  },
  methods: {
    logOut() {
      this.$store.dispatch("logout");
    },
  },
  computed: {
    userDetails() {
      if (this.$store.state.isAuthenticated) {
        this.user = this.$store.state.user;
        return this.user;
      }
    },
  },
};
</script>

<style lang="scss" scoped></style>
