const state = {
  user_id: "",
  user_name: "",
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
};

export default {
  state,
  mutations
}