'use strict';

var gulp = require('gulp');
var plugins = require('gulp-load-plugins')();
var _ = require('lodash');

function isCIEnvironment() {
  return !_.isUndefined(process.env.CI);
}

gulp.task('lint', function eslint() {
  return gulp.src([ 'src/**/*.js', 'test/**/*.js', 'config/**/*.js', 'gulpfile.js', 'server.js' ])
    .pipe(plugins.eslint())
    .pipe(plugins.eslint.format())
    .pipe(plugins.if(isCIEnvironment(), plugins.eslint.failOnError()));
});

gulp.task('test', function mocha() {
  return gulp.src([ 'test/**/*.test.js' ])
    .pipe(plugins.mocha({
      ui: 'bdd',
      reporter: 'spec',
      globals: {
        testHelper: require('./test/helpers/chai')
      },
      growl: true
    }));
});

gulp.task('watch', [ 'lint', 'test' ], function watch() {
  gulp.watch([ 'src/**/*.js', 'test/**/*.js' ], [ 'test' ]);
  gulp.watch([ 'src/**/*.js', 'test/**/*.js', 'config/**/*.js', 'gulpfile.js', 'server.js' ], [ 'lint' ]);
});

gulp.task('default', [ 'lint', 'test' ]);
