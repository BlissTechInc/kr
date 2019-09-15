/**
 * @module  components/Login
 * @author  smozingo
 * @description Initial landing page for dev and demo.
 * From here, users can log in as public, subscriber, or creator.
 * This will be replaced in production in accordance to user type.
 */

import React from 'react';
import styles from './Login.module.scss';
import logo from '../../assets/images/logo-v2.png';
import LoginForm from '../LoginForm/LoginForm';



console.log(styles);
const Login = props => {
  return (
    <div className={styles.wrapper}>
      <section className={styles.login}>
        <div className={styles.container}>
          <img src={logo} alt="kinkrebel-logo" className={styles.loginLogo} />
          Sign In
          <div className={styles.createAccount}>
            New to KinkRebel?{" "}
            <a href="/" className={styles.createAccountLink}>
              Create your free account
            </a>
            .
          </div>
          <LoginForm onSubmit={submit}/>
        </div>
      </section>
    </div>
  );
};

export default Login;