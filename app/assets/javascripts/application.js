//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require bootstrap-dropdown
//= require bootstrap-collapse
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

