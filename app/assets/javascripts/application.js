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
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require_tree .

function replace_hashtag_link(str){
  return str.replace(/#(\w*[0-9a-zA-Z]+\w*[0-9a-zA-Z])/ig, `<a href="/hashtags/$1">$&</a>`);
}

function replace_mention_link(str){
  return str.replace(/@(\w*[0-9a-zA-Z]+\w*[0-9a-zA-Z])/ig, `<a href="/$1">$&</a>`);
}

function put_hashtags_and_mentions(element){
  element.text(function()
  {
    let tweet = $(this);
    let body = replace_hashtag_link(tweet.text());
    body = replace_mention_link(body);
    tweet.html(body);
  });
};