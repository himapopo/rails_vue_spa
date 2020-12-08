<template>
  <div id="app">
    <Header></Header>
    <router-view></router-view>
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
#app{
  font-family: 'Wawati SC',sans-serif;
}

.navbar{
  background-color: #FFFFDD;
}
</style>
