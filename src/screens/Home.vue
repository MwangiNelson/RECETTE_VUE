<template>
  <section class="w-100">
    <HeroSection />
    <TopPicks></TopPicks>
    <UserReviews></UserReviews>
  </section>
</template>

<script lang="ts">
import TopPicks from "../sections/home/TopPicks.vue";
import UserReviews from "../sections/home/UserReviews.vue";
import HeroSection from "../sections/home/HeroSection.vue";
export default {
  data() {
    return {};
  },
  components: {
    TopPicks,
    UserReviews,
    HeroSection
  },
  meta: {
    transition: 'fade'
  }
};
</script>

<style lang="css" scoped>

.fs-lg {
  font-size: 1.5em;
}
</style>
