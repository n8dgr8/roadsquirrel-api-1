'use strict';

function initRoutes(app) {
  app.use('/api', require('./languages-routes'));
}

module.exports = initRoutes;
