<template>
  <div class="row">
    <div class="col-6 text-center">
      <router-link :to="{ path: `/users/${id}/birds` }">投稿中の鳥さん</router-link>
    </div>
    <div class="col-6 text-center">
      <router-link :to="{ path: `/users/${id}/likes` }">気になる鳥さんリスト</router-link>
    </div>
    <div class="col-12 text-center">
      <h3>フォロワー一覧</h3>
    </div>
    <div class="col-6 col-md-3 text-center" v-for="follower in followers" :key="follower.id">
      <div class="row">
        <div class="col-12">
          <img :src="follower.avatar" alt="" class="d-md-none d-block mobile-img mx-auto">
          <img :src="follower.avatar" alt="" class="d-md-block d-none pc-img mx-auto">
        </div>
        <div class="col-12">
          <router-link :to="{ path: `/users/${follower.id}/birds` }">{{ follower.name }}</router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
//import axios from 'axios'
export default {
  props: ['id','followers'],
  data(){
    return {
      follower: []
    }
  },
  mounted(){
    console.log(this.followers)
  }
}
</script>

<style lang="scss" scoped>
  .mobile-img{
    width: 100px;
    height: 100px;
    object-fit: cover;
  }

  .pc-img{
    width: 100px;
    height: 100px;
    object-fit: cover;
  }
</style>