/**
 * @module  reducers/index
 * @author  smozingo
 * @description combine all reducers into rootReducer and make it available for the redux store
 * @exports rootReducer
 */

import { combineReducers } from 'redux';
import { reducer as formReducer } from 'redux-form';

// import all reducers here
import loginReducer from './loginReducer';

// combine reducers
const rootReducer = combineReducers({
  form: formReducer,
  login: loginReducer,
});

export default rootReducer;