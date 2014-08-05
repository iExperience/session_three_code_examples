$(function() {

  $('#tweet_content').keyup(function(e) {
    count = $(e.target).val().length;

    if (count > 140) {
      $('#tweet_counter').css("color", "red")
    }
    else if (count <= 140 && count >= 120) {
      $('#tweet_counter').css("color", "yellow")
    } else {
      $('#tweet_counter').css("color", "green")
    }

    $('#tweet_counter').html(140 - count)
  });

});