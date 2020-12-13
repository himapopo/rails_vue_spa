<template>
  <nav class="navbar navbar-expand-lg navbar-light">
  <a class="navbar-brand ml-md-5" href="/">鳥さんの楽園</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse justify-content-end mr-md-5" id="navbarNav">
    <ul class="navbar-nav text-right">
      <li class="nav-item">
        <a class="nav-link" href="/users/new">会員登録</a>
      </li>
      <li class="nav-item" v-if="$store.state.session.user_id == null">
        <a class="nav-link" href="/sign_in">ログイン</a>
      </li>
      <li class="nav-item" v-else>
        <p class="nav-link" @click="LogOut">ログアウト</p>
      </li>
    </ul>
  </div>
</nav>
</template>

<script>
import axios from 'axios'
export default {
  methods:{
    LogOut(){
      axios.get(`http://localhost:3000/sign_out`)
      .then(response => {
        this.$store.state.users = response.data.data
        this.$store.state.message = response.data.message
        this.$store.state.session.user_id = null
        this.$router.push('/')
      }).
      catch(err => {
        console.log(err)
      })
    }
  }
}
</script>