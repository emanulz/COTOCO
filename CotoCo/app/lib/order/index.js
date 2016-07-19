/**
 * Created by emanuelziga on 18/7/16.
 */
var $ = require('jquery');
var page = require('page');

var template = require('./template.jade');

page('/order',order);

function order() {

    $('#page-wrapper').html(template())

}

$( document ).ready(function(){


});
