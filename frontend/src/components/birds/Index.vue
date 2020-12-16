<template>
  <div class="container">
    <div class="row">
      <div class="col-12 text-center">
        <h1>鳥さん一覧</h1>
      </div>
      <div class="col-md-4" v-for="bird in birds" :key="bird.id">
        <img :src="bird.image1" alt="" class="d-md-none d-block mobile-img mx-auto">
        <img :src="bird.image1" alt="" class="d-md-block d-none pc-img">
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data(){
    return{
      birds: [],
    }
  },
  getBirds(){
    axios.get(`http://localhost:3000/birds`)
    .then(response => {
      this.birds = response.data.data
    })
    .carch(err => {
      console.log(err)
    })
  }
}
</script>