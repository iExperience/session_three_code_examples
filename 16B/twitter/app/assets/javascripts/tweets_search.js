$(function() {
  $('#tweets_search input').keyup(function(e) {
    var form = $('#tweets_search')
    // This is the <ul>
    $('#tweets').load(location.pathname, form.serialize());
  });
});