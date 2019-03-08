window.onload = function () {
		       Rili()
		 	}


//日历
function Rili() {
	$('#calendar').eCalendar({
		weekDays: ['星期日','星期一', '星期二', '星期三', '星期四', '星期五', '星期六'],
		months: ['01', '02', '03', '04', '05', '06',
			'07', '08', '09', '10', '11', '12'
		]
		/*events: [{
				title: '活动标题 1',
				活动描述: '活动描述 1',
				datetime: new Date(2018, 3, 16, 12),
				href: 'http://www.baidu.com'
			},
			{
				title: '活动标题 1',
				活动描述: '活动描述 1',
				datetime: new Date(2018, 10, 16, 12),
				href: 'http://www.baidu.com'
			},
			{
				title: '活动标题 2',
				活动描述: '活动描述 2',
				datetime: new Date(2018, 11, 17, 12)
			},
			{
				title: '活动标题 3',
				活动描述: '活动描述 3',
				datetime: new Date(2018, 12, 18, 17)
			},
			{
				title: '活动标题 4',
				活动描述: '活动描述 4',
				datetime: new Date(2019, 1, 19, 12)
			},
			{
				title: '活动标题 3',
				活动描述: '活动描述 3',
				datetime: new Date(2019, 2, 20, 17)
			},
			{
				title: '活动标题 3',
				活动描述: '活动描述 3',
				datetime: new Date(2019, 3, 21, 17)
			},
			{
				title: '活动标题 3',
				活动描述: '活动描述 3',
				datetime: new Date(2019, 4, 22, 17)
			},
			{
				title: '活动标题 3',
				活动描述: '活动描述 3',
				datetime: new Date(2019, 5, 23, 17)
			},
			{
				title: '活动标题 3',
				活动描述: '活动描述 3',
				datetime: new Date(2019, 6, 24, 17)
			},
			{
				title: '活动标题 3',
				活动描述: '活动描述 3',
				datetime: new Date(2019, 7, 25, 17)
			},
			{
				title: '活动标题 3',
				活动描述: '活动描述 3',
				datetime: new Date(2018, 3, 26, 17)
			},
			{
				title: '活动标题 3',
				活动描述: '活动描述 3',
				datetime: new Date(2018, 3, 27, 17)
			},
			{
				title: '活动标题 3',
				活动描述: '活动描述 3',
				datetime: new Date(2018, 6, 15, 17)
			},
			{
				title: '活动标题 3',
				活动描述: '活动描述 3',
				datetime: new Date(2018, 6, 27, 17)
			},
			{
				title: '活动标题 3',
				活动描述: '活动描述 3',
				datetime: new Date(2018, 7, 23, 17)
			},
			{
				title: '活动标题 3',
				活动描述: '活动描述 3',
				datetime: new Date(2018, 8, 3, 17)
			}
		]*/
	});
};

(function($) {

	var eCalendar = function(options, object) {
		// Initializing global variables
		var adDay = new Date().getDate();
		var adMonth = new Date().getMonth();
		var adYear = new Date().getFullYear();
		var dDay = adDay;
		var dMonth = adMonth;
		var dYear = adYear;
		var instance = object;

		var settings = $.extend({}, $.fn.eCalendar.defaults, options);

		function lpad(value, length, pad) {
			if(typeof pad == 'undefined') {
				pad = '0';
			}
			var p;
			for(var i = 0; i < length; i++) {
				p += pad;
			}
			return(p + value).slice(-length);
		}

		var mouseOver = function() {
			$(this).addClass('c-nav-btn-over');
		};
		var mouseLeave = function() {
			$(this).removeClass('c-nav-btn-over');
		};

		var mouseOverEvent = function() {
			$(".c-event-list").scrollTop(0);
			$(this).addClass('c-event-over');
			var d = $(this).attr('data-event-day');
			$('div.c-event-item[data-event-day="' + d + '"]').addClass('c-event-over1').host;
			$(".c-event-list").scrollTop($('div.c-event-item[data-event-day="' + d + '"]').position().top - $('div.c-event-item[data-event-day="' + d + '"]').height())
		};

		var mouseLeaveEvent = function() {
			$(this).removeClass('c-event-over')
			var d = $(this).attr('data-event-day');
			$('div.c-event-item[data-event-day="' + d + '"]').removeClass('c-event-over1');

		};
		var mouseOverItem = function() {
			$(this).addClass('c-event-over1');
			var d = $(this).attr('data-event-day');
			$('div.c-event[data-event-day="' + d + '"]').addClass('c-event-over');
		};
		var mouseLeaveItem = function() {
			$(this).removeClass('c-event-over1')
			var d = $(this).attr('data-event-day');
			$('div.c-event[data-event-day="' + d + '"]').removeClass('c-event-over');
		};

		var clickitem = function() {
			var d = $(this).attr('data-event-day');
			$('div.c-event-item[data-event-day="' + d + '"]').siblings().removeAttr("style")
			$('div.c-event-item[data-event-day="' + d + '"]').css({
				"font-weight": "700",
				"color": "#fff",
				"background": "-webkit-linear-gradient(left, #01c2e6 , #1160ff)",
				"background": " -o-linear-gradient(right, #01c2e6 , #1160ff)",
				"background": "-moz-linear-gradient(right, #01c2e6 , #1160ff)",
				"background": "linear-gradient(to right, #01c2e6 , #1160ff)"
			}).host;
			$('div.c-event-item[data-event-day="' + d + '"]').siblings().children().removeAttr("style")
			$('div.c-event-item[data-event-day="' + d + '"]').children().css("color", "white")
			$('div.c-event[data-event-day="' + d + '"]').siblings().removeAttr("style")
			$('div.c-event[data-event-day="' + d + '"]').css({
				"box-shadow": " 0 0 8px #cccccc",
				"font-weight": "700",
				"color": "#fff",
				"background": "-webkit-linear-gradient(left, #01c2e6 , #1160ff)",
				"background": " -o-linear-gradient(right, #01c2e6 , #1160ff)",
				"background": "-moz-linear-gradient(right, #01c2e6 , #1160ff)",
				"background": "linear-gradient(to right, #01c2e6 , #1160ff)"
			}).host;

		}

		var nextMonth = function() {
			if(dMonth < 11) {
				dMonth++;
			} else {
				dMonth = 0;
				dYear++;
			}
			print();
			if($(".c-day").is(".c-today")) {
				$(".c-month-top").html(dYear + "-" + settings.months[dMonth]);
				$(".c-month-center").html($(".c-today").text());
				//	            $(".c-month-bottom").html("有课");
			} else {
				$(".c-month-top").html(dYear);
				$(".c-month-center").html(settings.months[dMonth]);
				$(".c-month-bottom").html("");
			}

		};
		var previousMonth = function() {
			if(dMonth > 0) {
				dMonth--;
			} else {
				dMonth = 11;
				dYear--;
			}
			print();
			if($(".c-day").is(".c-today")) {
				$(".c-month-top").html(dYear + "-" + settings.months[dMonth]);
				$(".c-month-center").html($(".c-today").text());
				//	            $(".c-month-bottom").html("有课");
			} else {
				$(".c-month-top").html(dYear);
				$(".c-month-center").html(settings.months[dMonth]);
				$(".c-month-bottom").html("");
			}
		};

		function loadEvents() {
			if(typeof settings.url != 'undefined' && settings.url != '') {
				$.ajax({
					url: settings.url,
					async: false,
					success: function(result) {
						settings.events = result;
					}
				});
			}
		}
		function mGetDate(year, month){
		    var d = new Date(year, month, 0);
		    return d.getDate();
		}

		function print() {
			loadEvents();
			var dWeekDayOfMonthStart = new Date(dYear, dMonth, 1).getDay();
			var dLastDayOfMonth = new Date(dYear, dMonth + 1, 0).getDate();
			var dLastDayOfPreviousMonth = new Date(dYear, dMonth + 1, 0).getDate() - dWeekDayOfMonthStart + 1;

			var cBody = $('<div/>').addClass('c-grid');
			var cEvents = $('<div/>').addClass('c-event-grid');
			var cEventsBody = $('<div/>').addClass('c-event-body');
			var cEventsTop = $('<div/>').addClass('c-event-top clearfix');
			cEvents.append($('<div/>').addClass('c-event-title c-pad-top').html(settings.eventTitle));
			cEvents.append(cEventsBody);
			var cNext = $('<div/>').addClass('c-next c-grid-title c-pad-top');
			var cMonth = $('<div/>').addClass('c-month c-grid-title c-pad-top');
			var cPrevious = $('<div/>').addClass('c-previous c-grid-title c-pad-top');
			cPrevious.html(settings.textArrows.previous);

			cNext.html(settings.textArrows.next);

			cPrevious.on('mouseover', mouseOver).on('mouseleave', mouseLeave).on('click', previousMonth);
			cNext.on('mouseover', mouseOver).on('mouseleave', mouseLeave).on('click', nextMonth);

			cEventsTop.append(cPrevious);
			cEventsTop.append(cMonth);
			cEventsTop.append(cNext);
			for(var i = 0; i < settings.weekDays.length; i++) {
				var cWeekDay = $('<div/>').addClass('c-week-day c-pad-top');
				cWeekDay.html(settings.weekDays[i]);
				cBody.append(cWeekDay);
			}
			var day = 1;
			var dayOfNextMonth = 1;
			
			for(var i = 0; i < 42; i++) {
				var cDay = $('<div/>');
				if(i < dWeekDayOfMonthStart) {
					cDay.addClass('c-day-previous-month c-pad-top');
					//                  cDay.html(dLastDayOfPreviousMonth++);
				} else if(day <= dLastDayOfMonth) {
					cDay.addClass('c-day c-pad-top');
					if(day == dDay && adMonth == dMonth && adYear == dYear) {
						cDay.addClass('c-today');
					}
					for(var j = 0; j < settings.events.length; j++) {
						var d = settings.events[j].datetime;
						
						if(d.getDate() == day && (d.getMonth() - 1) == dMonth && d.getFullYear() == dYear) {
							cDay.addClass('c-event').attr('data-event-day', d.getDate());
							cDay.on('mouseover', mouseOverEvent).on('mouseleave', mouseLeaveEvent).on('click', clickitem);
						}
					}
					cDay.html(day++);
				} else {
					cDay.addClass('c-day-next-month c-pad-top');
					//                  cDay.html(dayOfNextMonth++);
				}
				cBody.append(cDay);
			}
			var eventList = $('<div/>').addClass('c-event-list');
			for(var i = 0; i < settings.events.length; i++) {
				var d = settings.events[i].datetime;
				if((d.getMonth() - 1) == dMonth && d.getFullYear() == dYear) {
					var date = lpad(d.getMonth(), 2) + '/' + lpad(d.getDate(), 2) + ' ' + lpad(d.getHours(), 2) + ':' + lpad(d.getMinutes(), 2);
					var item = $('<div/>').addClass('c-event-item');
					var a = $('<a/>').addClass('c-event-item-a').attr('href', settings.events[i].href);;
					var title = $('<div/>').addClass('title').html(date + '  ' + settings.events[i].title);
					var 活动描述 = $('<div/>').addClass('活动描述').html(settings.events[i].活动描述);
					item.attr('data-event-day', d.getDate());
					item.on('mouseover', mouseOverItem).on('mouseleave', mouseLeaveItem).on('click', clickitem);

					item.append(a);
					a.append(title).append(活动描述);
					eventList.append(item);

				}
			}

			$(instance).addClass('calendar');

			cEventsBody.append(eventList);
			$(instance).html(cEventsTop).append(cEvents);
			$(instance).prepend(cBody);
			$(".c-event-item").addClass("clearfix");

			var cMontop = $("<div/>").addClass("c-month-top");
			cMonth.append(cMontop);
			cMontop.html(dYear + "-" + settings.months[dMonth]);
			var cMoncenter = $("<div/>").addClass("c-month-center");
			cMonth.append(cMoncenter);
			cMoncenter.html($(".c-today").text());
			var cMonbottom = $("<div/>").addClass("c-month-bottom");
			cMonth.append(cMonbottom);
			if($(".c-today").is(".c-event")) {
				cMonbottom.html("有课");
			} else {
				cMonbottom.html(" ");
			}

		}

		return print();
	}

	$.fn.eCalendar = function(oInit) {
		return this.each(function() {
			return eCalendar(oInit, $(this));
		});
	};

	// plugin defaults
	$.fn.eCalendar.defaults = {
		weekDays: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab'],
		months: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
		textArrows: {
			previous: '',
			next: ''
		},
		eventTitle: '',
		url: '',
		events: []
	};

}(jQuery));


$(function () {
    $(".number2").click(function () {
        $(".mainForm1").show();
        $(".mainForm2").hide();
        $(".error").hide();
        $(".normalInput").removeClass("errorC");
        $(".normalInput").removeClass("checkedN");
        $(".mainForm input").val("");
    });
    $(".number1").click(function () {
        $(".mainForm2").show();
        $(".mainForm1").hide();
        $(".error").hide();
        $(".normalInput").removeClass("errorC");
        $(".normalInput").removeClass("checkedN");
        $(".mainForm input").val("");
    });
    $(".mainForm input").blur(function () {
        $("#mz_Float").css("top", "");
    });
    $(".checkboxPic").click(function () {
        if ($(this).attr("isshow") == "false") {
            $(this).parent().css("margin-bottom", "10px");
            $(".checkboxPic i").css({"background-position": " -0px -127px"});
            $(".otherError").css("display", "block");
            $(this).attr("isshow", "true");
        }
        else {
            $(this).parent().css("margin-bottom", "");
            $(".checkboxPic i").css({"background-position": "-31px -127px"});
            $(".otherError").hide();
            $(this).attr("isshow", "false");
        }
    });
    $(".pwdBtnShow").click(function () {
        if ($(".pwdBtnShow").attr("isshow") == "false") {
            $(".pwdBtnShow i").css("background-position", "-60px -93px");
            $(".password").hide();
            $(".password1").val($(".password").val());
            $(".password1").show();
            $(".pwdBtnShow").attr("isshow", "true");
        }
        else {
            $(".pwdBtnShow i").css("background-position", "-30px -93px");
            $(".password1").hide();
            $(".password").val($(".password1").val());
            $(".password").show();
            $(".pwdBtnShow").attr("isshow", "false");
        }
    });
    $(".phone").blur(function () {
        reg = /^1[3|4|5|8][0-9]\d{4,8}$/i;
        if ($(".phone").val() == "") {
            $(".phone").parent().addClass("errorC");
            $(".error1").html("请输入手机号");
            $(".error1").css("display", "block");
        }
        else if ($(".phone").val().length < 11) {
            $(".phone").parent().addClass("errorC");
            $(".error1").html("手机号长度有误！");
            $(".error1").css("display", "block");
        }
        else if (!reg.test($(".phone").val())) {
            $(".phone").parent().addClass("errorC");
            $(".error1").html("逗我呢吧，你确定这是你的手机号!!");
            $(".error1").css("display", "block");
        }
        else {
            $(".phone").parent().addClass("checkedN");
        }
    });
    $(".kapkey").blur(function () {
        reg = /^.*[\u4e00-\u9fa5]+.*$/;
        if ($(".kapkey").val() == "") {
            $(".kapkey").parent().addClass("errorC");
            $(".error2").html("请填写验证码");
            $(".error2").css("display", "block");
        }
        else if ($(".kapkey").val().length < 6) {
            $(".kapkey").parent().addClass("errorC");
            $(".error2").html("验证码长度有误！");
            $(".error2").css("display", "block");
        }
        else if (reg.test($(".kapkey").val())) {
            $(".kapkey").parent().addClass("errorC");
            $(".error2").html("验证码里无中文！");
            $(".error2").css("display", "block");
        }
        else {
            $(".kapkey").parent().addClass("checkedN");
        }
    });
    $(".password,.password1").blur(function () {
        reg1 = /^.*[\d]+.*$/;
        reg2 = /^.*[A-Za-z]+.*$/;
        reg3 = /^.*[_@#%&^+-/*\/\\]+.*$/;
        if ($(".pwdBtnShow").attr("isshow") == "false") {
            var Pval = $(".password").val();
        }
        else {
            var Pval = $(".password1").val();
        }
        if (Pval == "") {
            $(".password").parent().addClass("errorC");
            $(".error3").html("请填写密码");
            $(".error3").css("display", "block");
        }
        else if (Pval.length > 16 || Pval.length < 8) {
            $(".password").parent().addClass("errorC");
            $(".error3").html("密码应为8-16个字符，区分大小写");
            $(".error3").css("display", "block");
        }
        else if (!((reg1.test(Pval) && reg2.test(Pval)) || (reg1.test(Pval) && reg3.test(Pval)) || (reg2.test(Pval) && reg3.test(Pval)))) {
            $(".password").parent().addClass("errorC");
            $(".error3").html("需至少包含数字、字母和符号中的两种类型");
            $(".error3").css("display", "block");
        }
        else {
            $(".password").parent().addClass("checkedN");
        }
    });
    $(".phone").focus(function () {
        $(".phone").parent().removeClass("errorC");
        $(".phone").parent().removeClass("checkedN");
        $(".error1").hide();
        $("#mz_Float").css("top", "232px");
        $("#mz_Float").find(".bRadius2").html("输入11位手机号码，可用于登录和找回密码");
    });
    $(".kapkey").focus(function () {
        $(".kapkey").parent().removeClass("errorC");
        $(".kapkey").parent().removeClass("checkedN");
        $(".error2").hide();
        if ($(".error1").css("display") == "block") {
            $("#mz_Float").css("top", "334px");
        }
        else {
            $("#mz_Float").css("top", "304px");
        }
        $("#mz_Float").find(".bRadius2").html("请输入手机收到的验证码");
    });
    $(".password,.password1").focus(function () {
        $(".password").parent().removeClass("errorC");
        $(this).parent().removeClass("checkedN");
        $(".error3").hide();
        if ($(".error1").css("display") == "block" && $(".error2").css("display") == "block") {
            $("#mz_Float").css("top", "436px");
        }
        else if ($(".error1").css("display") == "block" || $(".error2").css("display") == "block") {
            $("#mz_Float").css("top", "406px");
        }
        else {
            $("#mz_Float").css("top", "376px");
        }
        $("#mz_Float").find(".bRadius2").html("长度为8-16个字符，区分大小写，至少包含两种类型");
    });
    $(".pwdBtnShowN").click(function () {
        if ($(".pwdBtnShowN").attr("isshow") == "false") {
            $(".pwdBtnShowN i").css("background-position", "-60px -93px");
            $(".passwordN").hide();
            $(".password1N").val($(".passwordN").val());
            $(".password1N").show();
            $(".pwdBtnShowN").attr("isshow", "true");
        }
        else {
            $(".pwdBtnShowN i").css("background-position", "-30px -93px");
            $(".password1N").hide();
            $(".passwordN").val($(".password1N").val());
            $(".passwordN").show();
            $(".pwdBtnShowN").attr("isshow", "false");
        }
    });
    $(".username").focus(function () {
        $(".username").parent().removeClass("errorC");
        $(".username").parent().removeClass("checkedN");
        $(".error1").hide();
        $("#mz_Float").css("top", "232px");
        $("#mz_Float").find(".bRadius2").html("长度为4-32个字符支持数字、字母、下划线，字母开头，字母或数字结尾");
    });
    $(".email").focus(function () {
        $(".email").parent().removeClass("errorC");
        $(".email").parent().removeClass("checkedN");
        $(".error2").hide();
        if ($(".error1").css("display") == "block" && $(".error3").css("display") == "block") {
            $("#mz_Float").css("top", "436px");
        }
        else if ($(".error1").css("display") == "block" || $(".error3").css("display") == "block") {
            $("#mz_Float").css("top", "406px");
        }
        else {
            $("#mz_Float").css("top", "376px");
        }
        $("#mz_Float").find(".bRadius2").html("用于找回密码，提高账户安全等级");
    });
    $(".passwordN,.password1N").focus(function () {
        $(".passwordN").parent().removeClass("errorC");
        $(this).parent().removeClass("checkedN");
        $(".error3").hide();
        if ($(".error1").css("display") == "block") {
            $("#mz_Float").css("top", "334px");
        }
        else {
            $("#mz_Float").css("top", "304px");
        }
        $("#mz_Float").find(".bRadius2").html("长度为8-16个字符，区分大小写，至少包含两种类型");
    });
    $(".username").blur(function () {
        reg = /^[a-zA-Z][0-9a-zA-Z_]{2,30}[0-9a-zA-Z]$/;
        if ($(".username").val() == "") {
            $(".username").parent().addClass("errorC");
            $(".error1").html("请输入账户名");
            $(".error1").css("display", "block");
        }
        else if ($(".username").val().length > 32 || $(".username").val().length < 4) {
            $(".username").parent().addClass("errorC");
            $(".error1").html("账户名长度有误！");
            $(".error1").css("display", "block");
        }
        else if (!reg.test($(".username").val())) {
            $(".username").parent().addClass("errorC");
            $(".error1").html("账户名格式有误!!");
            $(".error1").css("display", "block");
        }
        else {
            $(".username").parent().addClass("checkedN");
        }
    });
    $(".passwordN,.password1N").blur(function () {
        reg1 = /^.*[\d]+.*$/;
        reg2 = /^.*[A-Za-z]+.*$/;
        reg3 = /^.*[_@#%&^+-/*\/\\]+.*$/;
        if ($(".pwdBtnShow").attr("isshow") == "false") {
            var Pval = $(".passwordN").val();
        }
        else {
            var Pval = $(".password1N").val();
        }
        if (Pval == "") {
            $(".passwordN").parent().addClass("errorC");
            $(".error3").html("请填写密码");
            $(".error3").css("display", "block");
        }
        else if (Pval.length > 16 || Pval.length < 8) {
            $(".passwordN").parent().addClass("errorC");
            $(".error3").html("密码应为8-16个字符，区分大小写");
            $(".error3").css("display", "block");
        }
        else if (!((reg1.test(Pval) && reg2.test(Pval)) || (reg1.test(Pval) && reg3.test(Pval)) || (reg2.test(Pval) && reg3.test(Pval)))) {
            $(".passwordN").parent().addClass("errorC");
            $(".error3").html("需至少包含数字、字母和符号中的两种类型");
            $(".error3").css("display", "block");
        }
        else {
            $(".passwordN").parent().addClass("checkedN");
        }
    });
    $(".email").keyup(function () {
        var emailVal = $(".email").val();
        emailValN = emailVal.replace(/\s/g, '');
        emailValN = emailValN.replace(/[\u4e00-\u9fa5]/g, '');
        if (emailValN != emailVal) {
            $(".email").val(emailValN);
        }
        var mailVal = emailValN.split("@");
        var mailHtml = mailVal[0];
        if (mailHtml.length > 15) {
            mailHtml = mailHtml.slice(0, 15) + "...";
        }
        for (var i = 1; i < 6; i++) {
            var M = $(".item" + i).attr("data-mail");
            $(".item" + i).html(mailHtml + M);
        }
    });
    $(".item").click(function () {
        var a = $(".email").val();
        var b = $(this).attr("data-mail");
        $(".email").val(a + b);
        $(".email").trigger("focus");
    });
    $(".email").click(function () {
        if ($(".error1").css("display") == "block" && $(".error3").css("display") == "block") {
            $(".mail").css("top", "489px");
        }
        else if ($(".error1").css("display") == "block" || $(".error3").css("display") == "block") {
            $(".mail").css("top", "459px");
        }
        else {
            $(".mail").css("top", "429px");
        }
        $(".mail").show();
        return false;
    });
    $(document).click(function () {
        $(".mail").hide();
    });
    $(".email").blur(function () {
        reg = /^\w+[@]\w+((.com)|(.net)|(.cn)|(.org)|(.gmail))$$/;
        if ($(".email").val() == "") {
            $(".email").parent().addClass("errorC");
            $(".error2").html("邮箱不能为空!");
            $(".error2").css("display", "block");
        }
        else if (!reg.test($(".email").val())) {
            $(".email").parent().addClass("errorC");
            $(".error2").html("邮箱格式错误！");
            $(".error2").css("display", "block");
        }
        else {
            $(".email").parent().addClass("checkedN");
        }
    });
});
