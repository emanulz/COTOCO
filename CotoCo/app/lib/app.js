/**
 * Created by emanuelziga on 11/7/16.
 */

var $ = require('jquery');

require('materialize');


$( document ).ready(function(){
    $(".dropdown-button").dropdown();
    //$(".button-collapse").sideNav();


    // Initialize collapse button
    //$(".button-collapse").sideNav();
    // Initialize collapsible (uncomment the line below if you use the dropdown variation)
    $('.collapsible').collapsible();
    

});
