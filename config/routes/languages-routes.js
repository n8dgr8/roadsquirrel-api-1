'use strict';

var express = require('express');
var router = express.Router();
var languagesController = require('../../app/controllers/languages-controller');

router.route('/languages')
  .get(languagesController.get);

module.exports = router;
