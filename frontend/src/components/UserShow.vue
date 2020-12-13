<template>
  <div class="container my-5">
    <div class="row">
      <div class="col-md-7 mx-auto text-center">
        <p>{{ $store.state.message}}</p>
      </div>
      <div class="col-md-7 text-center">
        <p class="text-success">{{ $store.state.session.user_id }}</p>    
      </div>
      <div class="col-md-7 mx-auto text-center">
        <p>{{ user.name}}</p>
      </div>
      <div class="col-md-7 mx-auto">
        <img :src="user.avatar" alt="" class="h-100 w-50 mx-auto d-block">
      </div>
      <div class="col-md-7 mx-auto text-center">
         <input type="file" @change="imageChange">
      </div>
      <div class="col-md-7 mx-auto text-center">
        <button @click="imagePost">画像変更</button>
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
        this.user.name = response.data.data.name,
        this.user.email = response.data.data.email,
        this.user.avatar = response.data.data.avatar
      })
    },
    imagePost(){
      axios.post(`http://localhost:3000/users/imagechange/${this.id}`, {avatar: this.newavatar})
      .then(response => {
        this.user.name = response.data.data.name,
        this.user.email = response.data.data.email,
        this.user.avatar = response.data.data.avatar
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
  }
}
</script>

<style scoped>

</style>