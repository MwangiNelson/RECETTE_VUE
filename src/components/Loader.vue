<template>
  <div class="w-100 h-100 load-screen">
    <div class="loader-wrapper">
      <div class="packman"></div>
      <div class="dots">
        <div class="dot"></div>
        <div class="dot"></div>
        <div class="dot"></div>
        <div class="dot"></div>
      </div>
      <h1 class="fs-4 position-absolute text-light w-100 my-4 py-4 upload-text">
        Uploading recipe..
      </h1>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style lang="css" scoped>
.loader-wrapper {
  position: relative;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  margin: auto;
}

.loader-wrapper .packman::before {
  content: "";
  position: absolute;
  width: 50px;
  height: 25px;
  background-color: #ff5400;
  border-radius: 100px 100px 0 0;
  transform: translate(-50%, -50%);
  animation: pac-top 0.5s linear infinite;
  transform-origin: center bottom;
}

.loader-wrapper .packman::after {
  content: "";
  position: absolute;
  width: 50px;
  height: 25px;
  background-color: #ff5400;
  border-radius: 0 0 100px 100px;
  transform: translate(-50%, 50%);
  animation: pac-bot 0.5s linear infinite;
  transform-origin: center top;
}

@keyframes pac-top {
  0% {
    transform: translate(-50%, -50%) rotate(0);
  }

  50% {
    transform: translate(-50%, -50%) rotate(-30deg);
  }

  100% {
    transform: translate(-50%, -50%) rotate(0);
  }
}

@keyframes pac-bot {
  0% {
    transform: translate(-50%, 50%) rotate(0);
  }

  50% {
    transform: translate(-50%, 50%) rotate(30deg);
  }

  100% {
    transform: translate(-50%, 50%) rotate(0);
  }
}

.dots .dot {
  position: absolute;
  z-index: -1;
  top: 8px;
  width: 10px;
  height: 10px;
  border-radius: 50%;
  background: #fff;
}

.dots .dot:nth-child(1) {
  left: 90px;
  animation: dot-stage1 0.5s infinite;
}

.dots .dot:nth-child(2) {
  left: 60px;
  animation: dot-stage1 0.5s infinite;
}

.dots .dot:nth-child(3) {
  left: 30px;
  animation: dot-stage1 0.5s infinite;
}

.dots .dot:nth-child(4) {
  left: 10px;
  animation: dot-stage2 0.5s infinite;
}

@keyframes dot-stage1 {
  0% {
    transform: translate(0, 0);
  }

  100% {
    transform: translate(-24px, 0);
  }
}

@keyframes dot-stage2 {
  0% {
    transform: scale(1);
  }

  5%,
  100% {
    transform: scale(0);
  }
}
.load-screen {
  background-color: rgba(0, 0, 0, 0.5);
  position: absolute;
  z-index: 99;
  display: grid;
  justify-items: center;
  top: 0;
  left: 0;
}
.upload-text {
  width: 200px !important;
  text-align: center;
  justify-self: center;
  transform: translateX(-50%) translateY(10%);
}
</style>
