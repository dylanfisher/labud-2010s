// Home page posts

$(document).on('mouseenter', '.home__post-card-wrapper', function() {
  var $post = $(this);
  var imageUrl = $post.attr('data-image-url');

  $('#home__post-image-overlay').css({
    backgroundImage: 'url(' + imageUrl + ')',
    backgroundRepeat: 'repeat',
    backgroundPosition: ''
   });
});

$(document).on('mouseleave', '.home__post-card-wrapper', function() {
  var $post = $(this);

  $('#home__post-image-overlay').css({
    backgroundImage: '',
    backgroundRepeat: '',
    backgroundPosition: ''
  });
});

$(document).on('mousemove', '.home__post-card-wrapper', function(e) {
  var x = e.originalEvent.screenX / App.windowWidth * 100;
  var y = e.originalEvent.screenY / App.windowHeight * 100;

  $('#home__post-image-overlay').css({
    backgroundPosition: x + '% ' + y + '%'
  });
});

$(document).on('turbolinks:load', function() {
  $(document).one('turbolinks:before-cache', function() {
    $('#home__post-image-overlay').css({
      backgroundImage: '',
      backgroundRepeat: '',
      backgroundPosition: ''
    });
  });
});
