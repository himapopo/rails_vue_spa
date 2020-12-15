import Vue from 'vue';
import Vuex from 'vuex';
import createPersistedState from 'vuex-persistedstate';
import session from './modules/session';
import flash from './modules/flash';

Vue.use(Vuex)

export default new Vuex.Store({
  state:{
    users: null,
    errors: null,
  },
  mutations: {
    users(state, users) {
      state.users = users
    }
  },
  modules:{
    session,
    flash
  },
  plugins: [createPersistedState(
    {
      key: 'vue_app',
      paths: ['session.user_id', 'session.user_name'],
    storage: window.sessionStorage,
  }
  )]
})