$(function() {
  var $new_icon = $('#new-icon');

  $('.set-new-icon').click(function(e) {
    e.preventDefault();
    $new_icon.val($(e.target).data('icon'));
    $new_icon.change();
  });

  $new_icon.change(function(e) {
    $('.icon-preview').html("<i class='fa fa-" + $new_icon.val() + "'></i>");
  });

});
