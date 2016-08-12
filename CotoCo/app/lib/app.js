/**
 * Created by emanuelziga on 11/7/16.
 */

var $ = require('jquery');
var page = require('page');

require('bootstrap');
require('select2');
require('PriceFormat');
require('alertify');


require('./order/new/');
require('./order/edit/');
require('./bill/new/');
require('./bill/edit/');
require('./report/by_order/');

page();

