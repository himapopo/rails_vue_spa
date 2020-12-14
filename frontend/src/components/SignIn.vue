<template>
  <div class="container">
    <div class="row">
      <div class="col-7 mx-auto">
        <div class="row text-center my-5">
          <div class="col-12">
            <span class="text-danger">{{ $store.state.message }}</span>
          </div>
          <div class="col-12 my-2">
            <h2>ログイン</h2>
          </div>
          <div class="col-12 my-1">
            <label for="" class="text-info">メールアドレス</label>
            <input type="email" class="form-control" v-model="user_params.email">
          </div>
          <div class="col-12 my-1">
            <label for="" class="text-info">パスワード</label>
            <input type="password" class="form-control" v-model="user_params.password">
          </div>
          <div class="col-12 my-3">
            <button class="btn btn-primary btn-block" @click="LoginUser">ログイン</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  data(){
    return {
      user_params: {
        email: "",
        password: "",
      }
    }
  },
  methods:{
    LoginUser(){
      axios.post(`http://localhost:3000/sign_in`, this.user_params)
      .then(response => {
        console.log(response)
        this.$store.state.message = response.data.message
        this.$store.commit('addsession', String(response.data.data.id))
        this.$router.push(`/users/${response.data.data.id}`)
      })
      .catch(error => {
        console.log(this.user_params)
        this.$store.state.message = error.response.data.message,
        console.log(error.response)
      })
    }
  }

}
</script>