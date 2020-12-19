<template>
  <div class="container">
    <div class="row">
      <div class="col-12 text-center">
        <h1>鳥さん一覧</h1>
      </div>
      <div class="col-md-4 text-center my-2" v-for="bird in birds" :key="bird.id">
        <div class="row">
          <div class="col-12">
            <router-link :to="{ path: `/birds/${bird.id}`}"><img :src="bird.image1" alt="" class="d-md-none d-block mobile-img mx-auto"></router-link>
            <router-link :to="{ path: `/birds/${bird.id}`}"><img :src="bird.image1" alt="" class="d-md-block d-none pc-img mx-auto"></router-link>
          </div>
          <div class="col-12">
            <span>{{ bird.name }}</span>
          </div>
          <div class="col-12">
            <span class="text-secondary">投稿者様：『{{ bird.user_name }}』</span>
          </div>
          <div class="col-12">
            <span class="text-secondary">{{ bird.area }}</span>
          </div>
        </div>
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
  methods: {
    getBirds(){
      axios.get(`http://localhost:3000/birds`)
      .then(response => {
        console.log(response)
        this.birds = response.data.data
      })
      .catch(err => {
        console.log(err)
      })
    }
  },
  mounted(){
    this.getBirds()
  }
}
</script>

<style scoped>
  .mobile-img{
    width: 200px;
    height: 200px;
    object-fit: cover;
  }

  .pc-img{
    width: 200px;
    height: 200px;
    object-fit: cover;
  }
</style>