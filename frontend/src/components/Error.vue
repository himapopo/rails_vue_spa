<template>
  <div class="container">
    <div class="row">
      <div class="col-12">
        <h1 class="text-center">予期せぬエラーです。</h1>
      </div>
      <router-link :to="{ path: '/' }">トップに戻る</router-link>
    </div>
  </div>
</template>

<script>
export default {
  beforeRouteLeave(to, from, next){
    this.$store.commit('remove_error_message')
    next();
  }
}
</script>