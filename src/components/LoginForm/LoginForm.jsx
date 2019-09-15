/**
 * @module  components/LoginForm
 * @author  smozingo
 * @description Form for entering user login
 */

import React from 'react';
import styles from './LoginForm.module.scss';
import { Field, reduxForm, SubmissionError } from 'redux-form';

const renderField = ({ type, label, input, meta: { touched, error } }) => (
  <div className="input-row">
    <label>{label}</label>
    <input {...input} type={type}/>
    {touched && error && <span className="error">{error}</span>}
  </div>
)

const submit = (values) => {
  console.log(values);
}

const LoginForm = ({ handleSubmit }) => (
    <div className={styles.card}>
      {/* handleSubmit is provided by redux-form and updates the store
          onSubmit may be passed in from the parent and is invoked after handleSubmit
          or alternatively passed into handleSubmit (as in this case) */}
      <form onSubmit={handleSubmit(submit)}>
        <Field type="text" name="username" label="Username" component={renderField}/>
        <Field type="password" name="password" label="Password" component={renderField}/>
        <Field type="checkbox" name="checkboxRememberMe" label="Remember me" component={renderField}/>
        <button type="submit">Login</button>
      </form>
    </div>
)

export default reduxForm({ form: 'login' })(LoginForm);