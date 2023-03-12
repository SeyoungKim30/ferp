<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<script src='${path}/a00_com/dist/index.global.js'></script>
<!-- 제이쿼리 CDN -->
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="stylesheet" href="${path}/resource/css/basicStyle.css"/>
<link rel="stylesheet" href="${path}/resource/css/displayingSY.css" />
<script>
  // 위 js를 사용할 수 있게 같은 폴드에 있는 dist 폴드를
  // 복사해서 webapp/a00_com 폴드하위에 넣어주세요.
  var today = new Date().toISOString().split("T")[0];
  
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev',
        center: 'title',
        right: 'today next'//'dayGridMonth,timeGridWeek,timeGridDay'
      },
      initialDate: today,
      //navLinks: true, // can click day/week names to navigate views
      selectable: false,
      selectMirror: true,
      select: function(arg) {
        var title = prompt('일정 등록:');
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
          })
        }
        calendar.unselect()
      },
      /*
      eventClick: function(arg) {
        if (confirm('Are you sure you want to delete this event?')) {
          arg.event.remove()
        }
      },
      editable: true,*/
      dayMaxEvents: true, // allow "more" link when too many events
      events: function (info, successCallback, failureCallback){
    	  $.ajax({
    		  type:"post",
    		  url:"${path}/schdajax.do", 
    		  dataType:"json",
    		  success:function(data){
    			  console.log(data.list)
    			  successCallback(data.list)
    		  },error:function(err){
    			  console.log(err)
    		  }
    	  })
      }
    	  
    });

    calendar.render();
  });

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>
</head>
<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
		<h2>직원 스케줄 캘린더</h2><br><hr><br>
			<div class="toolbox">
			<h3>직원 스케줄 등록</h3><br>
				<form action="${path}/sinoutIns.do" id='insertForm'>
					<select name="productNum" required>
				    	<option value="">자재코드선택</option>
				    	<c:forEach var="productNum" items="${productNumCom}">
				    		<option>${productNum}</option>
				    	</c:forEach>
				    </select>
				    <input type="hidden" name="frRegiNum" value="${login.frRegiNum}" id="frRegiNum">
					<input type="number" name="applyAmount" value="${param.applyAmount}"
						class="ckValid"	id="applyAmount" placeholder="수량 입력" min="0" 
						oninput="if(this.value < 0) alert('음수는 입력할 수 없습니다.')" required>
					<button id="insBtn" class="btn-primary" type="button">등록</button>
				</form>
			</div>
  			<div id='calendar'></div>
		</div>
	</div>
</body>
</html>
