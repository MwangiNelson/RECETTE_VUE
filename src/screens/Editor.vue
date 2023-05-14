<template>
  <section
    class="d-flex bg-light w-100 position-relative align-items-end justify-content-end"
  >
    <div class="w-25 d-flex h-100 position-absolute top-0 start-0">
      <img src="../assets/hero-img.jpg" alt="" class="cover w-100 h-100" />
    </div>
    <div class="w-75 d-flex flex-column p-4 position-relative">
      <Loader v-if="loading" />
      <div class="w-100 d-flex flex-column px-4">
        <h3 class="display-5 text-capitalize f-roboto">Share your recipe</h3>
        <p class="fs-sm my-3 text-dark">
          Share your favorite recipe with the world! Fill out the form below
          with all the necessary information, including the name, ingredients,
          instructions, and a mouth-watering photo. We can't wait to see what
          you come up with!
        </p>
        <span class="w-100 border-bottom border-2"></span>
      </div>
      <div class="d-flex w-100 my-4">
        <form class="w-100 d-flex flex-column px-4">
          <div class="w-100 d-flex flex-column">
            <label for="" class="mb-2">Enter your recipe title here</label>
            <div
              class="w-100 d-flex flex-row jcc aic text-secondary border ps-4 border-1"
            >
              <i class="fa-solid fa-pen me-3"></i>
              <input
                v-model="title"
                type="text"
                class="form-control bg-light text-dark fs-4 shadow-0 border-0"
                placeholder="Add title here"
              />
            </div>
          </div>
          <div class="w-100">
            <label for="" class="mb-2">Add a banner photo here</label>
            <div
              class="border border-2 overflow-auto d-flex flex-column jcc aic border-dotted rounded-3 vh-25 border-primary"
            >
              <input
                type="file"
                ref="photoUpload"
                accept="image/*"
                class="display-none"
                @change="displayUploadedImg"
              />
              <div
                class="w-100 d-flex rounded-3 bg-active flex-column jcc aic h-100"
                v-if="photo == null"
              >
                <i class="fa-solid fa-upload"></i>
                <p class="fs-4 f-roboto text-secondary my-0">
                  Click here to upload photo
                </p>

                <button
                  class="btn btn-outline-primary rounded my-2"
                  @click.prevent="uploadPhoto"
                >
                  Upload photo
                </button>
              </div>
              <div
                v-else
                class="w-50 position-relative"
                @mouseenter="hoveredState = true"
                @mouseleave="hoveredState = false"
              >
                <div
                  v-if="hoveredState"
                  class="w-100 h-100 bg-transluscent position-absolute"
                >
                  <button
                    v-if="hoveredState"
                    @click.prevent="
                      () => {
                        photo = null;
                      }
                    "
                    class="btn btn-outline-danger position-absolute top-50 start-50 translate-middle rounded-2"
                  >
                    <i class="fa-solid fa-trash-can me-2"></i> Remove photo
                  </button>
                </div>
                <img :src="photo" class="w-100 h-100 cover" alt="" />
              </div>
            </div>
          </div>
          <div class="w-100 d-flex flex-column my-2">
            <label for="" class="mb-2">What ingredients do I need?</label>
            <div
              class="w-100 d-flex flex-column jcc aic text-secondary border ps-4 border-1"
            >
              <form class="w-100 d-flex jcc aic">
                <i class="fa-solid fa-plus me-3"></i>
                <input
                  v-model="ingredient"
                  type="text"
                  class="form-control bg-light text-dark fs-5 shadow-0 border-0 f-roboto"
                  placeholder="Add ingredients here"
                />
                <button
                  @click.prevent="addIngredient"
                  class="btn btn-secondary me-2 rounded-1"
                >
                  ADD
                </button>
              </form>
            </div>
            <div class="w-100 border vh-25 border-1 my-2 overflow-auto">
              <div class="w-100 px-4 py-3" v-if="ingredients.length == 0">
                <p class="fs-md f-roboto">Your ingredients will appear here</p>
              </div>
              <div class="w-100 d-flex flex-row flex-wrap p-2 g-3" v-else>
                <span
                  class="bg-secondary p-2 px-3 d-flex jcc aic text-light rounded rounded-5 text-capitalize w-fit"
                  v-for="(item, index) in ingredients"
                  :key="index"
                >
                  {{ item }}
                  <button
                    class="btn btn-outline-light border-0 p-0 px-1 m-0 ms-3"
                    type="button"
                    @click.prevent="popIngredient(index)"
                  >
                    <i class="fa-solid fa-xmark"></i>
                  </button>
                </span>
              </div>
            </div>
          </div>
          <div class="w-100 d-flex flex-column my-2">
            <label for="" class="mb-2">What is the procedure?</label>
            <div
              class="w-100 d-flex flex-row jcc align-items-start p-1 text-secondary border border-1"
            >
              <textarea
                type="text"
                rows="7"
                v-model="procedure"
                class="form-control bg-light f-roboto text-dark fs-6 shadow-0 border-0"
                placeholder="Write your process here"
              />
            </div>
          </div>
          <div
            class="w-100 d-flex flex-row align-items-end justify-content-end"
          >
            <button
              class="btn btn-primary text-uppercase px-3 rounded-1"
              @click.prevent="submitRecipe"
            >
              Submit recipe
              <i class="fa-solid fa-paper-plane ms-3"></i>
            </button>
          </div>
        </form>
      </div>
    </div>
  </section>
</template>

<script>
import notification from "../notification";
import uploadPhotoSyntax from "../uploadPhoto";
import axios from "axios";
import Loader from "../components/Loader.vue";
export default {
  data() {
    return {
      title: "",
      ingredients: [],
      ingredient: "",
      procedure: "",
      photo: null,
      hoveredState: false,
      loading: false,
    };
  },
  components: {
    Loader,
  },
  methods: {
    addIngredient() {
      if (this.ingredient.trim() == "") {
        notification("Please enter an ingredient!", "#ffc107");
        return;
      }
      if (this.ingredients.includes(this.ingredient.toLowerCase())) {
        notification("This ingredient already exists", "#ffc107");
        return;
      }
      this.ingredients.push(this.ingredient.toLowerCase());
      this.ingredient = "";
    },
    popIngredient(index) {
      this.ingredients.splice(index, 1);
    },
    uploadPhoto() {
      this.$refs.photoUpload.click();
    },
    displayUploadedImg(event) {
      const file = event.target.files[0];
      const reader = new FileReader();

      reader.onload = (event) => {
        this.photo = event.target.result;
      };

      reader.readAsDataURL(file);
    },
    clearEverything() {
      this.title = "";
      this.photo = null;
      this.procedure = "";
      this.ingredients = [];
    },
    sendToApi(recipeData) {
      axios
        .post(`${this.$store.state.url_header}api/tests`, recipeData)
        .then((res) => {
          this.clearEverything();
          notification("Recipe has been uploaded successfully", "#45dd91");
          this.loading = false;
        })
        .catch((err) => {
          notification(`${err}`, "#fb4d4d");
          this.loading = false;
          console.log(recipeData);
          return false;
        });
    },
    validateData(obj) {
      for (let key in obj) {
        if (typeof obj[key] === "string" && obj[key].length === 0) {
          return false;
        }
      }
      return true;
    },
    submitRecipe() {
      //check if theres an uploaded photo
      if (this.photo == null) {
        notification(`Please upload a photo.`, "#ffc107");
        return;
      }
      this.loading = true;
      let image = this.$refs.photoUpload.files[0];
      let filename = image.name;
      let image_url;

      let inputs = {
        title: this.title,
        author: this.$store.state.user.username,
        likes: 0,
        desc: this.procedure,
        ingredients: this.ingredients.join("|"),
      };

      if (this.validateData(inputs) == false) {
        notification(`Please fill all the fields.`, "#ffc107");
        this.loading = false;
        return;
      }
      //upload photo to firestore database and get it's url
      uploadPhotoSyntax(image, filename)
        .then((url) => {
          image_url = url;

          let recipeData = {
            title: this.title,
            author: this.$store.state.user.username,
            likes: 0,
            desc: this.procedure,
            ingredients: this.ingredients.join("|"),
            url: image_url,
          };

          //Empty validation for the data

          this.sendToApi(recipeData);
        })
        .catch((err) => {
          console.error(err);
        });
    },
  },
};
</script>

<style lang="scss" scoped></style>
