const state = {
  user_id: "",
  user_name: "",
  cookie: "",
  current_user:{
    id: "",
    name: "",
  }
};

const mutations = {
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
  },
  add_cookie(state, id){
    state.cookie = id
  },
  remove_cookie(state){
    state.cookie = ""
  }
};

export default {
  state,
  mutations
}