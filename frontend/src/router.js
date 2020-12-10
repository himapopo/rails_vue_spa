import Vue from 'vue';
import Router from 'vue-router';
import Home from './components/Home.vue';
import UserNew from './components/UserNew.vue';
import SignIn from './components/SignIn';
import UserShow from './components/UserShow'
Vue.use(Router)

export default new Router ({
  mode: "history",
  routes: [
    { path: '/', component: Home },
    { path: '/users/new', component: UserNew },
    { path: '/sign_in', component: SignIn },
    { path: '/users/:id', component: UserShow, props:true }
  ]
})