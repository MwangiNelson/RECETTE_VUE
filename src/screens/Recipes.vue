<template>
  <section class="w-100">
    <Search />
    <Display :recipes = "recipes"/>
  </section>
</template>

<script lang="ts">
import axios from "axios";
import notification from "../notification";
import Search from "../sections/recipes/Search.vue";
import Display from "../sections/recipes/Display.vue";
export default {
  data() {
    return {
      recipes: [],
    };
  },
  components: {
    Search,
    Display,
  },
  methods: {
    getRecipes() {
      this.recipes = [];
      axios
        .get(`${this.$store.state.url_header}api/tests`)
        .then((res) => {
          this.recipes = res.data.data;
        })
        .catch((err) => {
          notification(`${err}`, "#fb4d4d");
        });
    },
  },
  mounted() {
    this.getRecipes();
  },
};
</script>

<style lang="scss" scoped></style>
