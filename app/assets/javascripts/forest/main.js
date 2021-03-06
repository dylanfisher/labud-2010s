//////////////////////////////////////////////////////////////
// App namespace
//////////////////////////////////////////////////////////////

window.App = window.App || {};

App.pageLoad = [];
App.pageResize = [];
App.pageScroll = [];
App.teardown = [];
App.runFunctions = function(array) {
  for (var i = array.length - 1; i >= 0; i--) {
    array[i]();
  }
};
App.isHomePage = function() {
  return App.$body.hasClass('controller--home_pages');
};

//////////////////////////////////////////////////////////////
// On page load
//////////////////////////////////////////////////////////////

$(document).on('turbolinks:load', function(e) {
  App.scrollTop = $(window).scrollTop();

  App.$html = $('html');
  App.$body = $('body');

  App.windowWidth  = $(window).width();
  App.windowHeight = $(window).height();

  App.runFunctions(App.pageLoad);
  App.runFunctions(App.pageResize);
  App.runFunctions(App.pageScroll);

  $(window).trigger('scroll.lazyScroll');
});

//////////////////////////////////////////////////////////////
// On scroll
//////////////////////////////////////////////////////////////

$(window).on('scroll', function() {
  App.scrollTop = $(window).scrollTop();

  App.runFunctions(App.pageScroll);
});

$(window).on('scroll.lazyScroll', $.throttle( 250, function() {
  if ( App.scrollTop > 0 ) {
    App.$body.addClass('has-scrolled');
  } else {
    App.$body.removeClass('has-scrolled');
  }
}));

//////////////////////////////////////////////////////////////
// On resize
//////////////////////////////////////////////////////////////

$(window).on('resize', function() {
  App.windowWidth  = $(window).width();
  App.windowHeight = $(window).height();

  App.runFunctions(App.pageResize);
});

//////////////////////////////////////////////////////////////
// On turbolinks:before-cache
//////////////////////////////////////////////////////////////

$(document).on('turbolinks:before-cache', function() {
  App.runFunctions(App.teardown);
});

App.breakpoint = function(checkIfSize) {
  // Make sure these match the breakpoint variables set in variables.scss
  var xs = 576;
  var sm = 768;
  var md = 992;
  var lg = 1200;
  var breakpoint;

  if ( App.windowWidth < sm ) {
    breakpoint = 'xs';
  } else if ( App.windowWidth >= lg ) {
    breakpoint = 'lg';
  } else if ( App.windowWidth >= md ) {
    breakpoint = 'md';
  } else {
    breakpoint = 'sm';
  }

  if ( checkIfSize !== undefined ) {
    if ( checkIfSize == 'xs' ) {
      return App.windowWidth < xs;
    } else if ( checkIfSize == 'sm' ) {
      return (App.windowWidth >= xs && App.windowWidth < sm);
    } else if ( checkIfSize == 'md' ) {
      return (App.windowWidth >= sm && App.windowWidth < md);
    } else if ( checkIfSize == 'lg' ) {
      return App.windowWidth >= md;
    }
  } else {
    return breakpoint;
  }
};

App.breakpoint.isMobile = function() {
  return ( App.breakpoint('xs') || App.breakpoint('sm') );
};
