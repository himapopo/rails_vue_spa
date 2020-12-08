<template>
  <div class="container">
    <div class="row">
      <div class="col-12 text-center">
        <p>{{ $store.state.message }}</p>    
      </div>
      <div class="col-12 text-center" v-for="user in $store.state.users" :key="user.email">
        <p>{{ user.name }}</p>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  methods:{
    GetUsers(){
      axios.get('http://localhost:3000/users')
      .then(response => {
        console.log(response)
        this.$store.state.users = response.data.data
      })
      .catch(error => {
        console.log(error)
      })
    }
  },
  mounted(){
    this.GetUsers();
  }
}
</script>