// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery.ui.autocomplete
//= require jquery_ujs
//= require bootstrap
//= require rails-timeago
//= require_tree .

$(function() {

  $('#new-status').on('shown', function() {
    $('#status_content').focus();
  });

  $('.following').hover(
    function() {
      $(this).html('Unfollow').removeClass('btn-primary').addClass('btn-danger');
    },
    function() {
      $(this).html('Following').removeClass('btn-danger').addClass('btn-primary');
    }
  );

  $('.followable').hover(
    function() {
      $(this).addClass('btn-success');
    },
    function() {
      $(this).removeClass('btn-success');
    }
  );

  $('.status').hover(
    function() {
      $(this).find('.favorited .icon').removeClass('icon-star').addClass('icon-star-empty');
    },
    function() {
      $(this).find('.favorited .icon').removeClass('icon-star-empty').addClass('icon-star');
    }
  );

});
