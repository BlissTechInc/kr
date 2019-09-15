const validate = ({ username='', password='' }) {
  let error = {};
  let isError = false;
  const username = username.trim();
  const password = password.trim();

  if(username === '') {
    error.username = 'Required';
    isError = true;
  }

  if(username.length <= 3) {
    error.username = 'Username must be more than three characters long';
    isError = true;
  }

  if(password === '') {
    error.password = 'Required';
    isError = true;
  }

}