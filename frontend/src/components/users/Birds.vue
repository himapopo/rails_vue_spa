<template>
  <div class="row">
    <div class="col-6 text-center">
      <span class="active border-bottom pb-1 border-dark">投稿中の鳥さん</span>
    </div>
    <div class="col-6 text-center">
      <router-link :to="{ path: `/users/${id}/likes` }">気になる鳥さんリスト</router-link>
    </div>
    <div class="col-md-4 my-3" v-for="(bird, index) in birds" :key="bird.id">
      <div class="row text-center">
        <div class="col-12">
          <router-link :to="{ path: `/birds/${bird.id}`}"><img :src="bird.image1" alt="" class="d-md-none d-block mobile-img mx-auto"></router-link>
          <router-link :to="{ path: `/birds/${bird.id}`}"><img :src="bird.image1" alt="" class="d-md-block d-none pc-img mx-auto"></router-link>
        </div>
        <div class="col-12">
          <span class="text-secondary">{{ bird.name }}</span>
        </div>
        <div class="col-12">
          <span>気になっている人：{{ likes[index].length }}人</span>
        </div>
      </div>
    </div>

  </div>
</template>

<script>
import axios from 'axios'
export default {
  props: ['id'],
  data(){
    return {
      birds:"",
      likes: null,
    }
  },
  methods:{
    getBirds(){
      axios.get(`http://localhost:3000/users/${this.id}/birds`)
      .then(response => {
        this.birds = response.data.data
        this.likes = response.data.like
        console.log(response)
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

  .active{
    font-size: 18px;
  }
</style>