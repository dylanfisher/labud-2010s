// All related post list

$(document).on('turbolinks:load', function() {
  var $postList = $('#all-related-post-list');

  if ( !$postList.length ) return;

  var $items = $postList.children();
  var $item = $items.first();
  var itemCount = $items.length;
  var itemWidth = $item.outerWidth(true);
  var totalWidth = itemCount * itemWidth;

  $postList.scrollLeft( Math.abs(App.windowWidth - totalWidth) / 2 );
});
