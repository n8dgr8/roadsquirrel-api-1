'use strict';

var languages = [
  { id: 1, name: 'C#' },
  { id: 2, name: 'Java' },
  { id: 3, name: 'Javascript' },
  { id: 4, name: 'Ruby' },
  { id: 5, name: 'C++' },
  { id: 6, name: 'Bash' },
  { id: 7, name: 'Python' }
];

function getLanguages(request, response) {
  return response.json(languages);
}

module.exports.get = getLanguages;
