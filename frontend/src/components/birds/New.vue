<template>
  <div class="container">
    <div class="row">
      <div class="col-md-10 mx-auto navber-color">
        <div class="row text-center">
          <div class="col-12 my-3">
            <h1>鳥さん投稿</h1>
          </div>
          <div class="col-12" v-for="(error, index) in $store.state.errors" :key="error">
            <span class="text-danger">{{ index + 1 }}：{{ error }}</span>
          </div>
          <div class="col-12 my-3">
            <label for="" class="text-success border-bottom pb-1 border-success">鳥さんの種類</label><br>
            <select class="form-control" name="name" id="" v-model="bird.name">
              <option value="start" disabled>種類を選択してください</option>
              <option v-for="bird in $store.state.birds.birds" :key="bird" :value="bird">
                {{ bird }}
              </option>
            </select>
          </div>
          <div class="col-12 my-3">
            <span class="text-success border-bottom pb-1 border-success">鳥さんの性別</span><br>
            <div class="row mt-2">
              <div class="col-4">
                <input type="radio" value="男の子" v-model="bird.sex">
                <label for="">男の子</label>
              </div>
              <div class="col-4">
                <input type="radio" value="女の子" v-model="bird.sex">
                <label for="">女の子</label>
              </div>
              <div class="col-4">
                <input type="radio" value="不明" v-model="bird.sex">
                <label for="">不明</label>
              </div>
            </div>
          </div>
          <div class="col-12 my-3">
            <span class="text-success border-bottom pb-1 border-success">鳥さんの大きさ</span><br>
            <div class="row mt-2">
              <div class="col-4">
                <input type="radio" value="小型" id="small" v-model="bird.size">
                <label for="small">小型</label>
              </div>
              <div class="col-4">
                <input type="radio" value="中型" id="normal" v-model="bird.size">
                <label for="normal">中型</label>
              </div>
              <div class="col-4">
                <input type="radio" value="大型" id="big" v-model="bird.size">
                <label for="big">大型</label>
              </div>
            </div>
          </div>
          <div class="col-12 my-3">
            <span class="text-success border-bottom pb-1 border-success">鳥さんの年齢</span><br>
            <div class="row mt-2">
              <div class="col-6 col-md-3">
                <input name="bird-age" type="radio" value="10歳未満" v-model="bird.age">
                <label for="">0〜10歳</label>
              </div>
              <div class="col-6 col-md-3">
                <input name="bird-age" type="radio" value="20歳未満" v-model="bird.age">
                <label for="">11〜20歳</label>
              </div>
              <div class="col-6 col-md-3">
                <input name="bird-age" type="radio" value="30歳未満" v-model="bird.age">
                <label for="">21〜30歳</label>
              </div>
              <div class="col-6 col-md-3">
                <input name="bird-age" type="radio" value="31歳以上" v-model="bird.age">
                <label for="">31歳〜</label>
              </div>
            </div>
          </div>
          <div class="col-12 my-3">
            <label for="" class="text-success border-bottom pb-1 border-success">鳥さん詳細</label><br>
            <textarea name="" id="" cols="30" rows="10" v-model="bird.details" class="form-control"></textarea>
          </div>
          <div class="col-12 my-3">
            <label for="" class="text-success border-bottom pb-1 border-success">鳥さんの画像</label><br>
            <span class="text-danger">※↓一枚目は必須です</span><br>
            <input type="file" @change="imageChange1">
          </div>
          <div class="col-12 my-3">
            <input type="file" @change="imageChange2">
          </div>
          <div class="col-12 my-3">
            <input type="file" @change="imageChange3">
          </div>
          <div class="col-12">
            <img :src="bird.image1" alt="" class="preimage mx-1" v-show="bird.image1 != ''">
            <img :src="bird.image2" alt="" class="preimage mx-1" v-show="bird.image2 != ''">
            <img :src="bird.image3" alt="" class="preimage mx-1" v-show="bird.image3 != ''">
          </div>
          <div class="col-12 my-3">
            <p v-if="error" class="text-danger">入力エラーがあります</p>
            <button class="btn btn-primary" @click="CreateBird">投稿</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data(){
    return{
      bird: {
        name: "start",
        size: "小型",
        sex: "男の子",
        age: "10歳未満",
        details: "",
        image1: "",
        image2: "",
        image3: "",
        user_id: this.$store.state.session.user_id
      },
      error: null,
    }
  },
  methods:{
    imageChange1(e){
      if (e.target.files.length >= 1){
        const images = e.target.files || e.dataTransfer.files
        const reader = new FileReader(); 
        reader.readAsDataURL(images[0])
        reader.onload = (e) => {
          this.bird.image1 = e.target.result
        }
        reader.onerror = (err) => {
          console.log(err)
        }
      } else {
        this.bird.image1 = "";
      }
    },
    imageChange2(e){
      if (e.target.files.length >= 1){
        const images = e.target.files || e.dataTransfer.files
        const reader = new FileReader(); 
        reader.readAsDataURL(images[0])
        reader.onload = (e) => {
          this.bird.image2 = e.target.result
        }
        reader.onerror = (err) => {
          console.log(err)
        }
      } else {
        this.bird.image2 = "";
      }
    },
    imageChange3(e){
      if (e.target.files.length >= 1){
        const images = e.target.files || e.dataTransfer.files
        const reader = new FileReader(); 
        reader.readAsDataURL(images[0])
        reader.onload = (e) => {
          this.bird.image3 = e.target.result
        }
        reader.onerror = (err) => {
          console.log(err)
        }
      } else {
        this.bird.image3 = "";
      }
    },
    CreateBird(){
      axios.post(`http://localhost:3000/birds`, this.bird)
      .then(response => {
        this.$store.commit('add_success_message', response.data.message)
        this.$router.push(`/birds`)
        })
        .catch(err => {
          console.log(err.response)
          this.error = true
          this.$store.state.errors = err.response.data.message
      })
    }
  },
   beforeRouteLeave(to, from, next){
    this.$store.state.errors = null
    next();
  }
}
</script>

<style scoped>
  .navber-color{
    background-color: #FFFFDD;
  }

  .preimage{
    width:100px;
    height:100px;
    object-fit: cover;
  }
</style>