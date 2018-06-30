$(function () {
  let tweet = $("#new_tweet");

  // If Tweet Form exists
  if(tweet.length)
  {
    let counter = $(".new-tweet__counter");
    let body = $("#new_tweet textarea");
    let button_twittea = $("#button-twittea");
    let body_length = 0;
    let new_counter = 0;
    let counter_initial = 280;

    $(body).on('input', function() {
        body_length = body.val().length;
        new_counter = counter_initial - body_length; 
        
        counter.text(new_counter);
        if(new_counter < 0)
        {
          tweet.addClass("invalid");
          button_twittea.prop('disabled', true);
        }else
        {
          tweet.removeClass("invalid");
          button_twittea.prop('disabled', false);
        }
    });

    $(".tweet_alerts").on("click", "p", function()
    {
      $(this).fadeOut(400);
    });
  }
});
