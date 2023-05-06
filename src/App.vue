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
  <RouterView />
</template>

<style scoped></style>
