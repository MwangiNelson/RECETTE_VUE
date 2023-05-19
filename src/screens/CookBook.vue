<template>
  <section
    :class="`w-100 jcc pt-4 d-flex flex-column p-3 ${
      loading || emptyState ? 'vh-100' : ''
    }`"
  >
    <div
      class="w-100 alert alert-warning rounded p-2 shadow-lg h-fit jcc aic d-flex flex-column"
      role="alert"
      v-if="loading || emptyState"
    >
      <div class="d-flex flex-column jcc aic" v-if="loading">
        <p>Fetching recipes ..</p>
        <Loader2 />
      </div>
      <div class="d-flex flex-row jcc aic" v-if="emptyState">
        <p class="m-0 me-2">{{ message }}</p>
        <button class="btn btn-outline-warning rounded" @click="browseRecipes">
          Browse Recipes?
        </button>
      </div>
    </div>

    <Display :recipes="recipes" />
  </section>
</template>

<script lang="ts">
import axios from "axios";
import notification from "../notification";
import Loader2 from "../components/Loader2.vue";
import Display from "../sections/recipes/Display.vue";
export default {
  data() {
    return {
      loading: true,
      recipes: [],
      emptyState: false,
      message: "",
    };
  },
  methods: {
    getSavedRecipes() {
      let userData = {
        email: this.$store.state.user.email,
      };
      axios
        .post(`${this.$store.state.url_header}recipe/getCookBook`, userData)
        .then((res) => {
          this.loading = false;
          this.recipes = res.data.data;
          let arr = this.recipes;
          if (arr.length == 0) {
            this.emptyState = true;
            this.message = "We found no recipes in your cookbook";
            return;
          }
        })
        .catch((err) => {
          this.loading = false;
          this.emptyState = true;
          this.message =
            "We were unable to retrieve your recipes at this time. Try again later";
          notification(`${err}`, "#fb4d4d");
          // this.$router.push("/recipes");
        });
    },

    browseRecipes() {
      this.$router.push("/recipes");
    },
  },
  mounted() {
    setTimeout(() => this.getSavedRecipes(), 1500);
  },
  components: {
    Display,
    Loader2,
  },
  computed: {},
};
</script>

<style lang="scss" scoped></style>
