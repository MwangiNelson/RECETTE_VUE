<template>
  <section class="w-100 d-flex flex-column">
    <div class="w-100 bg-dark">
      <router-link to="/recipes"
        ><button class="btn btn-dark w-25">
          <i class="fa-solid fa-arrow-left me-3"></i> BACK
        </button></router-link
      >
    </div>
    <div class="w-100 vh-75 bg-light border-bottom border-3">
      <div class="w-100 h-100 row m-0 p-0">
        <div
          class="col w-50 h-100 m-0 p-0 d-flex flex-column align-items-center justify-content-center"
        >
          <div
            class="px-2 py-1 border-0 primary-bg d-flex mb-4 text-light align-items-center justify-content-center"
          >
            BON APPETIT
          </div>
          <div
            class="w-100 d-flex flex-column align-items-center my-4 justify-content-center"
          >
            <h2 class="fs-2 w-75 text-center text-capitalize mb-4">
              {{ recipe.title }}
            </h2>
            <p class="fs-md text-uppercase m-0">BY {{ recipe.author }}</p>
            <p class="fs-sm text-secondary">
              {{ formatDate(recipe.created_at) }}
            </p>

            <button
              :class="`${
                !hoveredState ? 'text-secondary' : 'text-dark'
              } btn btn-light px-4 py-2 mt-4 border border-2 align-items-center d-flex`"
              @mouseenter="hoveredState = true"
              @mouseleave="hoveredState = false"
              @click.prevent="saveRecipe"
            >
              <i class="fa-solid fa-bookmark me-3 fs-3"></i>
              SAVE RECIPE
            </button>
          </div>
        </div>
        <div class="col w-50 m-0 h-100 p-0">
          <img
            :src="recipe.image_url"
            class="w-100 h-100 cover m-0 p-0"
            alt=""
          />
        </div>
      </div>
    </div>
    <div class="w-100 bg-light d-flex justify-content-center">
      <div class="w-75 d-flex flex-column pt-4">
        <div class="w-75 pt-4 d-flex flex-column">
          <h1 class="fs-3">Inspiration</h1>
          <span class="w-100 mb-2 b-or"></span>
          <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Cum porro
            consequatur amet natus expedita. Amet sit quos quia asperiores id,
            voluptatem iste libero inventore cupiditate quasi consequuntur
            molestias! Architecto accusamus at consectetur minima facilis
            eligendi ad error nisi itaque reprehenderit, suscipit molestiae
            officiis omnis nostrum ex repudiandae ipsum nam dolores culpa. Fugit
            dignissimos deleniti, quas unde ducimus, perspiciatis, ipsam aut
            sequi veritatis nam eaque quidem nostrum! Et sequi suscipit
            architecto provident recusandae. Unde accusamus eligendi animi
            perspiciatis. Unde in dolorum possimus officia dolor, blanditiis
            libero maiores similique voluptates ad doloribus, laborum vitae
            rerum quisquam alias velit et?
          </p>
        </div>
        <div class="w-75 pt-4 d-flex flex-column">
          <h1 class="fs-3">Ingredients</h1>
          <span class="w-100 mb-2 b-or"></span>
          <ul class="list-group">
            <li
              class="list-item"
              v-for="(item, index) in ingredients"
              :key="index"
            >
              {{ item }}
            </li>
          </ul>
        </div>
        <div class="w-75 pt-4 d-flex flex-column">
          <h1 class="fs-3">Procedure</h1>
          <span class="w-100 mb-2 b-or"></span>
          <ul class="list-group mb-4">
            <li v-for="(item, index) in desc" :key="index">
              {{ item }}
            </li>
          </ul>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import axios from "axios";
import notification from "../../notification";
export default {
  data() {
    return {
      id: sessionStorage.getItem("id"),
      recipe: [],
      ingredients: [],
      desc: [],
      hoveredState: false,
    };
  },
  methods: {
    getRecipe() {
      axios
        .get(
          `${this.$store.state.url_header}recipes/${sessionStorage.getItem(
            "id"
          )}`
        )
        .then((res) => {
          this.recipe = res.data.data;
          this.ingredients = this.recipe.ingredients
            .replace(/;/g, " -")
            .split("|");
          this.desc = this.recipe.description.split(".");
          console.log(this.ingredients);
        });
    },
    formatDate(dateString) {
      const months = [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December",
      ];

      const date = new Date(dateString);
      const month = months[date.getMonth()];
      const day = date.getDate();
      const year = date.getFullYear();

      return `${month} ${day}, ${year}`;
    },
    saveRecipe() {
      const data = {
        username: this.$store.state.user.username,
        recipe_id: sessionStorage.getItem("id"),
      };
      axios.post(`${this.$store.state.url_header}recipe/addToCookBook`, data)
        .then((res)=>{
          sessionStorage.setItem('savedRecipes',res)
          notification("Recipe has been added to your cookbook", "#45dd91");
        }).catch((err)=>{
          notification(`${err}`,'#fd4d4d')
        })
    },
  },
  mounted() {
    this.getRecipe();
  },
};
</script>

<style lang="css" scoped>
.list-group {
  list-style-type: none;
}
</style>
