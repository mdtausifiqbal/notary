/*
Author       : Falco
Template Name: Termolino - Bootstrap Template
Version      : 1.3
*/

(function($) {
    "use strict";

	/**
	 * h5Validate
	 * @version v0.9.0
	 * Using semantic versioning: http://semver.org/
	 * @author Eric Hamilton http://ericleads.com/
	 * @copyright 2010 - 2012 Eric Hamilton
	 * Dual licensed under the MIT and GPL licenses:
	 * http://www.opensource.org/licenses/mit-license.php
	 * http://www.gnu.org/licenses/gpl.html
	 *
	 * Developed under the sponsorship of RootMusic, Zumba Fitness, LLC, and Rese Property Management
	 */

	(function(e){"use strict";var t=window.console||function(){},n={defaults:{debug:false,RODom:false,patternLibrary:{phone:/([\+][0-9]{1,3}([ \.\-])?)?([\(]{1}[0-9]{1,6}[\)])?([0-9A-Za-z \.\-]{1,32})(([A-Za-z \:]{1,11})?[0-9]{1,4}?)/,email:/((([a-zA-Z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-zA-Z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-zA-Z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-zA-Z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-zA-Z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-zA-Z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-zA-Z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-zA-Z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-zA-Z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-zA-Z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?/,url:/(https?|ftp):\/\/(((([a-zA-Z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-zA-Z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-zA-Z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-zA-Z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-zA-Z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-zA-Z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-zA-Z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-zA-Z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-zA-Z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-zA-Z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-zA-Z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-zA-Z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-zA-Z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?/,number:/-?(?:\d+|\d{1,3}(?:,\d{3})+)?(?:\.\d+)?/,dateISO:/\d{4}[\/\-]\d{1,2}[\/\-]\d{1,2}/,alpha:/[a-zA-Z]+/,alphaNumeric:/\w+/,integer:/-?\d+/},classPrefix:"h5-",errorClass:"ui-state-error",validClass:"ui-state-valid",activeClass:"active",requiredClass:"required",requiredAttribute:"required",patternAttribute:"pattern",errorAttribute:"data-h5-errorid",customEvents:{validate:true},kbSelectors:":input:not(:button):not(:disabled):not(.novalidate)",focusout:true,focusin:false,change:true,keyup:false,activeKeyup:true,mSelectors:'[type="range"]:not(:disabled):not(.novalidate), :radio:not(:disabled):not(.novalidate), :checkbox:not(:disabled):not(.novalidate), select:not(:disabled):not(.novalidate), option:not(:disabled):not(.novalidate)',click:true,requiredVar:"h5-required",patternVar:"h5-pattern",stripMarkup:true,submit:true,focusFirstInvalidElementOnSubmit:true,validateOnSubmit:true,invalidCallback:function(){},validCallback:function(){},allValidSelectors:":input:visible:not(:button):not(:disabled):not(.novalidate)",markInvalid:function(n){var r=e(n.element),i=e(n.errorID);r.addClass(n.errorClass).removeClass(n.validClass);r.addClass(n.settings.activeClass);if(i.length){if(r.attr("title")){i.text(r.attr("title"))}i.show()}r.data("valid",false);n.settings.invalidCallback.call(n.element,n.validity);return r},markValid:function(n){var r=e(n.element),i=e(n.errorID);r.addClass(n.validClass).removeClass(n.errorClass);if(i.length){i.hide()}r.data("valid",true);n.settings.validCallback.call(n.element,n.validity);return r},unmark:function(n){var r=e(n.element);r.removeClass(n.errorClass).removeClass(n.validClass);r.form.find("#"+n.element.id).removeClass(n.errorClass).removeClass(n.validClass);return r}}},r=n.defaults,i=r.patternLibrary,s=function(n){return e.extend({customError:n.customError||false,patternMismatch:n.patternMismatch||false,rangeOverflow:n.rangeOverflow||false,rangeUnderflow:n.rangeUnderflow||false,stepMismatch:n.stepMismatch||false,tooLong:n.tooLong||false,typeMismatch:n.typeMismatch||false,valid:n.valid||true,valueMissing:n.valueMissing||false},n)},o={isValid:function(t,n){var r=e(this);n=t&&n||{};if(n.revalidate!==false){r.trigger("validate")}return r.data("valid")},allValid:function(t,n){var r=true,i=[],s=e(this),o,u,a=[],f=function(t,n){n.e=t;i.push(n)},l=e.extend({},t,n);n=n||{};s.trigger("formValidate",{settings:e.extend(true,{},l)});s.undelegate(l.allValidSelectors,".allValid",f);s.delegate(l.allValidSelectors,"validated.allValid",f);o=s.find(l.allValidSelectors);u=o.filter(function(e){var t;if(this.tagName==="INPUT"&&this.type==="radio"){t=this.name;if(a[t]===true){return false}a[t]=true}return true});u.each(function(){var t=e(this);r=t.h5Validate("isValid",n)&&r});s.trigger("formValidated",{valid:r,elements:i});return r},validate:function(n){var r=e(this),i=r.filter("[pattern]")[0]?r.attr("pattern"):false,o=new RegExp("^(?:"+i+")$"),u=null,a=r.is("[type=checkbox]")?r.is(":checked"):r.is("[type=radio]")?(u=r.parents("form").find('input[name="'+r.attr("name")+'"]')).filter(":checked").length>0:r.val(),f=n.errorClass,l=n.validClass,c=r.attr(n.errorAttribute)||false,h=c?"#"+c.replace(/(:|\.|\[|\])/g,"\\$1"):false,p=false,d=s({element:this,valid:true}),v=e("<input required>"),m;if(v.filter("[required]")&&v.filter("[required]").length){p=r.filter("[required]").length&&r.attr("required")!=="false"}else{p=r.attr("required")!==undefined}if(n.debug&&window.console){t.log('Validate called on "'+a+'" with regex "'+o+'". Required: '+p);t.log("Regex test: "+o.test(a)+", Pattern: "+i)}m=parseInt(r.attr("maxlength"),10);if(!isNaN(m)&&a.length>m){d.valid=false;d.tooLong=true}if(p&&!a){d.valid=false;d.valueMissing=true}else if(i&&!o.test(a)&&a){d.valid=false;d.patternMismatch=true}else{if(!n.RODom){n.markValid({element:this,validity:d,errorClass:f,validClass:l,errorID:h,settings:n})}}if(!d.valid){if(!n.RODom){n.markInvalid({element:this,validity:d,errorClass:f,validClass:l,errorID:h,settings:n})}}r.trigger("validated",d);if(u!==null&&n.alreadyCheckingRelatedRadioButtons!==true){n.alreadyCheckingRelatedRadioButtons=true;u.not(r).trigger("validate");n.alreadyCheckingRelatedRadioButtons=false}},delegateEvents:function(t,n,r,i){var s={},o=0,u=function(){i.validate.call(this,i)};e.each(n,function(e,t){if(t){s[e]=e}});for(o in s){if(s.hasOwnProperty(o)){e(r).delegate(t,s[o]+".h5Validate",u)}}return r},bindDelegation:function(t){var n=e(this),r;e.each(i,function(n,r){var i=r.toString();i=i.substring(1,i.length-1);e("."+t.classPrefix+n).attr("pattern",i)});r=n.filter("form").add(n.find("form")).add(n.parents("form"));r.attr("novalidate","novalidate").submit(u);r.find("input[formnovalidate][type='submit']").click(function(){e(this).closest("form").unbind("submit",u)});return this.each(function(){var e={focusout:t.focusout,focusin:t.focusin,change:t.change,keyup:t.keyup},n={click:t.click},r={keyup:t.activeKeyup};t.delegateEvents(":input",t.customEvents,this,t);t.delegateEvents(t.kbSelectors,e,this,t);t.delegateEvents(t.mSelectors,n,this,t);t.delegateEvents(t.activeClassSelector,r,this,t);t.delegateEvents("textarea[maxlength]",{keyup:true},this,t)})}},u=function(t){var n,r=l.call(this),i;if(r.submit!==true){return}n=e(this);i=n.h5Validate("allValid",{revalidate:r.validateOnSubmit===true});if(i!==true){t.preventDefault();if(r.focusFirstInvalidElementOnSubmit===true){var s=e(r.allValidSelectors,n).filter(function(t){return e(this).h5Validate("isValid",{revalidate:false})!==true});s.first().focus()}}return i},a=[],f=function(n){var i=e.extend({},r,n,o),s=i.classPrefix+i.activeClass;return e.extend(i,{activeClass:s,activeClassSelector:"."+s,requiredClass:i.classPrefix+i.requiredClass,el:this})},l=function(){var n=e(this).closest("[data-h5-instanceId]");return a[n.attr("data-h5-instanceId")]},c=function(n){var r=a.push(n)-1;if(n.RODom!==true){e(this).attr("data-h5-instanceId",r)}e(this).trigger("instance",{"data-h5-instanceId":r})};e.h5Validate={addPatterns:function(e){var t=r.patternLibrary,n;for(n in e){if(e.hasOwnProperty(n)){t[n]=e[n]}}return t},validValues:function(t,n){var r=0,i=n.length,s="",o;for(r=0;r<i;r+=1){s=s?s+"|"+n[r]:n[r]}o=new RegExp("^(?:"+s+")$");e(t).data("regex",o)}};e.fn.h5Validate=function(n){var r,i,s;if(typeof n==="string"&&typeof o[n]==="function"){s=l.call(this);i=[].slice.call(arguments,0);r=n;i.shift();i=e.merge([s],i);return s[r].apply(this,i)}s=f.call(this,n);c.call(this,s);return o.bindDelegation.call(this,s)}})(jQuery);
	/* end h5Validate */


	// Form Validation & Send Data
	if(typeof($('.myForm form')) != 'undefined') {
		$.each($('.myForm form'), function(index, el) {
			var	cform = $(el),
				cSuccess = $(".form_response_success"),
				cError = $(".form_response_error");

			cform.h5Validate();

			cform.submit(function(e) {
				e.preventDefault();

				cSuccess.hide();
				cError.hide();

				if(cform.h5Validate('allValid')) {
					// $("#formsendbutton").prop('disabled', true).text("{t}transmitting ...{/t}");
					$("#formsendbutton").prop('disabled', true);
					$(".submit-section", cform).hide();
					$(".progress-section", cform).show();
					// cResponse.hide();
					$.post(
						$(this).attr('action'),
						cform.serialize(),
						function(data){
							if(data.match('success') != null) {
								// cform.get(0).reset();
								cSuccess.fadeIn('fast');
								// $("#formsendbutton").prop('disabled', true).text("{t}transmitted!{/t}");
								$("#formsendbutton").prop('disabled', true);
								$("#formsendbutton").hide();
								$(".submit-section", cform).hide();
								$(".progress-section", cform).hide();
								// cform.css( "background-color", "green");
//								$(".myForm .g-recaptcha").hide();
							}
							else
							{
								if (data !== '') {
									$(".response-details", cError).html(data);
								} else {
									$(".response-details", cError).html("");
								}
								cError.fadeIn('fast');
								$(".myForm .form-control").prop('disabled', false);
//								$(".myForm .g-recaptcha").show();
//								grecaptcha.reset();
								// $("#formsendbutton").prop('disabled', false).text("{t}send{/t}");
								$("#formsendbutton").prop('disabled', false);
								$(".submit-section", cform).show();
								$(".progress-section", cform).hide();
								// cform.css( "background-color", "red");
							}
						})
						.fail(function(data) {
							if (data.responseText !== '') {
								$(".response-details", cError).html(data.responseText);
							} else {
								$(".response-details", cError).html("");
							}
							cError.fadeIn('fast');
							// $("#formsendbutton").prop('disabled', false).text("{t}send{/t}");
							$("#formsendbutton").prop('disabled', false);
							$(".myForm .form-control").prop('disabled', false);
							$(".submit-section", cform).show();
							$(".progress-section", cform).hide();
							// cform.css( "background-color", "red");
						}
						); // end post
					$(".myForm .form-control").prop('disabled', true);
					// $(".myForm .g-recaptcha").hide();
				}
				return false;
			});
		});
	}	
// END Form Validation & Send Mail code


	// Stick Sidebar
	
	if ($(window).width() > 767) {
		if($('.theiaStickySidebar').length > 0) {
			$('.theiaStickySidebar').theiaStickySidebar({
			  // Settings
			  additionalMarginTop: 30
			});
		}
	}
	
	// Sidebar
	
	if($(window).width() <= 991){
	var Sidemenu = function() {
		this.$menuItem = $('.main-nav a');
	};
	
	function init() {
		var $this = Sidemenu;
		$('.main-nav a').on('click', function(e) {
			if($(this).parent().hasClass('has-submenu')) {
				e.preventDefault();
			}
			if(!$(this).hasClass('submenu')) {
				$('ul', $(this).parents('ul:first')).slideUp(350);
				$('a', $(this).parents('ul:first')).removeClass('submenu');
				$(this).next('ul').slideDown(350);
				$(this).addClass('submenu');
			} else if($(this).hasClass('submenu')) {
				$(this).removeClass('submenu');
				$(this).next('ul').slideUp(350);
			}
		});
	}

	// Sidebar Initiate
	init();
	}
	
	// Textarea Text Count
	
	var maxLength = 100;
	$('#review_desc').on('keyup change', function () {
		var length = $(this).val().length;
		 length = maxLength-length;
		$('#chars').text(length);
	});
	
	// Select 2
	
	if($('.select').length > 0) {
		$('.select').select2({
			minimumResultsForSearch: -1,
			width: '100%'
		});
	}
	
	// Date Time Picker
	
	if($('.datetimepicker').length > 0) {
		$('.datetimepicker').datetimepicker({
			format: 'DD/MM/YYYY',
			icons: {
				up: "fas fa-chevron-up",
				down: "fas fa-chevron-down",
				next: 'fas fa-chevron-right',
				previous: 'fas fa-chevron-left'
			}
		});
	}
	
	// Floating Label

	if($('.floating').length > 0 ){
		$('.floating').on('focus blur', function (e) {
		$(this).parents('.form-focus').toggleClass('focused', (e.type === 'focus' || this.value.length > 0));
		}).trigger('blur');
	}
	
	// Mobile menu sidebar overlay
	
	$('body').append('<div class="sidebar-overlay"></div>');
	$(document).on('click', '#mobile_btn', function() {
		$('main-wrapper').toggleClass('slide-nav');
		$('.sidebar-overlay').toggleClass('opened');
		$('html').addClass('menu-opened');
		return false;
	});
	
	$(document).on('click', '.sidebar-overlay', function() {
		$('html').removeClass('menu-opened');
		$(this).removeClass('opened');
		$('main-wrapper').removeClass('slide-nav');
	});
	
	$(document).on('click', '#menu_close', function() {
		$('html').removeClass('menu-opened');
		$('.sidebar-overlay').removeClass('opened');
		$('main-wrapper').removeClass('slide-nav');
	});
	
	// Tooltip
	
	if($('[data-toggle="tooltip"]').length > 0 ){
		$('[data-toggle="tooltip"]').tooltip();
	}
	
	// Add More Hours
	
    $(".hours-info").on('click','.trash', function () {
		$(this).closest('.hours-cont').remove();
		return false;
    });

    $(".add-hours").on('click', function () {
		
		var hourscontent = '<div class="row form-row hours-cont">' +
			'<div class="col-12 col-md-10">' +
				'<div class="row form-row">' +
					'<div class="col-12 col-md-6">' +
						'<div class="form-group">' +
							'<label>Start Time</label>' +
							'<select class="form-control">' +
								'<option>-</option>' +
								'<option>12.00 am</option>' +
								'<option>12.30 am</option>' + 
								'<option>1.00 am</option>' +
								'<option>1.30 am</option>' +
							'</select>' +
						'</div>' +
					'</div>' +
					'<div class="col-12 col-md-6">' +
						'<div class="form-group">' +
							'<label>End Time</label>' +
							'<select class="form-control">' +
								'<option>-</option>' +
								'<option>12.00 am</option>' +
								'<option>12.30 am</option>' +
								'<option>1.00 am</option>' +
								'<option>1.30 am</option>' +
							'</select>' +
						'</div>' +
					'</div>' +
				'</div>' +
			'</div>' +
			'<div class="col-12 col-md-2"><label class="d-md-block d-sm-none d-none">&nbsp;</label><a href="#" class="btn btn-danger trash"><i class="far fa-trash-alt"></i></a></div>' +
		'</div>';
		
        $(".hours-info").append(hourscontent);
        return false;
    });
	
	// Content div min height set
	
	function resizeInnerDiv() {
		var height = $(window).height();	
		var header_height = $(".header").height();
		var footer_height = $(".footer").height();
		var setheight = height - header_height;
		var trueheight = setheight - footer_height;
		$(".content").css("min-height", trueheight);
	}
	
	if($('.content').length > 0 ){
		resizeInnerDiv();
	}

	$(window).resize(function(){
		if($('.content').length > 0 ){
			resizeInnerDiv();
		}
	});
	
	// Slick Slider
	
	if($('.specialities-slider').length > 0) {
		$('.specialities-slider').slick({
			dots: true,
			autoplay:false,
			infinite: true,
			variableWidth: true,
			prevArrow: false,
			nextArrow: false
		});
	}
	
	if($('.contractor-slider').length > 0) {
		$('.contractor-slider').slick({
			dots: false,
			autoplay:false,
			infinite: true,
			variableWidth: true,
		});
	}
	if($('.features-slider').length > 0) {
		$('.features-slider').slick({
			dots: true,
			infinite: true,
			centerMode: true,
			slidesToShow: 3,
			speed: 500,
			variableWidth: true,
			arrows: false,
			autoplay:false,
			responsive: [{
				  breakpoint: 992,
				  settings: {
					slidesToShow: 1
				  }

			}]
		});
	}
	
	// Date Range Picker
	if($('.bookingrange').length > 0) {
		var start = moment().subtract(6, 'days');
		var end = moment();

		function booking_range(start, end) {
			$('.bookingrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
		}

		$('.bookingrange').daterangepicker({
			startDate: start,
			endDate: end,
			ranges: {
				'Today': [moment(), moment()],
				'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
				'Last 7 Days': [moment().subtract(6, 'days'), moment()],
				'Last 30 Days': [moment().subtract(29, 'days'), moment()],
				'This Month': [moment().startOf('month'), moment().endOf('month')],
				'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
			}
		}, booking_range);

		booking_range(start, end);
	}
	// Chat

	var chatAppTarget = $('.chat-window');
	(function() {
		if ($(window).width() > 991)
			chatAppTarget.removeClass('chat-slide');
		
		$(document).on("click",".chat-window .chat-users-list a.media",function () {
			if ($(window).width() <= 991) {
				chatAppTarget.addClass('chat-slide');
			}
			return false;
		});
		$(document).on("click","#back_user_list",function () {
			if ($(window).width() <= 991) {
				chatAppTarget.removeClass('chat-slide');
			}	
			return false;
		});
	})();
	
	// Circle Progress Bar
	
	function animateElements() {
		$('.circle-bar1').each(function () {
			var elementPos = $(this).offset().top;
			var topOfWindow = $(window).scrollTop();
			var percent = $(this).find('.circle-graph1').attr('data-percent');
			var animate = $(this).data('animate');
			if (elementPos < topOfWindow + $(window).height() - 30 && !animate) {
				$(this).data('animate', true);
				$(this).find('.circle-graph1').circleProgress({
					value: percent / 100,
					size : 400,
					thickness: 30,
					fill: {
						color: '#da3f81'
					}
				});
			}
		});
		$('.circle-bar2').each(function () {
			var elementPos = $(this).offset().top;
			var topOfWindow = $(window).scrollTop();
			var percent = $(this).find('.circle-graph2').attr('data-percent');
			var animate = $(this).data('animate');
			if (elementPos < topOfWindow + $(window).height() - 30 && !animate) {
				$(this).data('animate', true);
				$(this).find('.circle-graph2').circleProgress({
					value: percent / 100,
					size : 400,
					thickness: 30,
					fill: {
						color: '#68dda9'
					}
				});
			}
		});
		$('.circle-bar3').each(function () {
			var elementPos = $(this).offset().top;
			var topOfWindow = $(window).scrollTop();
			var percent = $(this).find('.circle-graph3').attr('data-percent');
			var animate = $(this).data('animate');
			if (elementPos < topOfWindow + $(window).height() - 30 && !animate) {
				$(this).data('animate', true);
				$(this).find('.circle-graph3').circleProgress({
					value: percent / 100,
					size : 400,
					thickness: 30,
					fill: {
						color: '#1b5a90'
					}
				});
			}
		});
	}	
	
	if($('.circle-bar').length > 0) {
		animateElements();
	}
	$(window).scroll(animateElements);
	
	// Preloader
	
	$(window).on('load', function () {
		if($('#loader').length > 0) {
			$('#loader').delay(350).fadeOut('slow');
			$('body').delay(350).css({ 'overflow': 'visible' });
		}
	})
	
})(jQuery);