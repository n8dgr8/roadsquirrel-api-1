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

    it('should respond with a list of languages', function() {
      var controllerResponse = languagesController.get(null, response);

      controllerResponse.should.have.property('languages');
    });

    it('has a response property [languages] of type array', function() {
      var controllerResponse = languagesController.get(null, response);

      controllerResponse.languages.should.be.a('array');
    });
  });
});
