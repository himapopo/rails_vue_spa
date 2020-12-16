<template>
  <div class="container">
    <div class="row">
      <div class="col-md-10 mx-auto">
        <div class="row text-center">
          <div class="col-12">
            <h1>鳥さん投稿</h1>
          </div>
          <div class="col-12">
            <label for="">鳥さんの種類</label><br>
            <select name="type" id="" v-model="bird.type">
              <option value="start" disabled>種類を選択してください</option>
              <option v-for="bird in $store.state.birds.birds" :key="bird" :value="bird">
                {{ bird }}
              </option>
            </select>
            <span>{{ bird.type }}</span>
          </div>
          <div class="col-12">
            <span>鳥さんの大きさ</span><br>
            <input type="radio" value="大型" v-model="bird.size">
            <label for="">大型</label>
            <input type="radio" value="中型" v-model="bird.size">
            <label for="">中型</label>
            <input type="radio" value="小型" v-model="bird.size">
            <label for="">小型</label>
            {{ bird.size }}
          </div>
          <div class="col-12">
            <span>鳥さんの年齢</span><br>
            <input type="radio" value="10歳未満" v-model="bird.age">
            <label for="">0〜10歳</label>
            <input type="radio" value="20歳未満" v-model="bird.age">
            <label for="">11〜20歳</label>
            <input type="radio" value="30歳未満" v-model="bird.age">
            <label for="">21〜30歳</label>
            <input type="radio" value="31歳以上" v-model="bird.age">
            <label for="">31歳〜</label>
            {{ bird.age }}
          </div>
          <div class="col-12">
            <label for="">鳥さん詳細</label><br>
            <textarea name="" id="" cols="30" rows="10" v-model="bird.details"></textarea>
          </div>
          <div class="col-12">
            <label for="">鳥さんの画像 ※一枚は必須です</label><br>
            <input type="file" @change="imageChange1">
          </div>
          <div class="col-12">
            <input type="file" @change="imageChange2">
          </div>
          <div class="col-12">
            <input type="file" @change="imageChange3">
          </div>
          <div class="col-12">
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
  }
}
</script>