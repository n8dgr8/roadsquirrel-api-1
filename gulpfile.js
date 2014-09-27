'use strict';

var gulp = require('gulp');
var plugins = require('gulp-load-plugins')();

gulp.task('lint', function eslint() {
  return gulp.src([ 'app/**/*.js', 'test/**/*.js', 'gulpfile.js', 'server.js' ])
    .pipe(plugins.eslint())
    .pipe(plugins.eslint.format());
});

gulp.task('test', function mocha() {
  return gulp.src([ 'test/**/*.test.js' ])
    .pipe(plugins.mocha({
      ui: 'bdd',
      reporter: 'spec',
      growl: true
    }));
});

gulp.task('default', [ 'lint' ]);
