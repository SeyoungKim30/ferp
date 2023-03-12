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

<title>품질관리점검표</title>

<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<link rel="stylesheet" href="${path}/resource/css/basicStyle.css" />
<link rel="stylesheet" href="${path}/resource/css/displayingSY.css" />
<style>
  	.addBtn{
		color: #fff;
		background-color: #007bff;
		width:110px;
		height:39px;
		border-radius:10px;
		font-size: 19px;
		text-align: center;/*가로정렬*/
    	line-height: 39px;/*세로정렬*/
		margin: 20px 0;
	}
	.addBtn:hover {
		background-color: #0069d9;
		cursor:pointer;
	}
	.addBtn.focus, .addBtn:focus {
		box-shadow: 0 0 0 .2rem rgba(0, 123, 255, .5)
	}
	
	
	h1#h1ck{
	    text-align: center;
    	margin-bottom: 30px;
	}
	
	/* 버튼 */
	.btn-danger{
		padding: 10px;
		padding: 4px 10px;
    	border-radius: 5px;		
	}
	.btn-secondary{
		padding: 10px;
		padding: 4px 17px;
    	border-radius: 5px;		
	}
	

	table td{
		vertical-align: middle;
	}
	.ctrdata{
		text-align: center;
	}
	
	
	/* 모달 창 */
	.modal {
	  position:absolute;
	  max-width: 1200px;
	  min-width: 1000px;
	  width:100%; 
	  height:100%; 
	  top: 40%;
	  background:rgba(0,0,0,0.8);
	  z-index:100;
	  padding: 120px 110px 300px;
	  margin: auto 0;
	}
	.modal_content{
	  position:relative; 
	  background:#fff; 
	  min-width: 800px;
	  width: 100%;
   	  height: 60%;
	  border-radius:20px;
	  padding: 40px;
	}
	.modal_body{
		display:flex;
		justify-content: space-between;
    	line-height: 100px;
    	width: 100%;
	}
	input#qaItem{
		width: 100%;
    	height: 50px;
	}
	form#addForm {
   	 	width: 80%;
	}
	
	


	

</style>

</head>

<body class="container">
	<%@ include file="/resource/templates/header.jsp"%>
	<div class="main_wrapper">
		<%@ include file="/resource/templates/sidebar.jsp"%>
		<div class="contents">
		
			<h2>품질관리점검표 관리</h2><br><hr><br>
			
			<div class="addBtn" data-toggle="modal" data-target="#addModal">			
			+ 항목추가
			</div>
			
			
			<!-- 표 시작 -->
			<h1 id="h1ck">매장위생안전점검표 전체항목</h1>
			<form  method="post" action="${path}/qaUseable.do">
				<input name="usable" type="hidden" value="">
				<input name="qaNum" type="hidden" value="">
					<table>
						<col width="20%">
						<col width="65%">
						<col width="15%">
						<thead>
							<tr><th>항목번호</th><th>항목</th><th>&nbsp;</th></tr>
						</thead>
						<tbody></tbody>
					
					</table>
			</form>
			<!-- 표 끝 -->
			
			
			<!-- 등록 폼 -->
			<div class="modal" id="addModal" role="dialog" >
				<div class="modal_content">
			      <div class="modal_header">
			        <h3 class="modal_title">항목 추가 등록</h3>
			      </div>
			      <div class="modal_body">
			        <form id="addForm" method="post">
			          <div class="form-group">
			            <input type="text" class="form_control" id="qaItem" name="qaItem" placeholder="등록하시는 항목은 비활성화는 가능하지만 삭제는 할 수 없습니다. 정확히 입력하세요."/>
			          </div>
			        </form>
				      <div class="modal-footer">
				        <button type="button" class="close" >취소</button>
				        <button type="button" class="btn-primary" onclick="add()" disabled>등록</button>
				      </div>
			      </div>
			    </div>
			</div>	
			<!-- 등록 폼 끝-->
		
		</div>
	</div>
</body>


<script>

	//사이드바에 번호 매긴 것 
	/*
	localStorage.setItem("pageIdx","7501") //id값
	localStorage.setItem("eqIdx","3")
	*/
	

	
	//표 출력
	function print(){
		let url="${path}/qaListJson.do"  //검색값 넘기기
		
		fetch(url).then(function(response){return response.json()}).then(function(json){
			
			var qalist=json.qalist;
			var trtd='';
			var tdA='';
			//var lastqanum=qalist.usable.[qalist.length-1];
			
			qalist.forEach(function(each){		
				if(each.usable=='A'){
					tdA="<td><span class='btn-danger' onclick='changeDA("+each.qaNum+")'>비활성화하기</span></td></tr>"
				}else if(each.usable=='DA'){
					tdA="<td><span class='btn-secondary' onclick='changeA("+each.qaNum+")'>활성화하기</span></td></tr>"
				}			
				trtd+="<tr><td class='ctrdata'>"+each.qaNum+"</td><td>"+each.qaItem+"</td>"+tdA				
				
			})
			$("table tbody").html(trtd);
			//console.log("마지막qanum    "+lastqanum )
			
		}).catch(function(err){console.log(err)})	
	}
	
	$(document).ready(function(){	
		//표출력
		print();
	})
	
		
	
	
	
	//활성화/비활성화
	var form = document.querySelector('form');
  	var usable = form.querySelector('[name=usable]');
  	var qanum = form.querySelector('[name=qaNum]');	
	
  	function changeDA(qaNum){	
		var cDAresult=confirm("해당 문항을 비활성화하시겠습니까?");  //DA로바뀜
		if(cDAresult==true){
			usable.value='DA';
			qanum.value=qaNum;
			form.submit();
			alert("비활성화되었습니다")
		}
	}	
	function changeA(qaNum){
		var cAresult=confirm("해당 문항을 활성화하시겠습니까?"); //A로바뀜
		if(cAresult==true){
			usable.value='A';
			qanum.value=qaNum;
			form.submit();
			alert("활성화되었습니다")
		}
	}
	/*
	//ajax로 하는 방식
	function changeDA(qaNum) {
    $.ajax({
        url: '${path}/qaUseable.do',
        type: 'post',
        data: {qaNum: qaNum, usable: 'DA'},
        success: function(response) {
            console.log(response);
            print();
        },
        error: function(error) {
            console.log(error);
        }
    });
}

function changeA(qaNum) {
    $.ajax({
        url: '${path}/qaUseable.do',
        type: 'post',
        data: {qaNum: qaNum, usable: 'A'},
        success: function(response) {
            console.log(response);
            print();
        },
        error: function(error) {
            console.log(error);
        }
    });
}
	*/

	
	
	
	//항목등록
	function add() {
		
	  var qaItem = $("#qaItem").val();
	  $.ajax({
	    type: "POST",
	    url: "${path}/qaAdd.do",
	    data: { qaItem: qaItem },
	    success: function(data) {	    		    	
    		alert("항목이 등록되었습니다");
	    	$(".modal").fadeOut();
	    },	    
	    error: function(xhr, status, error) {
	      alert("서버와의 통신에 실패했습니다.");
	    }  
	  });
	  
	}
	
	$(function() {
		
		//등록폼 열기
		$(".addBtn").click(function(){
			$(".modal").fadeIn();
		});
		//취소버튼
		$(".close").click(function(){
			$(".modal").fadeOut();
		});
		
		//등록버튼
		$(".form_control").on("input", function() {
			if (qaItem.length > 0) {
				$(".btn-primary").prop("disabled", false);
				keyup:function(){
					if(event.keyCode==13){
						if(confirm("등록하시겠습니까?\n비활성화는 가능하지만 삭제는 불가능합니다")==true){
							alert("항목이 등록되었습니다");
					    	$(".modal").fadeOut();
					   	 	print();
						}
					}
				}
		  	} else {
		    	$(".btn-primary").prop("disabled", true);
		  	}
		});
		
		
		
		
		/*
		$(".form_control").on("keyup", function(event) {//이거뭔가이상한데
		  	if (qaItem.length > 0 && event.keyCode === 13) { 
		   		alert("항목이 등록되었습니다");
		    	$(".modal").fadeOut();
		   	 	print();
		  	}
		});
		*/
		
	})

	

</script>
</html>