<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기</title>

<!-- 제이쿼리 CDN -->
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${path}/resource/css/reset.css"/>
<link rel="stylesheet" href="${path}/resource/css/store_main_index.css"/>
<style type="text/css">
.wrap_container{
			max-width: 1200px;
			width: 100%;
			margin: 0 auto;
		}
		.con_wrap{
			display: flex;
		}
		.large_con{
			width: 66.6666%;
			padding: 0 15px;
		}
		.small_con{
			width: 33.3333%;
			padding: 0 15px;
		}
		.half_con{
			width: 50%;
			padding: 0 15px;
		}
		.tab_wrap{
			display: flex;
			gap: 20px;
			background-color: #2262f3;
			padding-top: 20px;
			padding: 20px 20px 0;
		}
		.tab_wrap > .tab_list{
			width: 140px;
			height: 70px;
			display: flex;
			align-items: center;
			justify-content: center;
			border-radius: 10px 10px 0 0;
			background-color: #fff;
			font-size: 32px;
			border-bottom: 2px solid #2262f3;
		}
		.tab_wrap > .tab_list.on{
			border-bottom: 2px solid transparent;
		}
		.tab_content_wrap{
			display: none;
			gap: 30px;
			flex-wrap: wrap;
			margin-top: 20px;
		}
		.tab_content_wrap.on{
			display: flex;
		}
		.tab_content_wrap .tab_con{
			width: calc(33.3333% - 20px);
			padding: 20px;
			background-color: #f8f8f8;
			border-radius: 10px;
			box-shadow: 0 0 15px 4px rgba(0,0,0,0.1);
		}
		.tab_content_wrap .tab_con .con_img{
			width: 100%;
			height: 200px;
			background-color: #e0e0e0;
			margin-bottom: 20px;
		}
		.tab_content_wrap .tab_con .con_info{
			text-align: center;
		}
		.tab_content_wrap .tab_con .con_info .con_name{
			font-size: 20px;
			margin-bottom: 10px;
		}
		.tab_content_wrap .tab_con .con_info .con_price{
			font-size: 20px;
			font-weight: 700;
		}
		.result_btn_wrap{
			display: flex;
			gap: 20px;
			align-items: center;
			margin-top: 20px;
		}
		.result_btn_wrap .result_btn{
			width: 50%;
			height: 70px;
			background-color: #2262f3;
			display: flex;
			align-items: center;
			justify-content: center;
			font-size: 32px;
			font-weight: 700;
			color: #fff;
			border: 0;
			border-radius: 10px;
			cursor: pointer;
			transition: 0.3s;
			font-family: 'Pretendard-Regular';
		}
		.result_btn_wrap .result_btn:hover{
			background-color: #0a38a3;
		}
		.result_list_wrap{
			width: 100%;
			margin-top: 30px;
			background-color: #e0e0e0;
			border-radius: 10px;
			padding: 10px;
		}
		.result_list_wrap li.list_item{
			padding: 15px 0;
			border-bottom: 1px solid #fff;
		}
		.result_list_wrap li.list_item:last-child{
			border-bottom: 0;
		}
		.result_list_wrap li.list_item .list_item_info{
			display: flex;
			flex-direction: column;
			gap: 10px;
			font-size: 20px;
		}
		.result_list_wrap li.list_item .list_item_info .list_item_name{
			font-size: 24px;
			font-weight: 700;
		}
		.result_list_wrap li.list_item .list_item_info .list_item_option{
			padding-left: 20px;
			font-weight: 400;
			color: #666;
		}
		.result_list_wrap li.list_item .list_item_price{
			text-align: right;
			font-size: 24px;
			font-weight: 700;
			margin-top: 15px;
		}
		.dimmed{
			position: fixed;
			width: 100vw;
			height: 100vh;
			top: 0;
			left: 0;
			background-color: rgba(0,0,0,0.5);
			z-index: -1;
			opacity: 0;
			pointer-events: none;
		}
		.dimmed.on{
			z-index: 99;
			opacity: 1;
			pointer-events: all;
		}
		.modal_container{
			max-width: 900px;
			width: 100%;
			background-color: #fff;
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			padding: 50px;
			z-index: -1;
			opacity: 0;
			pointer-events: none;
		}
		.modal_container.on{
			z-index: 100;
			opacity: 1;
			pointer-events: all;
		}
		.modal_container .modal_close{
			position: absolute;
			top: 10px;
			right: 10px;
			width: 40px;
			height: 40px;
			display: flex;
			align-items: center;
			justify-content: center;
			color: #2262f3;
			font-size: 24px;
			font-weight: 700;
			border: 1px solid #2262f3;
			border-radius: 10px;
		}
		.modal_product_con .product_img{
			width: 100%;
			height: auto;
			aspect-ratio: 1 / 1;
			overflow: hidden;
			background-color: #f5f5f5;
			margin-bottom: 30px;
		}
		.modal_product_con .product_img > img{
			width: 100%;
			height: 100%;
			object-fit: cover;
		}
		.modal_product_con .product_num_wrap{
			display: flex;
			align-items: center;
			gap: 10px;
			flex-wrap: nowrap;
		}
		.modal_product_con .product_num_wrap .product_btn{
			width: 50px;
			height: 50px;
			border-radius: 10px;
			background-color: #2262f3;
			flex-shrink: 0;
			display: flex;
			align-items: center;
			justify-content: center;
			line-height: 1;
			color: #fff;
			text-align: center;
			font-size: 24px;
			font-weight: 700;
		}
		.modal_product_con .product_num_wrap .product_number{
			width: 100%;
			height: 50px;
			border: 2px solid #2262f3;
			border-radius: 10px;
			font-size: 24px;
			text-align: center;
		}
		.modal_product_con .product_num_wrap .product_number::-webkit-outer-spin-button,
		.modal_product_con .product_num_wrap .product_number::-webkit-inner-spin-button{
			display: none;
		}
		.modal_container .modal_product_name{
			font-size: 32px;
			font-weight: 700;
			padding-bottom: 10px;
			margin-bottom: 15px;
			border-bottom: 1px solid #999;
		}
		.modal_product_option_wrap{
			display: flex;
			flex-direction: column;
			justify-content: space-between;
			height: 100%;
		}
		.modal_product_option_wrap .modal_btn_wrap{
			text-align: center;
		}
		.modal_product_option_wrap .modal_btn_wrap .modal_btn_add{
			display: flex;
			align-items: center;
			justify-content: center;
			width: 200px;
			height: 50px;
			margin: 0 auto;
			border-radius: 10px;
			background-color: #2262f3;
			color: #fff;
			font-size: 24px;
			font-weight: 700;
			cursor: pointer;
		}
		.modal_product_option .option_name{
			font-size: 24px;
			font-weight: 700;
			margin-bottom: 10px;
		}
		.modal_product_option .option_radio{
			width: 100%;
			margin-bottom: 15px;
			display: flex;
		}
		.modal_product_option .option_radio > label{
			display: flex;
			align-items: center;
			gap: 10px;
			width: 100%;
		}
		.modal_product_option .option_checkbox > label{
			display: flex;
			align-items: center;
			gap: 10px;
			width: 100%;
			margin-bottom: 15px;
		}
		.modal_product_option .option_radio > label > input,
		.modal_product_option .option_checkbox > label > input{
			display: none;
		}
		.modal_product_option .option_radio > label > span.menu_opt,
		.modal_product_option .option_checkbox > label > span.menu_opt{
			font-size: 20px;
		}
		.modal_product_option .option_radio > label > span.custom_checkbox,
		.modal_product_option .option_checkbox > label > span.custom_checkbox{
			display: flex;
			align-items: center;
			justify-content: center;
			width: 25px;
			height: 25px;
			border: 1px solid #999;
			box-shadow: 0px 4px 4px 0px rgba(0,0,0,0.25);
			color: transparent;
			font-weight: 700;
			font-size: 20px;
		}
		.modal_product_option .option_radio > label > input:checked + span.custom_checkbox,
		.modal_product_option .option_checkbox > label > input:checked + span.custom_checkbox{
			background-color: #2262f3;
			color: #fff;
		}
</style>
</head>

<body>
<div class="dimmed"></div>
	<div class="modal_container">
		<a href="#" class="modal_close"><i class="ri-close-line"></i></a>
		<div class="con_wrap">
			<div class="half_con">
				<div class="modal_product_con">
					<div class="product_img"></div>
					<div class="product_num_wrap">
						<a class="product_btn btn_minus" href="#">-</a>
						<input type="number" class="product_number" value="1" min="1">
						<a class="product_btn btn_plus" href="#">+</a>
					</div>
				</div>
			</div>
			<div class="half_con">
				<div class="modal_product_option_wrap">
					<div class="modal_option_wrap">
						<p class="modal_product_name">스패니쉬 연유 라떼</p>
						<form class="modal_product_option">
							<p class="option_name">커피 메뉴</p>
							<div class="option_radio">
								<label for="menu_opt_1">
									<input type="radio" name="option_1" id="menu_opt_1" value="option_ice">
									<span class="custom_checkbox"><i class="ri-check-line"></i></span>
									<span class="menu_opt">아이스</span>
								</label>
								<label for="menu_opt_2">
									<input type="radio" name="option_1" id="menu_opt_2" value="option_hot">
									<span class="custom_checkbox"><i class="ri-check-line"></i></span>
									<span class="menu_opt">따뜻하게</span>
								</label>
							</div>
							<div class="option_checkbox">
								<label for="menu_opt_3">
									<input type="checkbox" name="option_2" id="menu_opt_3">
									<span class="custom_checkbox"><i class="ri-check-line"></i></span>
									<span class="menu_opt">샷추가(+500￦)</span>
								</label>
								<label for="menu_opt_4">
									<input type="checkbox" name="option_3" id="menu_opt_4">
									<span class="custom_checkbox"><i class="ri-check-line"></i></span>
									<span class="menu_opt">사이즈업(+500￦)</span>
								</label>
								<label for="menu_opt_5">
									<input type="checkbox" name="option_4" id="menu_opt_5">
									<span class="custom_checkbox"><i class="ri-check-line"></i></span>
									<span class="menu_opt">연하게</span>
								</label>
							</div>
						</form>
					</div>
					<div class="modal_btn_wrap">
						<a href="#" class="modal_btn_add">추가하기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="wrap_container">
		<ul class="tab_wrap">
			<li name="tab_list_1" class="tab_list list_1 on">전체</li>
			<li name="tab_list_2" class="tab_list list_2">커피</li>
			<li name="tab_list_3" class="tab_list list_3">스무디</li>
			<li name="tab_list_4" class="tab_list list_4">음료</li>
			<li name="tab_list_5" class="tab_list list_5">케이크</li>
			<li name="tab_list_6" class="tab_list list_6">샌드위치</li>
		</ul>
		<div class="con_wrap">
			<div class="large_con">
				<div name="tab_list_1" class="tab_content_wrap con_1 on">
					<a href="#" class="tab_con">
						<div class="con_img"></div>
						<div class="con_info">
							<p class="con_name">스페니쉬 연유 라떼 1</p>
							<p class="con_price">5,800￦</p>
						</div>
					</a>
					<a href="#" class="tab_con">
						<div class="con_img"></div>
						<div class="con_info">
							<p class="con_name">스페니쉬 연유 라떼 2</p>
							<p class="con_price">5,800￦</p>
						</div>
					</a>
					<a href="#" class="tab_con">
						<div class="con_img"></div>
						<div class="con_info">
							<p class="con_name">스페니쉬 연유 라떼 3</p>
							<p class="con_price">5,800￦</p>
						</div>
					</a>
					<a href="#" class="tab_con">
						<div class="con_img"></div>
						<div class="con_info">
							<p class="con_name">스페니쉬 연유 라떼 4</p>
							<p class="con_price">5,800￦</p>
						</div>
					</a>
				</div>
				<div name="tab_list_2" class="tab_content_wrap con_2">
					<a href="#" class="tab_con">
						<div class="con_img"></div>
						<div class="con_info">
							<p class="con_name">아메리카노 1</p>
							<p class="con_price">5,800￦</p>
						</div>
					</a>
				</div>
				<div name="tab_list_3" class="tab_content_wrap con_3">
					<a href="#" class="tab_con">
						<div class="con_img"></div>
						<div class="con_info">
							<p class="con_name">카페라떼 1</p>
							<p class="con_price">5,800￦</p>
						</div>
					</a>
				</div>
				<div name="tab_list_4" class="tab_content_wrap con_4">
					<a href="#" class="tab_con">
						<div class="con_img"></div>
						<div class="con_info">
							<p class="con_name">복숭아 에이드 1</p>
							<p class="con_price">5,800￦</p>
						</div>
					</a>
				</div>
				<div name="tab_list_5" class="tab_content_wrap con_5">
					<a href="#" class="tab_con">
						<div class="con_img"></div>
						<div class="con_info">
							<p class="con_name">콤부차 1</p>
							<p class="con_price">5,800￦</p>
						</div>
					</a>
				</div>
				<div name="tab_list_6" class="tab_content_wrap con_6">
					<a href="#" class="tab_con">
						<div class="con_img"></div>
						<div class="con_info">
							<p class="con_name">에스프레소 1</p>
							<p class="con_price">5,800￦</p>
						</div>
					</a>
				</div>
			</div>
			<div class="small_con">
				<div class="result_btn_wrap">
					<button class="result_btn">취소하기</button>
					<button class="result_btn">주문하기</button>
				</div>
				<ul class="result_list_wrap">
					<li>주문하실 음료를 선택해주세요.</li>
					<li class="list_item">
						<p class="list_item_info">
							<span class="list_item_name">스패니쉬 연유 라떼</span>
							<span class="list_item_option">ㄴ 아이스</span>
							<span class="list_item_option">ㄴ 사이즈업</span>
						</p>
						<p class="list_item_price">6,300￦</p>
					</li>
					<li class="list_item">
						<p class="list_item_info">
							<span class="list_item_name">스패니쉬 연유 라떼</span>
							<span class="list_item_option">ㄴ 아이스</span>
							<span class="list_item_option">ㄴ 사이즈업</span>
						</p>
						<p class="list_item_price">6,300￦</p>
					</li>
					<li class="list_item">
						<p class="list_item_info">
							<span class="list_item_name">스패니쉬 연유 라떼</span>
							<span class="list_item_option">ㄴ 아이스</span>
							<span class="list_item_option">ㄴ 사이즈업</span>
						</p>
						<p class="list_item_price">6,300￦</p>
					</li>
				</ul>
			</div>
		</div>
	</div>	
</body>
<script type="text/javascript">
'use strict';
// modal
var tabContent = $('.tab_con'),
	dimmed = $('.dimmed'),
	modalContainer = $('.modal_container'),
	modalClose = $('.modal_close');
var conName = $('.con_info > .con_name'),
	modalName = $('.modal_product_name')
tabContent.on('click', ()=>{
	dimmed.addClass('on');
	modalContainer.addClass('on');
});
dimmed.on('click', ()=>{
	dimmed.removeClass('on');
	modalContainer.removeClass('on');
});
modalClose.on('click', ()=>{
	dimmed.removeClass('on');
	modalContainer.removeClass('on');
});
// tab

var tabList = $('.tab_wrap > .tab_list');
var tabCon = $('.tab_content_wrap');
tabList.click(function(){
	var name = $(this).attr('name');
	var tabCon = $('.tab_content_wrap');
	var thisCon = $('.tab_content_wrap[name='+ name +']');
	tabList.removeClass('on');
	$(this).addClass('on');
	tabCon.removeClass('on');
	thisCon.addClass('on');
});

</script>
</script>
</html>