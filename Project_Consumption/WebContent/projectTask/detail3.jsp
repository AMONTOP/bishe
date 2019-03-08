<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>jQuery Gantt</title>
    <link rel="stylesheet" type="text/css" href="/Project_Consumption/example/reset.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="/Project_Consumption/example/example.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="/Project_Consumption/example/jquery.ganttView.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="/Project_Consumption/gantejs/flick/jquery-ui-1.8.2.custom.css" />
    <script type="text/javascript" src="/Project_Consumption/gantejs/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="/Project_Consumption/gantejs/jquery-ui-1.8.2.custom.min.js"></script>
    <script type="text/javascript" src="/Project_Consumption/gantejs/date.js"></script>
    <script type="text/javascript" src="/Project_Consumption/gantejs/holidays.js"></script>
    <script type="text/javascript" src="/Project_Consumption/gantejs/jquery.ganttView.js"></script>
    <script>
   var arr = [];
   </script>
    <c:forEach items="${list}" var="projectTask">
    	<script>
    	var taskId = "${projectTask.taskId}";
    	var proId = "${projectTask.project.proId}";
    	var taskName = "${projectTask.taskName}";
    	var chargeId = "${projectTask.chargeId}";
    	var chargeName = "${projectTask.chargeName}";
    	var text = "${projectTask.text}";
    	var startDate = "${projectTask.startDate}";
    	var endDate = "${projectTask.endDate}";
    	
    	var obj = {
    		id : taskId,
    		proId : proId,
    		name : taskName,
    		chargeId : chargeId,
    		chargeName : chargeName,
    		text : text,
    		start : startDate,
    		end : endDate
    	};
    	arr.push(obj);
    	</script>
    </c:forEach>
    <script>
    		var jsonlist = JSON.stringify(arr);
    		var jj = JSON.parse(jsonlist);
    		console.log(jj);
    </script>
    <script type="text/javascript">
        $(function () {
           var ganttData = [
                {id: 1, name: "备料", series: [
                        {id: 1, name: "担当者1", text: "准备好物料1", start: new Date(2018,00,02), end: new Date(2018,00,05), readOnly: true},
                        {id: 2, name: "担当者2", text: "准备好物料2", start: new Date(2018,01,02), end: new Date(2018,04,05)}
                    ]},
                {id: 2, name: "任务2", series: [{id: 3, name: "担当者2", text: "Test2", start: new Date(2018,00,05), end: new Date(2018,00,08)}]},
                {id: 3, name: "任务3", series: [{id: 4, name: "担当者3", start: new Date(2018,00,09), end: new Date(2018,00,12)}]},
                {id: 4, name: "任务4", series: [{id: 5, name: "担当者4", start: new Date(2018,00,02), end: new Date(2018,00,08), readOnly: true}]},
                {id: 5, name: "任务5", series: [{id: 6, name: "担当者5", start: new Date(2018,00,08), end: new Date(2018,00,15)}]}
        ]; 

            var selectedObj = null;

            $("#ganttChart").ganttView({
                showWeekends: true,
                
                data: ganttData,
                cellWidth: 21,
                start: new Date(2018,00,01),
                end: new Date(2018,11,15),
                slideWidth: 1200,
                excludeWeekends: true,
                showDayOfWeek: true,
                showHolidays: true,
                excludeHolidays: true,
                clicked: function (o) {
                    selectedObj = o;
                    var data = selectedObj.data('block-data');
                    var itemName = data.itemName ? data.itemName : "";
                    var seriesName = data.seriesName ? data.seriesName: "";
                    var text = data.text ? data.text : "";

                    var sYYYY = data.start.getYear();
                    sYYYY = sYYYY < 1000 ? sYYYY + 1900 : sYYYY;
                    var sMM = data.start.getMonth() + 1;
                    var sDD = data.start.getDate();

                    var eYYYY = data.end.getYear();
                    eYYYY = eYYYY < 1000 ? eYYYY + 1900 : eYYYY;
                    var eMM = data.end.getMonth() + 1;
                    var eDD = data.end.getDate();

                    $('#ganttData-item-id').val(data.itemId);
                    $('#ganttData-item-name').val(itemName);
                    $('#ganttData-series-id').val(data.seriesId);
                    $('#ganttData-series-name').val(seriesName);
                    $('#ganttData-series-start').val(sYYYY + "/" + sMM + "/" + sDD);
                    $('#ganttData-series-end').val(eYYYY + "/" + eMM + "/" + eDD);
                    $('#ganttData-series-text').val(text);

                },
                dblClicked: function (o) {
                    if (selectedObj == null) { return; }

                    if (selectedObj.data('block-data').seriesId == o.data('block-data').seriesId) {
                        $('#ganttData-reset').trigger("click");
                    }
                },
                changed: function (o) {
                    o.trigger("click");
                }
            });

            $('#ganttData-add').click(function () {
                var name = $('#ganttData-series-name').val();
                name = (name == "") ? null : name;

                var text = $('#ganttData-series-text').val();
                text = (text == "") ? null : text;

                var start = $('#ganttData-series-start').val().split("/");
                var end = $('#ganttData-series-end').val().split("/");

                var data = [{
                    id: parseInt($('#ganttData-item-id').val()),
                    name: $('#ganttData-item-name').val(),
                    series: [{
                        id: parseInt($('#ganttData-series-id').val()),
                        name: name,
                        text: text,
                        start: new Date(start[0], parseInt(start[1]) - 1, start[2]),
                        end: new Date(end[0], parseInt(end[1]) - 1, end[2]),
                    }]
                }];

                $().ganttView.addData(data);

            });

            $('#ganttData-refresh').click(function () {
                if (selectedObj == null) { return; }

                var data = selectedObj.data('block-data');
                data.itemName = $('#ganttData-item-name').val();
                data.seriesName = $('#ganttData-series-name').val();

                var start = $("#ganttData-series-start").val().split("/");
                data.start = new Date(start[0], parseInt(start[1]) - 1, start[2]);

                var end = $("#ganttData-series-end").val().split("/");
                data.end = new Date(end[0], parseInt(end[1]) - 1, end[2]);

                data.text = $('#ganttData-series-text').val();

                selectedObj.refreshGanttData();
            });

            $('#ganttData-delete').click(function () {
                if (selectedObj == null) { return; }

                selectedObj.deleteGanttData(selectedObj);
                $('#ganttData-reset').trigger("click");
            });

            $('#ganttData-reset').click(function () {
                selectedObj = null;
                $('.ganttData-input input').val("");
            });
        });
    </script>
</head>
<body>
<div id="ganttChart"></div>
<br />
<div id="ganttData">
    <div class="ganttData-item">
        <div class="ganttData-header">任务编号</div>
        <div class="ganttData-input"><input type="text" id="ganttData-item-id" /></div>
    </div>
    <div class="ganttData-item">
        <div class="ganttData-header">任务名称</div>
        <div class="ganttData-input"><input type="text" id="ganttData-item-name" /></div>
    </div>
    <div class="ganttData-item">
        <div class="ganttData-header">负责人id</div>
        <div class="ganttData-input"><input type="text" id="ganttData-series-id" /></div>
    </div>
    <div class="ganttData-item">
        <div class="ganttData-header">负责人</div>
        <div class="ganttData-input"><input type="text" id="ganttData-series-name" /></div>
    </div>
    <div class="ganttData-item">
        <div class="ganttData-header">开始时间</div>
        <div class="ganttData-input"><input type="text" id="ganttData-series-start" /></div>
    </div>
    <div class="ganttData-item">
        <div class="ganttData-header">结束时间</div>
        <div class="ganttData-input"><input type="text" id="ganttData-series-end" /></div>
    </div>
    <div class="ganttData-item">
        <div class="ganttData-header">任务描述</div>
        <div class="ganttData-input"><input type="text" id="ganttData-series-text" /></div>
    </div>
    <div class="ganttData-item">
        <input type="button" id="ganttData-reset" value="复位" />
        <input type="button" id="ganttData-add" value="追加" />
        <input type="button" id="ganttData-refresh" value="更新" />
        <input type="button" id="ganttData-delete" value="削除" />
    </div>
</div>
</body>
</html>

