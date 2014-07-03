//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require bootstrap-dropdown
//= require bootstrap-collapse
//= require bootstrap-tooltip
//= require jquery.lightbox-0.5.min
//= require jquery.ui.datepicker-de
//= require jquery-ui-timepicker-addon
//= require ckeditor/init
//= require jquery_nested_form
//= require_self



$(function() {
    $('a.lightbox').lightBox();
});

$(function() {
    $('.datepicker').datepicker();
});

$(function() {
    $('.event-location').tooltip();
    $('.calendar-event').tooltip();
});


$(function() {
    $('.dropdown-toggle').dropdown()
});

$.datepicker.setDefaults($.datepicker.regional['de']);

$.timepicker.regional['de'] = {
	timeOnlyTitle: 'Uhrzeit auswählen',
	timeText: 'Uhrzeit',
	hourText: 'Stunde',
	minuteText: 'Minute',
	secondText: 'Sekunde',
	millisecText: 'Millisekunde',
	currentText: 'aktuell',
	closeText: 'Schließen',
	ampm: false
};

$.timepicker.setDefaults($.timepicker.regional['de']);
$(function() {
    $(".datetimepicker").datetimepicker();
});


$(document).on('nested:fieldAdded', function(event){
  // this field was just inserted into your form
  var field = event.field;
  // it's a jQuery object already! Now you can find date input
  var dateField = field.find('.datepicker');
  // and activate datepicker on it
  dateField.datepicker();

  var dateField = field.find('.datetimepicker');
  // and activate datepicker on it
  dateField.datetimepicker();
})


