<script setup>
import "bootstrap/dist/css/bootstrap.css";
import "bootstrap/dist/css/bootstrap.css";
import Navbar from "./components/Navbar.vue";

components: {
  Navbar;
}
</script>

<template>
  <Navbar />
  <div class="w-100 d-flex justify-content-center">
    <RouterView />
  </div>
  
</template>

<style scoped></style>
