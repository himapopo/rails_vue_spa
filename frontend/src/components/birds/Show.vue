<template>
  <div class="container">
    <div class="row text-center">
      <div class="col-md-8 mx-auto shadow">
        <div class="row">
          <div class="col-12 mt-3">
            <h1>{{ bird.name }}</h1>
          </div>
          <div class="col-12 mt-3">
            <img :src="preimage" alt="" class="d-md-none d-block mobile-img mx-auto">
            <img :src="preimage" alt="" class="d-md-block d-none pc-img mx-auto">
          </div>
          <div class="col-12 mt-3">
            <img :src="bird.image1" alt="" class="subimage mx-1" @click="changePreimage1">
            <img :src="bird.image2" alt="" class="subimage mx-1" @click="changePreimage2" v-if="bird.image2 != ''">
            <img :src="bird.image3" alt="" class="subimage mx-1" @click="changePreimage3" v-if="bird.image3 != ''">
          </div>
          <div class="col-md-4 mt-3">
            <span class="pb-1 border-bottom">大きさ：{{ bird.size }}</span>
          </div>
          <div class="col-md-4 mt-3">
            <span class="pb-1 border-bottom">性別：{{ bird.sex }}</span>
          </div>
          <div class="col-md-4 mt-3">
            <span class="pb-1 border-bottom">年齢：{{ bird.age }}</span>
          </div>
          <div class="col-12 mt-3 bird-details">
            <h4 class="p-2 border-bottom">{{ bird.details }}</h4>
          </div>
          <div class="col-12 mt-3">
            <p class="p-2 text-secondary">投稿者：『<router-link :to="{ path: `/users/${user.id}/birds` }">{{ user.name }}</router-link>』  連絡先：『{{ user.email }}』</p>
          </div>
          <div class="col-12 mt-1 text-right">
            <span class="text-success" v-if="like_check">気になる
              <span class="text-dark">
                <span class="text-warning like-btn" @click="removeLike" v-if="$store.state.session.user_id != ''">✔️</span>
                {{ like.length }}人
              </span>
            </span>
            <span class="text-success" v-else>気になる
              <span class="text-dark">
                <span class="like-btn" @click="addLike" v-if="$store.state.session.user_id != ''">✔️</span>
                {{ like.length }}人
              </span>
            </span>
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
    return{
      bird: {},
      user:{},
      like: {},
      preimage: "",
      like_check: false,
    }
  },
  methods:{
    getBird(){
      axios.get(`http://localhost:3000/birds/${this.id}`)
      .then(response => { //鳥さん取得
        console.log(response)
        this.bird = response.data.data;
        this.user = response.data.user;
        this.like = response.data.like
        this.preimage = response.data.data.image1
        this.LikeCheck()
      })
      .catch(err => {
        console.log(err)
      })
    },
    addLike(){
      axios.post(`http://localhost:3000/likes`, { bird_id: this.id, user_id: this.$store.state.session.user_id})
      .then(response => { //気になる追加ボタン
        this.bird = response.data.data
        this.user = response.data.user
        this.like = response.data.like
        this.$store.commit('add_success_message', response.data.message)
        this.LikeCheck()
      })
      .catch(err => {
        console.log(err)
      })
    },
    removeLike(){ //deleteメソッドは{data:}で囲んでデータを送る   気になる削除ボタン
      if(confirm('気になる鳥さんから外しますか？')){
        axios.delete(`http://localhost:3000/likes`, {data: { bird_id: this.id, user_id: this.$store.state.session.user_id}})
        .then(response => {
          this.bird = response.data.data
          this.user = response.data.user
          this.like = response.data.like
          this.$store.commit('add_success_message', response.data.message)
          this.LikeCheck()
        })
        .catch(err => {
          console.log(err.response)
        })
      }
    },
    changePreimage1(){  //プレビュー画像変更
      this.preimage = this.bird.image1
    },
    changePreimage2(){ //プレビュー画像変更
      this.preimage = this.bird.image2
    },
    changePreimage3(){ //プレビュー画像変更
      this.preimage = this.bird.image3
    },
    LikeCheck(){  //気になるしてるかチェック
      for(let i = 0; i < this.like.length; i++){
        if(this.like[i].bird_id == this.id && this.like[i].user_id == this.$store.state.session.user_id){
          this.like_check = true
          console.log(this.like[i].user_id)
        }
      }
      if(this.like.length == 0){
          this.like_check = false
        }
    },
  },
  watch:{
    preimage: {
      handler() {
        setTimeout(() => {  //プレビュー画像4秒ごとに変更
            if(this.preimage == this.bird.image1 && this.bird.image2 != ""){
              this.preimage = this.bird.image2
            } else if(this.preimage == this.bird.image2 && this.bird.image3 == ""){
              this.preimage = this.bird.image1
            } else if(this.preimage == this.bird.image2 && this.bird.image3 != "") {
              this.preimage = this.bird.image3
            } else if(this.preimage == this.bird.image3){
              this.preimage = this.bird.image1
            }
        }, 4000)
      },
    }
  },
  mounted(){
    this.getBird()
  }
}
</script>

<style scoped>
  .mobile-img{
    width: 200px;
    height: 200px;
    object-fit: cover;
  }

  .pc-img{
    width: 300px;
    height: 300px;
    object-fit: cover;
  }

  .subimage{
    width: 100px;
    height: 100px;
    object-fit: cover;
    cursor: pointer;
  }

  .bird-details{
    white-space: pre;
  }

  .like-btn{
    cursor: pointer;
  }

</style>