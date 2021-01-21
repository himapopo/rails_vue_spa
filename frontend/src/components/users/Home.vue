<template>
  <div class="container">
    <div class="row">
      <div class="col-12 text-center" v-for="user in $store.state.users" :key="user.email">
        <router-link :to="{ path: `/users/${user.id}`}">{{ user.name }}：{{ user.email}}</router-link>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  data(){
    return {
      cookie: ""
    }
  },
  methods:{
    GetUsers(){
      axios.get('http://localhost:3000/users')
      .then(response => {
        console.log(response)
        this.$store.commit("users", response.data.data)
      })
      .catch(error => {
        console.log(error)
      })
    }
  },
  mounted(){
    this.GetUsers();
  },
  beforeRouteLeave(to, from, next){
    this.$store.commit('remove_error_message')
    next();
  }
}
</script>