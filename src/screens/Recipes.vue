<template>
  <section class="w-100">
    <Search />
    <Display />
  </section >
</template>

<script lang="ts">
import Search from "../sections/recipes/Search.vue";
import Display from "../sections/recipes/Display.vue"
export default {
  components: {
    Search,
    Display
  },
  meta: {
    transition: 'fade'
  }
};
</script>

<style lang="scss" scoped></style>
