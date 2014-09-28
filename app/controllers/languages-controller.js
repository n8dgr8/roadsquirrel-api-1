'use strict';

var languages = [ 'C#', 'Java', 'Javascript', 'Ruby', 'C++', 'Bash', 'Python' ];

function getLanguages(request, response) {
  return response.json({
    languages: languages
  });
}

module.exports.get = getLanguages;
