$(function() {
  $('.close').click(function(event) {
    // $.getJSON('url', function(json){})
    // $.get('url', function(data){})
    // $.post('user', params, function(data){})
    
    var linkThatWasClicked = $(event.target);

    $.ajax({
      url: linkThatWasClicked.attr("href"),
      type: 'DELETE',
      success: function() {
        linkThatWasClicked.parent().slideUp('slow');
      }
    });

    return false;
  });
});