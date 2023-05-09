<script setup>
import "bootstrap/dist/css/bootstrap.css";
import "bootstrap/dist/css/bootstrap.css";
import Navbar from "./components/Navbar.vue";
import Footer from "./components/Footer.vue";

components: {
  Navbar;
  Footer;
}
</script>

<template>
  <Navbar />
  <div class="w-100 d-flex justify-content-center">
    <RouterView />
  </div>
  <Footer />
</template>

<style scoped></style>
