// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
    $('a.lightbox').lightBox();
});

$(function() {
    $('.datepicker').datepicker();
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

