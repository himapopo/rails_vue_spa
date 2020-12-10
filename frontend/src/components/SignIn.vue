<template>
  <div class="container">
    <div class="row">
      <div class="col-7 mx-auto">
        <div class="row text-center my-5">
          <div class="col-12 text-danger" v-for="(error, index) in $store.state.errors" :key="index">
            <p class="text-danger">{{ error }}</p>
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
            <button class="btn btn-primary btn-block" @click="CreateUser">登録</button>
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
    CreateUser(){
      axios.post(`http://localhost:3000/users/sign_in`, this.user_params)
      .then(response => {
        this.$store.state.users = response.data.data,
        this.$store.state.message = response.data.message
        this.$router.push('/')
      })
      .catch(error => {
        console.log(this.user_params)
        this.$store.state.errors = error.response.data.message,
        console.log(error.response)
      })
    }
  }

}
</script>