<template>
  <div id="app">
    <Header></Header>
    <transition name="feda" mode="out-in">
    <router-view></router-view>
    </transition>
  </div>
</template>

<script>
import Header from './Header.vue'
export default {
  components:{
    Header
  }
};
</script>

<style scoped>
.feda-enter{
  opacity:0;
}

.feda-enter-active{
  transition: 1s;
}

.feda-leave-active{
  transition: 0s;
}

.feda-leave-to{
  opacity:0;
}

#app{
  font-family: 'Wawati SC',sans-serif;
}

.navbar{
  background-color: #FFFFDD;
}
</style>
