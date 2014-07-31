$(function() {
  $('.close').click(function(event) {
      var linkThatWasClicked = $(event.target);
      linkThatWasClicked.parent().slideUp('slow');
      return false;
  });
});