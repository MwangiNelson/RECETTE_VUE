<template>
  <section class="w-100 vh-100 bg-light row m-0 p-0">
    <div class="col d-flex justify-content-center">
      <div class="w-75 h-75 d-flex position-relative">
        <img
          src="../../assets/Picks.jpg"
          class="w-100 h-100 position-relative img-cover"
          alt=""
        />
        <div class="blur-photo w-100 h-100 position-absolute"></div>
        <div class="position-absolute bottom-0 d-flex flex-column w-100 p-4">
          <h4 class="text-light text-uppercase fs-1 goth">
            The key to the heart
          </h4>
          <p class="fs-6 text-secondary">
            "Cooking is all about people. Food is maybe the only universal thing
            that really has the power to bring everyone together." - Guy Fieri
          </p>
        </div>
      </div>
    </div>
    <div class="col h-75 d-flex flex-column">
      <div
        class="w-100 border-top border-bottom d-flex justify-content-center py-2"
      >
        <h2 class="display-2">Top Picks</h2>
      </div>
      <div class="grid m-0 w-100 h-100">
        <div class="container d-flex flex-column m-0 p-2 show">
          <img
            src="../../assets/hero-img.jpg"
            class="img-contain show m-0"
            alt=""
          />
        </div>
        <div class="container show"> <img
            src="../../assets/hero-img.jpg"
            class="img-contain show m-0"
            alt=""
          /></div>
        <div class="container show"> <img
            src="../../assets/hero-img.jpg"
            class="img-contain show m-0"
            alt=""
          /></div>
        <div class="container show"> <img
            src="../../assets/hero-img.jpg"
            class="img-contain show m-0"
            alt=""
          /></div>
      </div>
    </div>
  </section>
</template>

<script lang="ts">
export default {};
</script>

<style lang="css" scoped>
.blur-photo {
  background: linear-gradient(
    180deg,
    rgba(0, 0, 0, 0) 0%,
    rgba(0, 0, 0, 0.8) 100%
  );
}
.img-cover {
  object-fit: cover;
  border-radius: 4px;
}
.img-contain {
  object-fit: cover;
  width: 100%;
  height: 25vh;
  position: relative;
  justify-self: center;
}
.goth {
  font-family: "Lato", sans-serif;
}
.grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  outline: 1px dotted red;
}
.show {
  outline: 1px dotted red;
}
.h-fit {
  height: fit-content;
}
</style>
