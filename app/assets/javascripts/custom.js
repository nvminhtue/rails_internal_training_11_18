$(document).ready(function() {

  $('.myfl').slideDown(function() {
      setTimeout(function() {
        $('.myfl').slideUp();
      }, 5000);
  }),

  $('#sidebarToggle').on('click',function(e) {
    e.preventDefault();
    $('body').toggleClass('sidebar-toggled');
    $('.sidebar').toggleClass('toggled');
  });

  $('body.fixed-nav .sidebar').on('mousewheel DOMMouseScroll wheel', function(e) {
    if ($(window).width() > 768) {
      var event = e.originalEvent;
      var delta = event.wheelDelta || -event.detail;
      this.scrollTop += (delta < 0 ? 1 : -1) * 30;
      e.preventDefault();
    }
  });

  $(document).on('scroll',function() {
    var scrollDistance = $(this).scrollTop();
    if (scrollDistance > 100) {
      $('.scroll-to-top').fadeIn();
    } else {
      $('.scroll-to-top').fadeOut();
    }
  });

  $(document).on('click', 'a.scroll-to-top', function(event) {
    var $anchor = $(this);
    $('html, body').stop().animate({
      scrollTop: ($($anchor.attr('href')).offset().top)
    }, 1000, 'easeInOutExpo');
    event.preventDefault();
  });
});

$( document ).on('turbolinks:load', function() {
  $('#choose-author .new-author').on('click', function() {
    $('#choose-author').addClass('d-none');
    $('#choose-author select').attr('disabled', true);
    $('#new-author').removeClass('d-none');
    $('#new-author input').attr('disabled', false);
  })

  $('#new-author .choose-author').on('click', function() {
    $('#new-author').addClass('d-none');
    $('#new-author input').attr('disabled', true);
    $('#choose-author').removeClass('d-none');
    $('#choose-author select').attr('disabled', false);
  })
});

