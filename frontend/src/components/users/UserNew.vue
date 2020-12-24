<template>
  <div class="container">
    <div class="row">
      <div class="col-7 mx-auto">
        <div class="row text-center">
          <div class="col-12 text-danger" v-for="(value, index) in $store.state.errors" :key="index">
            <span class="text-danger">{{ index + 1 }}：{{ value }}</span>
          </div>
          <div class="col-12 my-2">
            <h2>会員登録</h2>
          </div>
          <div class="col-12 my-1">
            <label for="" class="text-info">ユーザーネーム</label>
            <input type="text" class="form-control" v-model="user_params.name">
          </div>
          <div class="col-12 my-1">
            <label for="" class="text-info">メールアドレス</label>
            <input type="email" class="form-control" v-model="user_params.email">
          </div>
          <div class="col-12 my-1">
            <label for="" class="text-info">地域</label>
            <select name="" id="" v-model="user_params.area"  class="form-control">
              <option value="start" disabled>種類を選択してください</option>
              <option v-for="area in $store.state.area" :key="area">
                {{ area }}
              </option>
            </select>
          </div>
          <div class="col-12 my-1">
            <label for="" class="text-info">パスワード</label>
            <input type="password" class="form-control" v-model="user_params.password">
          </div>
          <div class="col-12 my-1">
            <label for="" class="text-info">パスワード（確認）</label>
            <input type="password" class="form-control" v-model="user_params.password_confirmation">
          </div>
          <div class="col-12 my-1">
            <label for="" class="text-info">アバター画像</label>
            <input type="file" class="form-control-file" @change="onImageChange">
          </div>
          <div class="col-12 my-1">
            <label for="" class="text-info">自己紹介</label>
            <textarea name="" id="" cols="30" rows="10" class="form-control" v-model="user_params.profile"></textarea>   
          </div>
          <div class="col-12 my-3">
            <p class="text-danger" v-if="error">入力エラーがあります</p>
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
        name: "お好きな名前",
        email: "okok@okok",
        password: "050507",
        password_confirmation: "050507",
        avatar: "",
        area: "start",
        profile: "",
      },
      error: null,
    }
  },
  methods:{
    CreateUser(){
      axios.post(`http://localhost:3000/users`, this.user_params)
      .then(response => {
        console.log(response)
        this.$store.commit('add_success_message', response.data.message)
        this.$store.commit('add_session', String(response.data.data.id))
        this.$store.commit('add_session_name', response.data.data.name)
        this.$router.push(`/users/${response.data.data.id}/birds`)
      })
      .catch(error => {
        this.error = true
        this.$store.state.errors = error.response.data.message
      })
    },
    onImageChange(e){
      const images = e.target.files || e.dataTransfer.files //画像ファイルが選択されたら imagesに代入
      this.getBase64(images[0]) // 画像ファイルをBase64エンコードする処理 戻り値は promise
      .then(image => { //成功コールバック関数実行
        console.log(image)
        this.user_params.avatar = image
      })
      .catch(error => { //失敗コールバック関数実行
        console.log(error)
      })
    },
    getBase64(file){
      return new Promise((resolve, reject) => { // resolveは成功時の関数の名前 rejectは失敗時の関数の名前
        const reader = new FileReader(); 
        reader.readAsDataURL(file) // ファイル読み込み
        reader.onload = () => { resolve(reader.result) } //読み込み成功時 resolve関数実行時の引数を入れる
        reader.onerror = (error) => { reject(error) } //読み込み失敗時 reject関数実行時の引数を入れる
      })
    }
  },
  beforeRouteLeave(to, from, next){
    this.$store.state.errors = null
    next();
  }
}
</script>