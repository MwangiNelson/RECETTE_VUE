<script setup>
import "bootstrap/dist/css/bootstrap.css";
import Navbar from "./components/Navbar.vue";
import Footer from "./components/Footer.vue";
import Auth from "./screens/Auth.vue";
import { ref } from "vue";
import { store } from "./store";

components: {
  Navbar;
  Footer;
  Auth;
}
let isAuthenticated = ref(store.state.isAuthenticated);

let authOpen = ref(false);

function toggleAuth() {
  authOpen.value = !authOpen.value;
  console.log(authOpen.value);
}
</script>

<template>
  <Navbar @open-auth="toggleAuth" />
  <Auth v-show="!isAuthenticated && authOpen" @close-auth="toggleAuth" />
  <div class="w-100 d-flex justify-content-center">
    <RouterView />
  </div>
  <Footer />
</template>

<style scoped></style>
