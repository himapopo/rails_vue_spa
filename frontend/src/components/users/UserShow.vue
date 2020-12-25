<template>
  <div class="container my-5">
    <div class="row">
      <div class="col-md-8 mx-auto">
        <div class="row">
          <div class="col-md-4">
            <div class="row">
              <div class="col-12" v-show="user.avatar != ''">
                <img :src="user.avatar" alt="" class="d-md-none d-block mobile-img mx-auto rounded-circle">
                <img :src="user.avatar" alt="" class="d-md-block d-none pc-img rounded-circle">
              </div>
              <div class="col-12" v-show="user.avatar == ''">
                <img :src="no_avatar" alt="" class="d-md-none d-block mobile-img mx-auto rounded-circle">
                <img :src="no_avatar" alt="" class="d-md-block d-none pc-img rounded-circle">
              </div>
              <div class="col-12 my-2" v-if="user.id == $store.state.session.user_id">
                <input type="file" @change="imageChange">
              </div>
              <div class="col-12 text-center my-2" v-if="user.id == $store.state.session.user_id">
                <button @click="imagePost">画像変更</button>
              </div>
            </div>
          </div>
          <div class="col-md-8">
            <div class="row text-center ml-2">
              <div class="col-12">
                <ul class="list-group list-group-flush">
                  <li class="list-group-item">ユーザーネーム：{{ user.name }}</li>
                  <li class="list-group-item">連絡先：{{ user.email }}</li>
                  <li class="list-group-item">地域：{{ user.area }}</li>
                  <li class="list-group-item profile border-bottom">{{ user.profile }}</li>
                  <li class="list-group-item profile border-bottom" v-if="id != $store.state.session.user_id && !followcheck">
                    <span class="btn btn-sm btn-primary" @click="Following">フォローする</span>
                  </li>
                  <li class="list-group-item profile border-bottom" v-if="id != $store.state.session.user_id && followcheck">
                    <span>フォロー済み：</span>
                    <span class="btn btn-sm btn-secondary" @click="UnFollow">フォローをはずす
                    </span>
                  </li>
                  <li class="list-group-item profile border-bottom">
                    <router-link :to="{ path: `/users/${id}/follower` }" active-class="link--active">
                      フォロワー一覧（{{ followers.length }}）
                    </router-link>
                    <router-link :to="{ path: `/users/${id}/followee` }" active-class="link--active">
                      フォロー中一覧（{{ followees.length }}）
                    </router-link>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <transition name="user-birds" mode="out-in">
    <router-view class="my-3"></router-view>
    </transition>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  props: ['id'],
  data(){
    return {
      user: {
      },
      followees: {},
      followers: {},
      followcheck: false,
      newavatar: "",
      no_avatar: "",
    }
  },
  methods:{
    getUser(){  // URLのIDからユーザー取得
      axios.get(`http://localhost:3000/users/${this.id}`)
      .then(response => {
        console.log(response)
        this.followees = response.data.followees
        this.followers = response.data.followers
        this.user = response.data.data
        this.FollowCheck()
        if (this.user.avatar == ''){
          this.no_avatar = "/dog.jpg"
        }
      })
    },
    imagePost(){   //画像変更
      axios.post(`http://localhost:3000/users/imagechange/${this.id}`, {avatar: this.newavatar})
      .then(response => {
        this.user = response.data.data
      })
      .catch(err => {
        console.log(err.response)
      })
    },
    imageChange(e){  //画像ファイル読みこみ
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
    },
    Following(){ // フォローする
      axios.post(`http://localhost:3000/follows`, { user_id: this.id, follow_id: this.$store.state.session.user_id })
      .then(response => {
        console.log(response)
        this.followees = response.data.followees
        this.followers = response.data.followers
        this.FollowCheck()
        this.$store.commit('add_success_message', response.data.message)
      })
      .catch(err => {
        console.log(err)
      })
    },
    UnFollow(){ //フォロー外す
      axios.delete(`http://localhost:3000/follows`, {data: {user_id: this.id, follow_id: this.$store.state.session.user_id}})
      .then(response => {
        this.followees = response.data.followees
        this.followers = response.data.followers
        this.FollowCheck()
        this.$store.commit('add_success_message', response.data.message)
      })
      .catch(err => {
        console.log(err)
      })
    },
    FollowCheck(){  // ログイン中のユーザーがフォロー中かチェック
      for(let i = 0; i < this.followers.length; i++){
        if(this.followers[i].id == this.$store.state.session.user_id){
          this.followcheck = true
        }
      }
    }
  },
  mounted(){  //コンポーネンと読み込み時ユーザー取得
    this.getUser();
  }

}
</script>

<style scoped>

  .user-birds-enter{
    opacity: 0;
  }

  .user-birds-enter-active{
    transition: 2s;
  }

  .user-birds-leave-to{
    opacity: 0;
  }

  .user-birds-leave-active{
    transition: 0s;
  }

  .mobile-img{
    width: 200px;
    height: 200px;
    object-fit: cover;
  }

  .pc-img{
    width: 250px;
    height: 250px;
    object-fit: cover;
  }

  .profile{
    white-space: pre;
  }

  .link--active{
    color:black;
    font-size:18px;
  }
</style>