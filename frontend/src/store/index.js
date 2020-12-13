import Vue from 'vue';
import Vuex from 'vuex';
import session from './modules/session';
import createPersistedState from 'vuex-persistedstate';

Vue.use(Vuex)

export default new Vuex.Store({
  state:{
    users: [],
    message: null,
    errors: null
  },
  modules:{
    session
  },
  plugins: [createPersistedState(
    {
      key: 'vue_app',
      paths: ['session.user_id'],
    storage: window.sessionStorage,
  }
  )]
})