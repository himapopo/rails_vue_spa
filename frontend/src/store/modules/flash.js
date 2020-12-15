const state = {
  success_message: null,
  error_message: null,
  success: false,
  error: false
};
const mutations = {
  add_success_message(state, message){
    state.success = true
    state.success_message = message
    setTimeout(() => {
      state.success = false
      state.success_message = null
    },1500)
  },
  add_error_message(state, message){
    state.error = true
    state.error_message = message
  },
  remove_success_message(state){
    state.success = false
    state.success_message = null
  },
  remove_error_message(state){
    state.error = false
    state.error_message = null
  }
};

export default {
  state,
  mutations
}
