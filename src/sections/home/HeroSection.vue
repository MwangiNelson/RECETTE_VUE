<template>
  <section class="w-100 vh-100 bg-light d-flex flex-column">
    <div class="h-75 w-100 d-flex flex-row b-or">
      <div
        class="w-50 h-100 d-flex flex-column justify-content-center align-items-center"
      >
        <h1 class="display-2 w-75">Elevate Your Culinary Game</h1>
        <p class="w-75 py-3">
          Start cooking today and experience the joy of creating delicious meals
          that your family and friends will love!
        </p>
        <div class="w-75 d-flex flex-row my-4">
          <router-link to="/recipes">
            <button
              :class="`btn py-3 px-4 ${
                hoveredState ? 'btn-hero text-light' : 'border'
              }`"
              @mouseenter="hoveredState = true"
            >
              BROWSE RECIPES
            </button></router-link
          >
          <button
            :class="`btn py-3 px-4 ms-4 d-flex flex-row align-items-center ${
              hoveredState ? 'border' : 'btn-hero text-light'
            }`"
            @mouseenter="hoveredState = false"
          >
            <i class="fa-solid fa-circle-plus fs-lg me-2"></i>
            Share your recipe
          </button>
        </div>
      </div>
      <div class="w-50 h-100">
        <img
          src="../../assets/hero_img.jpg"
          class="hero-img w-100 h-100"
          alt=""
        />
      </div>
    </div>
    <div class="w-100 b-or row m-0 py-2">
      <div
        class="col align-items-center d-flex flex-column justify-content-center"
      >
        <h2 class="display-4 c-y">200+</h2>
        <p>Recipes</p>
      </div>
      <div
        class="col align-items-center d-flex flex-column justify-content-center"
      >
        <h2 class="display-4 c-y">100+</h2>
        <p>Users</p>
      </div>
      <div
        class="col align-items-center d-flex flex-column justify-content-center"
      >
        <h2 class="display-4 c-y">10+</h2>
        <p>Cook points</p>
      </div>
      <div
        class="col align-items-center d-flex flex-column justify-content-center"
      >
        <h2 class="display-4 c-y">100+</h2>
        <p>Recommenadations</p>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  data() {
    return {
      hoveredState: true,
    };
  },
};
</script>

<style lang="css" scoped>
.hero-text {
  font-weight: 600 !important;
  font-size: 5em;
}
.btn-hero {
  background-color: #ff5400;
  transition: transform 0.5s ease;
}
.btn-hero:hover {
  color: white;
}
.hero-img {
  object-fit: cover;
  object-position: center;
}
</style>
