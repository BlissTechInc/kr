/**
 * @module  reducers/loginReducer
 * @author  smozingo
 * @description handle state updates for user login
 * @exports loginReducer
 */

const initialState = {
  username: '',
  password: '',
  rememberMe: false,
};

/**
 * @function loginReducer
 * @param {string} type - dictates which elements of state change
 * @param {any} payload - value to apply to change state
 * @returns updated state
 */
const loginReducer = (state = initialState, { type, payload }) => {
  switch(type) {
    default:
      return state;
  }
}

export default loginReducer;