var gulp = require('gulp');
var browserify = require('browserify');
var jadeify = require('jadeify');
var babelify = require('babelify');
var buffer = require('vinyl-buffer');
var source = require('vinyl-source-stream');
var uglify = require('gulp-uglify');

var stylus = require('gulp-stylus');
var concat = require('gulp-concat-css');
var nib = require('nib');
var minify = require('gulp-minify-css');


gulp.task('build',['styl','js']);

gulp.task('js', function () {
    return browserify({
        entries: './lib/app.js', // punto de entrada js
        transform: [babelify, jadeify] //transformaciones
        })
        .bundle()
        .pipe(source('app.js'))//archivo de destino
        .pipe(buffer())
        //.pipe(uglify())
        .pipe(gulp.dest('../static/js/')); // en donde va a estar el destino

});

gulp.task('styl', function () {
    return gulp.src('./lib/app.styl')// entry point
    .pipe(stylus({use:nib()}))
    .pipe(concat('app.css'))
    //.pipe(minify())
    .pipe(gulp.dest('../static/css/'))
});