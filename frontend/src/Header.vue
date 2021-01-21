<template>
  <nav class="navbar navbar-expand-lg navbar-light">
  <a class="navbar-brand ml-md-5" href='/'>鳥さんの楽園</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse justify-content-end mr-md-5" id="navbarNav">
    <ul class="navbar-nav text-right" v-if="$store.state.session.user_id == ''">
      <li class="nav-item">
        <a class="nav-link" href='/users/new'>会員登録</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href='/sign_in'>ログイン</a>
      </li>
      <li class="nav-item">
        <router-link class="nav-link" :to="{ path: '/birds' }">鳥さん一覧</router-link>
      </li>
    </ul>
    <ul class="navbar-nav text-right" v-else>
      <li class="nav-item">
        <span class="nav-link disabled">{{ $store.state.session.user_name }}さん</span>
      </li>
      <li class="nav-item">
        <router-link class="nav-link" :to="{ path: '/birds' }">鳥さん一覧</router-link>
      </li>
      <li class="nav-item">
        <router-link class="nav-link" :to="{ path: '/birds/new' }">鳥さん投稿</router-link>
      </li>
      <li class="nav-item">
        <span class="nav-link logout-btn" @click="LogOut">ログアウト</span>
      </li>
      <li class="nav-item">
        <router-link  class="nav-link" :to="{ path: `/users/${$store.state.session.user_id}` }">マイページ</router-link>
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
        this.$store.commit('add_success_message', response.data.message)
        this.$store.commit('remove_session', '')
        this.$store.commit('remove_session_name', '')
        this.$router.push('/sign_in', ).catch(err => {
          console.log(err)
        })
      }).
      catch(err => {
        console.log(err)
      })
    }
  }
}
</script>

<style scoped>
.logout-btn{
  cursor: pointer;
}
</style>