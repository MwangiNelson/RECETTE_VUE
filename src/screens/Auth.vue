<template>
  <div class="w-100 h-100 position-fixed bg-focus jcc aic">
    <div class="container position-relative w-50 d-flex jcc aic">
      <div class="position-absolute top-0 end-0 my-2 mx-4">
        <button
          class="btn btn-outline-dark border-1 rounded-1"
          @click="closeModule"
        >
          <i class="fa-solid fa-xmark"></i>
        </button>
      </div>
      <Login v-if="toggle" @toggle-view="toggleView" />
      <Register v-else @toggle-view="toggleView" />
    </div>
  </div>
</template>

<script>
import Login from "../sections/auth/Login.vue";
import Register from "../sections/auth/Register.vue";
export default {
  components: {
    Login,
    Register,
  },
  data() {
    return {
      toggle: true,
    };
  },
  methods: {
    toggleView() {
      this.toggle = !this.toggle;
    },
    closeModule() {
      this.$emit("closeAuth");
    },
  },
};
</script>

<style lang="css" scoped>
.bg-focus {
  background-color: rgba(221, 221, 221, 0.5);
  backdrop-filter: blur(5px);
  z-index: 9;
  top: 0;
  display: flex;
}
</style>
