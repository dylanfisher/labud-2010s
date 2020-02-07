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

$(document).on('turbolinks:load', function() {
  if ( !App.isHomePage() ) return;

  var imageUrls = $('.home__post-card-wrapper').map(function() {
    return $(this).attr('data-image-url');
  });

  if ( !imageUrls || !imageUrls.length ) return;

  var timers = [];
  var random = function(min, max) {
    return Math.floor(Math.random() * (max - min + 1) + min);
  };

  var animate = function() {
    var imageUrl = imageUrls[Math.floor(Math.random() * imageUrls.length)];
    var top = random(0, 100);
    var left = random(0, 100);
    var className = 'img' + Date.now();

    App.$body.append('<img src="' + imageUrl + '" class="home__floating-image ' + className + '" style="top: ' + top + '%; left: ' + left + '%;">');

    var $image = $('.' + className);

    timers.push(window.setTimeout(function() {
      animate();

      timers.push(window.setTimeout(function() {
        $image.transition({ opacity: 0 }, 500, function() {
          $image.remove();
        });
      }, 2000));
    }, 1000));
  };

  animate();

  $(document).one('turbolinks:before-cache', function() {
    for (var i = timers.length - 1; i >= 0; i--) {
      if ( timers[i] ) window.clearTimeout(timers[i]);
    }

    $('.home__floating-image').remove();
  });
});
