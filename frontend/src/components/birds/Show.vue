<template>
  <div class="container">
    <div class="row text-center">
      <div class="col-12">
        <h1>鳥さん詳細</h1>
      </div>
      <div class="col-12">
        <img :src="preimage" alt="" class="d-md-none d-block mobile-img mx-auto">
        <img :src="preimage" alt="" class="d-md-block d-none pc-img mx-auto">
      </div>
      <div class="col-12 mt-3">
        <img :src="bird.image1" alt="" class="subimage mx-1" @click="changePreimage1">
        <img :src="bird.image2" alt="" class="subimage mx-1" @click="changePreimage2" v-if="bird.image2 != ''">
        <img :src="bird.image3" alt="" class="subimage mx-1" @click="changePreimage3" v-if="bird.image3 != ''">
      </div>
      <div class="col-12 bird-details">
        <h1>{{ bird.details }}</h1>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  props: ['id'],
  data(){
    return{
      bird: {
        image1: "",
      },
      preimage: "",
    }
  },
  methods:{
    getBird(){
      axios.get(`http://localhost:3000/birds/${this.id}`)
      .then(response => {
        console.log(response)
        this.bird = response.data.data;
        this.preimage = response.data.data.image1
      })
      .catch(err => {
        console.log(err)
      })
    },
    changePreimage1(){
      this.preimage = this.bird.image1
    },
    changePreimage2(){
      this.preimage = this.bird.image2
    },
    changePreimage3(){
      this.preimage = this.bird.image3
    }
  },
  mounted(){
    this.getBird()
  }
}
</script>

<style lang="scss" scoped>
  .mobile-img{
    width: 200px;
    height: 200px;
    object-fit: cover;
  }

  .pc-img{
    width: 300px;
    height: 300px;
    object-fit: cover;
  }

  .subimage{
    width: 100px;
    height: 100px;
    object-fit: cover;
    cursor: pointer;
  }

  .bird-details{
    white-space: pre;
  }

</style>