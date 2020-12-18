<template>
  <div class="container">
    <div class="row text-center">
      <div class="col-md-8 mx-auto shadow">
        <div class="row">
          <div class="col-12 mt-3">
            <h1>{{ bird.name }}</h1>
          </div>
          <div class="col-12 mt-3">
            <img :src="preimage" alt="" class="d-md-none d-block mobile-img mx-auto">
            <img :src="preimage" alt="" class="d-md-block d-none pc-img mx-auto">
          </div>
          <div class="col-12 mt-3">
            <img :src="bird.image1" alt="" class="subimage mx-1" @click="changePreimage1">
            <img :src="bird.image2" alt="" class="subimage mx-1" @click="changePreimage2" v-if="bird.image2 != ''">
            <img :src="bird.image3" alt="" class="subimage mx-1" @click="changePreimage3" v-if="bird.image3 != ''">
          </div>
          <div class="col-md-4 mt-3">
            <span class="pb-1 border-bottom">大きさ：{{ bird.size }}</span>
          </div>
          <div class="col-md-4 mt-3">
            <span class="pb-1 border-bottom">性別：{{ bird.sex }}</span>
          </div>
          <div class="col-md-4 mt-3">
            <span class="pb-1 border-bottom">年齢：{{ bird.age }}</span>
          </div>
          <div class="col-12 mt-3 bird-details">
            <h4 class="p-2 border-bottom">{{ bird.details }}</h4>
          </div>
          <div class="col-12 mt-3">
            <p class="p-2 text-secondary">投稿者：{{ user.name }} 連絡先：{{ user.email }}</p>
          </div>
          <div class="col-12 mt-1 text-right">
            <span class="text-success">気になる<span>✔️</span></span>
          </div>
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
    return{
      bird: {
        image1: "",
      },
      user:{

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
        this.user = response.data.user;
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