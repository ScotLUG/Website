var fixHeights = function() {
  $('.main-content').css('padding-top', $('.navbar').height());
}

$(document).ready(function() {
  fixHeights();
  $(window).resize(function() {
    fixHeights();
  });
});
