<template>
  <div class="container my-5">
    <div class="row">
      <div class="col-12 mx-auto text-center" v-if="$store.state.message != null">
        <p class="text-success">{{ $store.state.message}}</p>
      </div>
      <div class="col-md-8 mx-auto">
        <div class="row">
          <div class="col-md-4">
            <div class="row">
              <div class="col-12" v-show="user.avatar != ''">
                <img :src="user.avatar" alt="" class="d-md-none d-block mobile-img mx-auto rounded-circle">
                <img :src="user.avatar" alt="" class="d-md-block d-none pc-img rounded-circle">
              </div>
              <div class="col-12" v-show="user.avatar == ''">
                <img src="/dog.jpg" alt="" class="d-md-none d-block mobile-img mx-auto">
                <img src="/dog.jpg" alt="" class="d-md-block d-none pc-img">
              </div>
              <div class="col-12 my-2">
                <input type="file" @change="imageChange">
              </div>
              <div class="col-12 text-center my-2">
                <button @click="imagePost">画像変更</button>
              </div>
            </div>
          </div>
          <div class="col-md-8">
            <div class="row text-center">
              <div class="col-12">
                <p>{{ user.name }}</p>
              </div>
            </div>
            <div class="row text-center">
              <div class="col-12">
                <p>{{ user.email }}</p>
              </div>
            </div>
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
    return {
      user: {
        name: "",
        email: "",
        avatar: "",
      },
      newavatar: ""
    }
  },
  methods:{
    getUser(){
      axios.get(`http://localhost:3000/users/${this.id}`)
      .then(response => {
        this.user.avatar = response.data.data.avatar,
        this.user.name = response.data.data.name,
        this.user.email = response.data.data.email
      })
    },
    imagePost(){
      axios.post(`http://localhost:3000/users/imagechange/${this.id}`, {avatar: this.newavatar})
      .then(response => {
        this.user.avatar = response.data.data.avatar,
        this.user.name = response.data.data.name,
        this.user.email = response.data.data.email
      })
      .catch(err => {
        console.log(err.response)
      })
    },
    imageChange(e){
      const images = e.target.files || e.dataTransfer.files
      const reader = new FileReader(); 
      reader.readAsDataURL(images[0])
      reader.onload = (e) => {
        this.newavatar = e.target.result
        console.log(this.newavatar)
      }
      reader.onerror = (err) => {
        console.log(err)
      }
    }
  },
  mounted(){
    this.getUser();
  },
  // beforeRouteEnter(to,from,next){
  //   next(vm => {
  //     vm.getUser();
  //   })
  // }
}
</script>

<style scoped>
  .mobile-img{
    width: 200px;
    height: 200px;
    object-fit: cover;
  }

  .pc-img{
    width: 250px;
    height: 250px;
    object-fit: cover;
  }
</style>