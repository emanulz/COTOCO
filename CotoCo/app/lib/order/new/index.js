
var $ = require('jquery');
var page = require('page');

var template = require('./template.jade');

page('/order/new',new_order);

function new_order() {

    $('#page-wrapper').html(template())

}

$( document ).ready(function(){


});
