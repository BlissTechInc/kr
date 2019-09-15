/**
 * @module  src/store
 * @author  smozingo
 * @description Redux 'single source of truth' -- constructed from reducers.
 * This is also where we drop in middleware (devtools, redux-thunk, etc)
 * @exports store
 */

import { createStore, applyMiddleware } from 'redux';
import { composeWithDevTools } from 'redux-devtools-extension';
import thunk from 'redux-thunk';
import reducers from './reducers/';

const store = createStore(
  reducers,
  composeWithDevTools(applyMiddleware(thunk))
);

export default store;