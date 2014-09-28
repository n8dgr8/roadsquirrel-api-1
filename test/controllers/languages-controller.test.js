'use strict';

describe('controllers/languages-controller.js', function() {
  var languagesController;

  beforeEach(function () {
    languagesController = require('../../app/controllers/languages-controller');
  });

  describe('GET /languages', function() {
    var response = {
      json: function(obj) {
        return obj;
      }
    };

    it('should respond with an object', function() {
      var controllerResponse = languagesController.get(null, response);

      should.exist(controllerResponse);
    });

    it('has a response of type array', function() {
      var controllerResponse = languagesController.get(null, response);

      controllerResponse.should.be.a('array');
    });
  });
});
