<template>
  <div id="app">
    <Header></Header>
    <transition name="flash-fade">
      <div class="col-12 text-center flash" v-if="$store.state.flash.success">
        <span class="text-success">{{ $store.state.flash.success_message }}</span>
      </div>
    </transition>
    <div class="col-12 text-center flash">
      <span class="text-danger" v-if="$store.state.flash.error">{{ $store.state.flash.error_message }}
        <span @click="remove_error_message" class="flash-close text-dark">×</span>
      </span>
    </div>
    <transition name="feda" mode="out-in">
      <router-view class="my-5"></router-view>
    </transition>
  </div>
</template>

<script>
import { mapMutations } from 'vuex'
import Header from './Header.vue'
export default {
  components:{
    Header,
  },
  methods:{
    ...mapMutations(['remove_success_message', 'remove_error_message']),
  },
}
</script>

<style scoped>
.flash-fade-enter{
  opacity:0;
}
.flash-fade-enter-active{
  transition:0;
}
.flash-fade-leave-to{
  opacity:0;
}
.flash-fade-leave-active{
  transition:2s;
}

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
  position: relative;
}

.navbar{
  background-color: #FFFFDD;
}

.flash-close{
  cursor: pointer;
}

.flash{
  z-index: 2;
  position: absolute;
  top: 60px;
}
</style>
