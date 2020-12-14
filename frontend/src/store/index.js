import Vue from 'vue';
import Vuex from 'vuex';
import session from './modules/session';
import createPersistedState from 'vuex-persistedstate';

Vue.use(Vuex)

export default new Vuex.Store({
  state:{
    users: null,
    message: null,
    errors: null,
  },
  mutations: {
    users(state, users) {
      state.users = users
    }
  },
  modules:{
    session
  },
  plugins: [createPersistedState(
    {
      key: 'vue_app',
      paths: ['session.user_id', 'session.user_name'],
    storage: window.sessionStorage,
  }
  )]
})