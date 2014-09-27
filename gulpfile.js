'use strict';

var gulp = require('gulp');
var plugins = require('gulp-load-plugins')();

gulp.task('lint', function eslint() {
  gulp.src([ 'app/**/*.js', 'test/**/*.js', 'gulpfile.js', 'server.js' ])
    .pipe(plugins.eslint())
    .pipe(plugins.eslint.format());
});

gulp.task('default', [ 'lint' ]);
