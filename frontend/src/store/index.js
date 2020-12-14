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
    user_id: "",
    user_name: ""
  },
  mutations: {
    users(state, users) {
      state.users = users
    },
    add_session(state, id){
      state.user_id = id
    },
    remove_session(state, remove){
      state.user_id = remove
    },
    add_session_name(state, name){
      state.user_name = name
    },
    remove_session_name(state, remove){
      state.user_name = remove
    }
  },
  plugins: [createPersistedState(
    {
      key: 'vue_app',
      paths: ['user_id', 'user_name'],
    storage: window.sessionStorage,
  }
  )]
})