const bodyParser = require('body-parser');
const express = require('express');
const morgan = require('morgan');

const app = express();
const port = process.env.PORT || 5000;


morgan('combined');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// handle routes



// listen for requests
app.listen(port, () => console.log(`Listening on port ${port}`));