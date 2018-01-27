$('.feedback-tag-link').click(function(e) {
  if ($(this).hasClass('selected')) {
    $(this).removeClass('selected');
  } else {
    $(this).addClass('selected');
  }
});

$('.star-rating .fa-star').mouseenter(function(e) {
  var others = $(this).parent().parent().children();
  var star = others.index($(this).parent());

  for (var i = 0; i <= star; i++) {
    $(others.get(i)).find('.fa-star').addClass('highlighted');
  }
});

$('.star-rating .fa-star').mouseleave(function(e) {
  var others = $(this).parent().parent().children();

  for (var i = 0; i < 5; i++) {
    $(others.get(i)).find('.fa-star').removeClass('highlighted');
  }
});

$('.star-rating .fa-star').click(function(e) {
  var others = $(this).parent().parent().children();
  var rating = others.index($(this).parent());
  var id = $('#idea-id').val();

  for (var i = 0; i < 5; i++) {
    $(others.get(i)).find('.fa-star').removeClass('highlighted-permanent');
    $(others.get(i)).find('.fa-star').removeClass('highlighted');
  }

  for (var i = 0; i <= rating; i++) {
    $(others.get(i)).find('.fa-star').addClass('highlighted-permanent');
  }
});
