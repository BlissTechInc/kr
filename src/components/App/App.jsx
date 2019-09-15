/**
 * @module  src/App
 * @author  smozingo
 * @description Top level component.  This gets hooked into our html in index.js.
 */

import React from 'react';
import styles from './App.module.scss';
import Login from '../Login/Login';

function App() {
  return (
    <div className={styles.app}>
      <Login />
    </div>
  );
}

export default App;
