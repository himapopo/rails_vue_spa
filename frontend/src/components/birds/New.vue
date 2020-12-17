<template>
  <div class="container">
    <div class="row">
      <div class="col-md-10 mx-auto navber-color">
        <div class="row text-center">
          <div class="col-12 my-3">
            <h1>鳥さん投稿</h1>
          </div>
          <div class="col-12 my-3">
            <label for="" class="text-success border-bottom pb-1 border-success">鳥さんの種類</label><br>
            <select class="form-control" name="type" id="" v-model="bird.type">
              <option value="start" disabled>種類を選択してください</option>
              <option v-for="bird in $store.state.birds.birds" :key="bird" :value="bird">
                {{ bird }}
              </option>
            </select>
          </div>
          <div class="col-12 my-3">
            <span class="text-success border-bottom pb-1 border-success">鳥さんの大きさ</span><br>
            <div class="row mt-2">
              <div class="col-4">
                <input type="radio" value="大型" id="big" v-model="bird.size">
                <label for="big">大型</label>
              </div>
              <div class="col-4">
                <input type="radio" value="中型" id="normal" v-model="bird.size">
                <label for="normal">中型</label>
              </div>
              <div class="col-4">
                <input type="radio" value="小型" id="small" v-model="bird.size">
                <label for="small">小型</label>
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
          <div class="col-12 my-3">
            <button class="btn btn-primary">投稿</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data(){
    return{
      bird: {
        type: "start",
        size: "大型",
        age: "10歳未満",
        details: "",
        image1: "",
        image2: "",
        image3: ""
      }
    }
  },
  methods:{
    imageChange1(){

    },
    imageChange2(){

    },
    imageChange3(){

    }
  }
}
</script>

<style scoped>
  .navber-color{
    background-color: #FFFFDD;
  }
</style>