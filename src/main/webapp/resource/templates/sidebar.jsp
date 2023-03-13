<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>    
<style type="text/css">
	
	.lnb>ul>li>a:after{
	width: 18px;
	height: 16px;
	background: url(${path}/resource/img/menu_icon_down.png);
	position: absolute;
	top: 11px;
	right: 14px;
	content: "";
	}
	
	.lnb>ul>li.active>a:after{
	    background: url(${path}/resource/img/menu_icon_up.png);
	  }
	    
	.lnb ul li a.pagetitleActive{
		color: #007bff;
	}
	
	
</style>
 <div class="lnb">
                <ul>
<c:if test="${login.frRegiNum != 9999999999 }">
                    <li id="3000">
                        <a href="#">직원 관리</a>
                        <ul>
	                        <li id="3100" onclick="location.href='${path }/storeClerkList.do'"><a>- 직원 정보 조회</a></li>
                            <li><a>- 근태 조회</a></li>
                            <li><a>- 스케쥴 관리</a></li>
                            <li id="3300" onclick="location.href='${path }/clerkPayList.do'"><a>- 급여액 조회</a></li>
                        </ul>
                    </li>
</c:if>
                    <li id="7000">
                        <a href="#">재무 관리</a>
                        <ul>
                            <li id="7201" onclick="location.href='${path }/selectAccount.do'"><a>- 계정 과목 관리</a></li>
                            <li id="7210" onclick="location.href='${path }/ACstatement.do'"><a>- 전표 입력</a></li>
                            <li id="7204" onclick="location.href='${path }/statementList.do'"><a>- 거래 내역 조회</a></li>
                            <li><a>- 손익 계산서 조회</a></li>
                        </ul>
                    </li>
                    <li id="9000">
                        <a href="#">물류 관리</a>
                        <ul>
                            <li id="9101" onclick="location.href='${path }/requestProd.do'"><a>- 발주 신청</a></li>
                            <li id="9201" onclick="location.href='${path }/productOrderList.do'"><a>- 발주 조회</a></li>
 <c:if test="${login.frRegiNum != 9999999999 }">                          
                            <li><a>- 배송 불량 신청</a></li>
</c:if>
<c:if test="${login.frRegiNum == 9999999999 }">
                            <li><a>- 배송 불량 신청 현황</a></li>
                            <li id="9310" onclick="location.href='${path }/prodOrderPayState.do'"><a>- 발주 결제 관리</a></li>
</c:if>
                            <li><a>- 재고 관리</a></li>
                        </ul>
                    </li>
<c:if test="${login.frRegiNum == 9999999999 }">
                    <li id="4000">
                        <a href="#">매장 관리</a>
                        <ul>
                            <li id="4001"><a href="${path}/storeInsert.do">- 매장 정보 등록</a></li>
                            <li><a>- 매장 정보 조회</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">매장 점검</a>
                        <ul>
                            <li><a>- 품질관리점검표</a></li>
                            <li><a>- 품질관리점검 결과 조회</a></li>   
                            <li><a>- 담당 매장 점검</a></li><!-- 담당자만 보이게 -->
                            <li><a>- 출근시간 점검</a></li>
                        </ul>
                    </li>
</c:if>
<c:if test="${login.frRegiNum != 9999999999 }">
                    <li id="2000">
                        <a href="#">메뉴 관리</a>
                        <ul>
                            <li id="2001" onclick="location.href='${path }/showMenu.do'"><a>- 판매 메뉴 등록</a></li>
                            <li id="2002" onclick="location.href='${path }/onsaleList.do'"><a>- 판매 메뉴 삭제</a></li>
                        </ul>
                    </li>
</c:if>
                     <li id="5000">
                        <a href="#">공지 및 문의</a>
                        <ul>
<c:if test="${login.frRegiNum == 9999999999 }">                        
    						<li id="5002"><a href="${path}/noticeInsert.do">- 공지사항 등록</a></li>
</c:if>
                            <li id="5001"><a href="${path}/noticeList.do">- 공지사항 조회</a></li>
<c:if test="${login.frRegiNum == 9999999999 }">      
                            <li id="5101"><a href="${path}/qnaInsert.do">- 문의글 등록</a></li>
</c:if>
                            <li id="5103"><a href="${path}/qnaList.do">- 문의글 조회</a></li>
                            <li id="5201"><a href="${path}/chatting.do">- 1:1 채팅</a></li>
                        </ul>
                    </li>
<c:if test="${login.frRegiNum == 9999999999 }">                   
                     <li id="4300">
                        <a href="#">메뉴 등록</a>
                        <ul>
                            <li id="4302"><a href="${path}/menuInsert.do">- 메뉴 등록</a></li>
                            <li id="4301"><a href="${path}/menuList.do">- 메뉴 조회</a></li>
                        </ul>
                    </li>
                     <li id="4100">
                        <a href="#">본사 직원 관리</a>
                        <ul>
                            <li id="4101"><a href="${path}/insertEmp.do">- 아이디 발급</a></li>
                            <li id="4104"><a href="${path}/updateEmpPass.do">- 비밀번호변경</a></li>
                   		</ul>
                    </li>
</c:if>
              
                </ul>
            </div>
<script type="text/javascript">
$( document ).ready( function() {
$('.lnb > ul > li').click(function() {
    if ( $(this).hasClass('active') ) {
        $(this).find('> ul').stop().slideUp(300);
        $(this).removeClass('active');
    }
    else {
        $(this).find('> ul').stop().slideDown(300);
        $(this).addClass('active');
    }
    
});

let pageIdx = localStorage.getItem("pageIdx")
$.each($('.lnb ul li ul li'),function(){
	if($(this).attr('id')==pageIdx){
		$(this).find('a').addClass('pagetitleActive');
	}	
})

<!-- eq(n) 열려 있는 사이드바 n 숫자로 조정하세요.  -->
//$('.lnb > ul > li').eq(localStorage.getItem("eqIdx")).trigger("click");

$.each($('.lnb > ul > li'),function(){
	if($(this).attr('id')==localStorage.getItem("eqIdx")){
		$(this).trigger('click');
	}
})


})
</script>         
