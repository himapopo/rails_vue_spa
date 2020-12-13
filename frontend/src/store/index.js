import Vue from 'vue';
import Vuex from 'vuex';
//import session from './modules/session';
import createPersistedState from 'vuex-persistedstate';

Vue.use(Vuex)

export default new Vuex.Store({
  state:{
    users: null,
    message: null,
    errors: null,
    userid: "",
  },
  mutations: {
    users(state, users) {
      state.users = users
    },
    addsession(state, id){
      state.userid = id
    },
    removesession(state, remove){
      state.userid = remove
    }
  },
  plugins: [createPersistedState(
    {
      key: 'vue_app',
      paths: ['userid'],
    storage: window.sessionStorage,
  }
  )]
})