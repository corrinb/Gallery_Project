$.ajaxSetup({
  error: function(){ $.facebox({ div: '#task-error' }) }
});

$(function(){
  var $form = $('.item > form');

  $form.bind('task:reset', function(){
    $(this).find('select.interval option[data-default=true]')
      .attr('selected', true)
      .trigger('change');
  });

  $form.bind('task:estimate-10min', function(){
		var $span		  = $('.editable .every-10-mins .estimation'),
				hour      = 60*60*1000, // in milliseconds
				now       = (new Date()),
				offset    = parseInt(now.toString().match(/GMT([-+]\d+)/)[1], 10)/100,
				utc       = (new Date(now.getTime() - (offset*hour))),
				timestamp = utc.toString().replace(/(^\w+\s|\d{4}\s|:\d{2}\s.*$)/g,'');

		$span.text(timestamp);
  });

  $form.bind('task:select-interval',function(e, item){
    var $select    = $(item),
        $parent    = $(this),
        selector   = '.interval-' + $select.val(),
        $intervals = $parent.find('.interval-1440, .interval-60, .interval-10'),
        $interval_input = $intervals.find(':input');

    $intervals.hide();
    $interval_input.attr('disabled', true);

    $parent.find(selector).show();
    $parent.find(selector).find(':input').attr('disabled', false);
  });


  // hide/show editable elements
  $('.toggler').bind('click', function(e) {
    var $item = $(this).closest('.item');

    $item.find('form').trigger('task:reset');
    $item.toggleClass('editable');
    e.preventDefault();
  });

  // select an interval
  // swap between daily, hourly or every 10min
  var $interval = $('.interval');

	$interval.bind('change', function(){
    var $item = $(this),
        $form = $item.closest('form');

    $form.trigger('task:select-interval', [this]);

    // dynamically set time for every 10min
		if($item.val() == 10)
      $form.trigger('task:estimate-10min');
  });

  // show new job form
  $('#add-job').bind('click', function(e){
    $('ul.new-job').show();
    $(this).hide();

    e.preventDefault();
  });

  // hide new job form
  $('ul.new-job .cancel').bind('click', function(e){
    $(this).closest('ul.new-job').hide();
    $('#add-job').show();

    e.preventDefault();
  });

  $('#new-job form').bind('submit', function(e){
    var value = $(this).find('input[name=command]').val();
    if(value.trim().length == 0)
      e.preventDefault();
  });

  // submitting a form with updates to a job
  $('.job > form').bind('submit', function(e){
    var $form = $(this);

    $form.find(':submit').addClass('processing');
    $.post(this.action, $form.serialize(), function(json){
      // set new default values
      $form.find('option[data-default]').removeAttr('data-default');
      $form.find('option:selected').attr('data-default', 'true');

      // update task code
      $form.find('.form-control.not-on-edit').val('$ ' + json.command_truncated);

      // dyno size
      var size = $form.find('.dyno_size select option:selected').text();
      $form.find('.dyno_size span').text(size);

      // frequency
      var frequency = $form.find('.frequency select option:selected').text();
      $form.find('.frequency span').text(frequency);

      // next run
      $form.find('.next-run .timestamp').text(json.run_at);

      $form.find(':submit').removeClass('processing');
      $form.closest('li').removeClass('editable');
    },'json');
    e.preventDefault();
  });

  // remove buttons submit its parent form
  $('.item_actions .destructive').bind('click', function(e){
    var $form = $(this).closest('form');
    var confirm = $(this).next('.confirm').show();

    $('.destroy').click(function(event) {
      $form.submit(); return false;
    });

    $('.cancel').click(function(event) {
      confirm.hide();
    });

    e.preventDefault();
  });

});
