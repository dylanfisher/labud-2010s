// Slideshow blocks

$(document).on('click', '.slideshow-block', function() {
  var $block = $(this);
  var $allSlides = $block.find('.slideshow-block__slide');
  var $activeSlide = $allSlides.filter('.active').first();
  var $nextSlide = $activeSlide.nextWrap();

  $allSlides.removeClass('active');
  $nextSlide.addClass('active');
});
