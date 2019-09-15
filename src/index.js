/**
 * @module  src/index
 * @author  smozingo
 * @description Entry point for our application.  This is where we hook our top level
 * component (App) to our 'root' element in index.html
 */

import React from 'react';
import { render } from 'react-dom';
import { Provider } from 'react-redux';
import App from './components/App/App';
import * as serviceWorker from './serviceWorker';
import store from './store';

//import global styles
import './stylesheets/global/style.scss'

render(
  <Provider store={store}>
    <App/>
  </Provider>,
  document.getElementById('root')
);

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
