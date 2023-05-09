<template>
  <nav
    class="navbar top-0 navbar-light bg-light w-100 m-0 p-0 d-flex flex-row justify-content-between"
  >
    <div class="navbar-brand w-25 p-0 m-0">
      <router-link to="/" class="d-flex w-75 m-0 p-0">
        <img
          src="../assets/recette_logo.svg"
          alt=""
          class="logo img-fluid w-50 m-0 p-0"
        />
      </router-link>
    </div>
    <div class="w-75 d-flex justify-content-between">
      <div class="nav-links w-50">
        <ul class="navbar-nav d-flex flex-row justify-content-between">
          <li>
            <router-link class="nav-link active" to="/">Home</router-link>
          </li>
          <li>
            <router-link class="nav-link" to="/recipes">Recipes</router-link>
          </li>
          <li>
            <router-link class="nav-link" to="/cookbook"
              >My CookBook</router-link
            >
          </li>
          <li>
            <router-link class="nav-link" to="/recette-creator"
              >Add Recipes</router-link
            >
          </li>
        </ul>
      </div>
      <div class="nav-button w-25 d-flex flex-row justify-content-center">
        <button class="btn-nav btn btn-outline-dark px-4">
          <i class="fa-solid fa-right-to-bracket pe-2"></i> Sign In
        </button>
      </div>
    </div>
  </nav>
</template>

<script lang="ts">
export default {};
</script>

<style lang="css" scoped>
.navbar {
  border-bottom: 2px solid #ff5400;
}
.logo {
  /* height: 5vw !important; */
  object-fit: contain;
}
.btn-nav {
  border-radius: 0;
}
.btn-nav:hover {
  border: #ff5400;
  background-color: #ff5400;
}
</style>
