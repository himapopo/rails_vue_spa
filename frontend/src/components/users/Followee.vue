<template>
  <div class="row">
    <div class="col-6 text-center">
      <router-link :to="{ path: `/users/${id}/birds` }">投稿中の鳥さん</router-link>
    </div>
    <div class="col-6 text-center">
      <router-link :to="{ path: `/users/${id}/likes` }">気になる鳥さんリスト</router-link>
    </div>
    <div class="col-12 text-center">
      <h3>フォロー中一覧</h3>
    </div>
  </div>
</template>

<script>
//import axios from 'axios'
export default {
  props: ['id']
}
</script>