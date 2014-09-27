'use strict';

var express = require('express');
var app = express();
var port = process.env.PORT || 3000;

app.get('/', function helloworld(request, response){
  response.send('Hello World');
});

app.listen(port);
