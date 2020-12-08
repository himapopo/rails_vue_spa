import Vue from 'vue';
import Router from 'vue-router';
import Home from './components/Home.vue';
import UserNew from './components/UserNew.vue';
Vue.use(Router)

export default new Router ({
  mode: "history",
  routes: [
    { path: '/', component: Home},
    { path: '/users/new', component: UserNew}
  ]
})