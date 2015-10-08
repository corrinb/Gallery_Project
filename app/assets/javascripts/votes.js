$('.vote').on('click', function(event) {
  $button = $(this);

  //if it has a theme_id, it must be a vote button
  if($button.attr('theme_id')) {
    $.ajax({
      type: 'POST',
      url: '/votes',
      data: { theme_id: $button.attr('theme_id') },
      dataType: 'json',
      success: function(vote) {
        $button.attr('vote_id', vote.id);
        $button.removeAttr('theme_id');
        $button.addClass('unvote');
        $button.removeClass('vote');
        $button.html('unvote');
      }
    });

  //if it has a vote_id, it must be an unvote button
  } else if ($button.attr('vote_id')) {
    $.ajax({
      type: 'DELETE',
      url: '/votes/' + $button.attr('vote_id'),
      dataType: 'json',
      success: function(theme) {
        $button.attr('theme_id', theme.id);
        $button.removeAttr('vote_id');
        $button.addClass('vote');
        $button.removeClass('unvote');
        $button.html('vote');
      }
    });
  }
});
