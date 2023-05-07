<template>
  <div class="vh-100 mb-4 d-flex flex-column align-items-center ">
    <div class="w-75 py-4">
      <p class="fs-5">500 discovered Results</p>
    </div>
    <div class="grid w-75">
      <div class="w-100 vh-40 position-relative">
        <img src="../../assets/pancakes.jpg" alt="" class=" w-100 h-50 cover">
        <div class="w-100 h-50 d-flex flex-column px-3 py-1 bg-dark text-light">
            <div class="w-100 d-flex flex-row mb-2">
                <span class="primary-text text-capitalize fs-sm">RECIPE |</span>
                <span class="text-capitalize ms-2 fs-sm">BY JON DOE</span>
            </div>
            <h4 class="fs-5 text-capitalize">
                Fried Beef with Watercress Salad
            </h4>
        </div>
        <div class="position-absolute w-100 bottom-0 ps-3">
            <p class="text-secondary">
                5/5 STARS
            </p>
        </div>
      </div>
      
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style lang="css" scoped>
.grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 1em;
}
.show {
  outline: 1px dotted red;
}
</style>
