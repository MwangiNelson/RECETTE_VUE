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
        class="w-100 border-top border-bottom d-flex justify-content-center py-1"
      >
        <h2 class="display-5">Top Picks</h2>
      </div>
      <div class="grid m-0 w-100 h-100 mt-2">
        <div class="w-100" v-for="item in absoluteItems" :key="item.id">
          <div
            :key="item.id"
            :class="`container p-2 d-flex flex-column ${
              hoveredIndex == item.id ? 'card shadow-lg' : null
            }`"
            @mouseenter="hoveredIndex = item.id"
            @mouseleave="hoveredIndex = -1"
          >
            <img :src="item.image_url" class="img-contain m-0 rounded" alt="" />
            <div class="w-100 d-flex flex-column">
              <h4 class="fs-5">{{ item.title }}</h4>
              <span class="d-flex flex-row align-items-center">
                <i
                  class="fa-solid fa-thumbs-up bg-warning rounded-circle p-2 me-3"
                ></i>
                <p class="fs-6 p-0 m-0">{{ item.likes }} Likes</p>
              </span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script lang="ts">
import axios from "axios";
export default {
  data() {
    return {
      hoveredIndex: -1,
      topItems: [{ id: -1, image_url: "", title: "", likes: null }],
    };
  },
  methods: {
    getTopItems() {
      this.topItems = [];
      axios.get("http://127.0.0.1:8000/api/tests").then((res) => {
        this.topItems = res.data.data;
      });
    },
  },
  mounted() {
    this.getTopItems();
  },
  computed: {
    absoluteItems() {
      return this.topItems.slice(0, 4);
    },
  },
};
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
  height: 22vh;
  position: relative;
  justify-self: center;
}
.goth {
  font-family: "Lato", sans-serif;
}
.grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  /* outline: 1px dotted red; */
}
.show {
  outline: 1px dotted red;
}
.h-fit {
  height: fit-content;
}
</style>
