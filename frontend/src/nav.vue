<template>
  <div class="container-fluid bird-nav">
    <div class="row py-3">
      <div class="col-4 col-md-2 text-center border-bottom py-2">
        <h5><router-link class="text-info" :to="{path: '#'}">小型</router-link></h5>
      </div>
      <div class="col-4 col-md-2 text-center border-bottom py-2">
        <h5><router-link class="text-info" :to="{path: '#'}">中型</router-link></h5>
      </div>
      <div class="col-4 col-md-2 text-center border-bottom py-2">
        <h5><router-link class="text-info" :to="{path: '#'}">大型</router-link></h5>
      </div>
      <div class="col-12 col-md-6 text-center border-bottom py-2">
        <input type="text"> <button>検索</button>
      </div>
      <div class="col-3 text-center" v-for="bird in birds" :key="bird">
        <router-link :to="{path: '#'}">{{ bird }}</router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data(){
    return {
      birds:[
        "オカメインコ", "セキセイインコ", "キバタン", "オオバタン", "ボウシインコ", "ウロコインコ", "まめるりは",
        "コザクラインコ", "シロハラインコ", "ヨウム", "コンゴウインコ", "その他"
      ]
    }
  }
}
</script>

<style scoped>
  a{
    text-decoration: underline;
    color:black;
  }

  .bird-nav{
    background-color: #FFFFF0;
  }
</style>