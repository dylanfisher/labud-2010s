// Lazy load content

$(document).on('turbolinks:load', function() {
  var $els = $('.lazy-content');

  $els.each(function() {
    var $el = $(this);

    $el.hide()
       .after($el.attr('data-lazy-content'));

    $(document).one('turbolinks:before-cache', function() {
      $el.show();
      $('.lazy-content--source').remove();
    });
  });
});
