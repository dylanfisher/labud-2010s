// Slideshow blocks

$(document).on('click', '.slideshow-block__slide-wrapper', function() {
  var $wrapper = $(this);
  var $allSlides = $wrapper.find('.slideshow-block__slide');
  var $activeSlide = $allSlides.filter('.active').first();
  var $nextSlide = $activeSlide.nextWrap();
  var maxZIndex = 0;

  $allSlides.removeClass('active').each(function() {
    var $thisSlide = $(this);
    var thisZIndex = parseInt( $thisSlide.css('zIndex') ) || 0;

    if ( thisZIndex > maxZIndex ) {
      maxZIndex = thisZIndex;
    }
  });

  $nextSlide.addClass('active').css({ zIndex: maxZIndex + 1 });
});
