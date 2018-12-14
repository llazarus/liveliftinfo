// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap
//= require rails-ujs
//= require activestorage
//= require_tree .

$(document).ready(function() {
  // Change favorite button fill on click
  $(".btn.btn-warning").click(function() {
    $(this).toggleClass("no-favorite favorite");
  });

  // Change alert button fill on click
  $(".btn.btn-danger").click(function() {
    $(this).toggleClass("no-alert alerted");
  });

  // Retain active tab in local storage for data refresh
  $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
    localStorage.setItem('activeTab', $(e.target).attr('href'));
  });
  let activeTab = localStorage.getItem('activeTab');
  if (activeTab) {
      $('.nav-tabs a[href="' + activeTab + '"]').tab('show');
  }

  // Reload favorites/alerts on tab click
  $("#nav-favorites-tab").click(function() {
    // console.log("Whoooo!");
    // $(document).ajaxStart(function(){
    //   $(".lift-load").removeClass("load-complete");
    // });

    // $('#favorites-tab').load("/" +  ' #favorites-tab');

    // $(document).ajaxComplete(function(){
    //   $(".lift-load").addClass("load-complete");
    // });
    location.reload();
  });
  $("#nav-all-content-tab").click(function() {
    // $(document).ajaxStart(function(){
    //   $(".lift-load").removeClass("load-complete");
    // });

    // $('#collapse-whistler-all').load("/lifts" +  ' #collapse-whistler-all');

    // $(document).ajaxComplete(function(){
    //   $(".lift-load").addClass("load-complete");
    // });
    location.reload();
  });

  $("#toggle-units").click(function() {
    event.preventDefault();
    $(".toggle-unit").toggleClass("no-show show");
  });
});

