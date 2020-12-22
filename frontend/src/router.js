import Vue from 'vue';
import Router from 'vue-router';
// users
import Home from './components/users/Home.vue';
import UserNew from './components/users/UserNew.vue';
import SignIn from './components/users/SignIn';
import UserShow from './components/users/UserShow'
import Birds from './components/users/Birds'
import Likes from './components/users/Likes'
//birds
import BirdIndex from './components/birds/Index.vue'
import BirdNew from './components/birds/New'
import BirdShow from './components/birds/Show'
// Error
import ErrorPage from './components/Error'
Vue.use(Router)

export default new Router ({
  mode: "history",
  routes: [
    { path: '/', component: Home },
    { path: '/users/new', component: UserNew },
    { path: '/sign_in', component: SignIn },
    { path: '/users/:id', component: UserShow, props:true, children:[
      { path: 'birds', component: Birds, props: true },
      { path: 'likes', component: Likes, props: true  }
    ] },
    { path: '/birds', component: BirdIndex },
    { path: '/birds/new', component: BirdNew },
    { path: '/birds/:id', component: BirdShow, props: true},
    { path: '*', component: ErrorPage }
  ]
})