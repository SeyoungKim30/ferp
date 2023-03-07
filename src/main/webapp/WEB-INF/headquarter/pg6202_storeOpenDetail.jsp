<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>오픈시간 상세 점검</title>

<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src='${path}/a00_com/dist/index.global.js'></script> <!-- 캘린더 -->
<script>
  
  var today = new Date().toISOString().split("T")[0];
  
  //캘린더
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev',
        center: 'title',
        right: 'today next'
      },
      initialDate: today,
      navLinks: true, // can click day/week names to navigate views
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
      eventClick: function(arg) {
        if (confirm('Are you sure you want to delete this event?')) {
          arg.event.remove()
        }
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      //여기에다가 데이터 넣기
      events: function (info, successCallback, failureCallback){
    	  $.ajax({
    		  type:"post",
    		  url:"${path}/openTimeCalendarJson.do", 
    		  dataType:"json",
    		  success:function(data){
    			  console.log(data.calendarlist)
    			  successCallback(data.calendarlist)
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

  /* 캘린더 */
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
  	h2{
  		font-size:24px;
  	}
  	h1{
  		font-size:32px;
  	}
    /*다른 화면*/
  	#backBtn{
		color: #fff;
		background-color: #007bff;
		width:140px;
		height:33px;
		border-radius:50px;
		font-size: 16px;
		text-align: center;/*가로정렬*/
    	line-height: 33px;/*세로정렬*/
	}
	#backBtn:hover {
		background-color: #0069d9;
		cursor:pointer;
	}
	#backBtn.focus, #backBtn:focus {
		box-shadow: 0 0 0 .2rem rgba(0, 123, 255, .5)
	}
	
	.storePrint{
		margin:30px 0px 40px 5px;
	}
	.storePrint>div{
	    margin: 10px 3px;
	    font-size: 18px;
	    font-weight: 500;
	    display:flex;
	    gap: 10px;
	}.storePrint>h1{
		margin-bottom:15px;
	}
	span.strifo_header {
    	font-weight: 600;
    	width:87px;
	}	
	span.strifo_rslt{
		width: 250px;
	}

</style>

<link rel="stylesheet" href="${path}/resource/css/basicStyle.css" />
<link rel="stylesheet" href="${path}/resource/css/displayingSY.css" />

</head>

<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
			
			<h2>오픈시간 상세 점검</h2><br><hr><br>
			
			<!-- 이전페이지가기 버튼-->
			<div onclick="back()" id="backBtn">
			 &lt; 전체조회페이지
			</div>
			
			<!-- 매장정보간단출력 시작 -->
			<div class="storePrint">
				<h1>${otdetail.frName }</h1>
				<div><span class="strifo_header">운영시간</span><span class="strifo_rslt">${otdetail.frOperTime }</span></div>
				<div><span class="strifo_header">점주</span><span class="strifo_rslt">${otdetail.frRepName }</span>&nbsp;<span class="strifo_header">담당직원</span><span>${otdetail.ename }</span></div>
			</div>
			<!-- 매장정보간단출력 끝-->
			
			<!-- 캘린더 시작 -->
			<div id='calendar'></div>
			<!-- 캘린더 끝 -->
		
		</div>
	</div>
</body>
<script type="text/javascript">
	
	// 정해진 오픈시간 지나면 칸 색칠	
	
	
	//이전페이지 가기 클릭
	function back(){
		history.back();
	}
	
	
</script>
</html>