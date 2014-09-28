'use strict';

var express = require('express');
var app = express();
var port = process.env.PORT || 3000;

require('./config/routes')(app);

app.listen(port);
