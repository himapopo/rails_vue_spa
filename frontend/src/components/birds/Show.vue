<template>
  <div class="container">
    <div class="row text-center">
      <div class="col-12">
        <h1>鳥さん詳細</h1>
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
      })
      .catch(err => {
        console.log(err)
      })
    },
  },
  mounted(){
    this.getBird()
    this.preimage = this.bird.image1
  }
}
</script>