<template>
  <div class="w-100 bg-warning d-flex flex-row">
    <div class="w-50">
      <img src="../assets/recette_logo.svg" class="w-50 img-cover" alt="" />
    </div>
    <div class="w-50 d-flex flex-column justify-content-center align-items-end">
      <form class="d-flex w-75">
        <input
          type="text"
          class="form-control w-75"
          placeholder="Subscribe to our newsletter...  (Coming soon)"
        />
        <button class="btn btn-primary rounded ms-1" @click.prevent="() => {}">
          Subscribe<i class="fa-solid fa-envelope ms-2"></i>
        </button>
      </form>
      <p class="text-dark w-75">
        ©RECETTE by Ld_sonn 2023. All rights reserved.
      </p>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style lang="scss" scoped></style>
