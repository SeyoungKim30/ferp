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
<title>주문 확인</title>

<!-- 제이쿼리 CDN -->
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${path}/resource/css/reset.css"/>
<link rel="stylesheet" href="${path}/resource/css/store_main_index.css"/>
<link rel="stylesheet" href="${path}/resource/css/basicStyle.css"/>
<style type="text/css">

.orderWrapper{
	display: flex;
    justify-content: center;
    width: 100%;
    flex-wrap: wrap;
    gap: 50px;
	padding: 30px 0;
}

.orderBox{
	width: 400px;
	height: 400px;
	background: #FFFFFF;
	border: 5px solid #2262F3;
	border-radius: 10px;
	overflow-y: scroll;
	padding-bottom: 20px;
}

.orderBox h3{
    font-size: 30px;
    text-align: center;
    line-height: 70px;
}

.btn-primary{
	display: block;
	margin: auto;
}

.container{
	padding: 30px 0;
}

.menuSetBtn {
    font-size: 2rem;
    font-family: inherit;
}

.clearBtn{
	   font-family: inherit;
}

.menuName{
	font-size: 24px;
}

.menuName{
	font-size: 24px;
}

.option{
	font-size: 24px;
	color: #999;
}

</style>
</head>

<body>
    <div class="container">
        <header>  
            <div class="logo">
                <h1><a href="${path}/storeMainMenu.do"><img src="${path}/resource/img/F.ERP.png" alt=""></a></h1>
            </div>
        </header>
		<div class="orderWrapper">
		
			<div class="orderBox">
				<h3>주문번호 1</h3>
				<ul class="orderList">
					<li class="menuName">아메리카노 x 2</li>
					<li class="option">ㄴ연하게</li>
					<li class="menuName">티라미수 x 1</li>
					<li class="option">ㄴ매장</li>
					<li class="menuName">아메리카노 x 2</li>
					<li class="option">ㄴ연하게</li>
					<li class="menuName">티라미수 x 1</li>
					<li class="option">ㄴ매장</li>
					<li class="menuName">아메리카노 x 2</li>
					<li class="option">ㄴ연하게</li>
					<li class="menuName">티라미수 x 1</li>
					<li class="option">ㄴ매장</li>
				</ul>
				<button class="btn-primary clearBtn">제조 완료</button>
			</div>
		
			<div class="orderBox">
				<h3>주문번호 1</h3>
				<ul class="orderList">
					<li class="menuName">아메리카노 x 2</li>
					<li class="option">ㄴ연하게</li>
					<li class="menuName">티라미수 x 1</li>
					<li class="option">ㄴ매장</li>
					<li class="menuName">아메리카노 x 2</li>
					<li class="option">ㄴ연하게</li>
					<li class="menuName">티라미수 x 1</li>
					<li class="option">ㄴ매장</li>
					<li class="menuName">아메리카노 x 2</li>
					<li class="option">ㄴ연하게</li>
					<li class="menuName">티라미수 x 1</li>
					<li class="option">ㄴ매장</li>
				</ul>
				<button class="btn-primary clearBtn">제조 완료</button>
			</div>
		
			<div class="orderBox">
				<h3>주문번호 1</h3>
				<ul class="orderList">
					<li class="menuName">아메리카노 x 2</li>
					<li class="option">ㄴ연하게</li>
					<li class="menuName">티라미수 x 1</li>
					<li class="option">ㄴ매장</li>
					<li class="menuName">아메리카노 x 2</li>
					<li class="option">ㄴ연하게</li>
					<li class="menuName">티라미수 x 1</li>
					<li class="option">ㄴ매장</li>
					<li class="menuName">아메리카노 x 2</li>
					<li class="option">ㄴ연하게</li>
					<li class="menuName">티라미수 x 1</li>
					<li class="option">ㄴ매장</li>
				</ul>
				<button class="btn-primary clearBtn">제조 완료</button>
			</div>
		
			<div class="orderBox">
				<h3>주문번호 1</h3>
				<ul class="orderList">
					<li class="menuName">아메리카노 x 2</li>
					<li class="option">ㄴ연하게</li>
					<li class="menuName">티라미수 x 1</li>
					<li class="option">ㄴ매장</li>
					<li class="menuName">아메리카노 x 2</li>
					<li class="option">ㄴ연하게</li>
					<li class="menuName">티라미수 x 1</li>
					<li class="option">ㄴ매장</li>
					<li class="menuName">아메리카노 x 2</li>
					<li class="option">ㄴ연하게</li>
					<li class="menuName">티라미수 x 1</li>
					<li class="option">ㄴ매장</li>
				</ul>
				<button class="btn-primary clearBtn">제조 완료</button>
			</div>
		
			<div class="orderBox">
				<h3>주문번호 1</h3>
				<ul class="orderList">
					<li class="menuName">아메리카노 x 2</li>
					<li class="option">ㄴ연하게</li>
					<li class="menuName">티라미수 x 1</li>
					<li class="option">ㄴ매장</li>
					<li class="menuName">아메리카노 x 2</li>
					<li class="option">ㄴ연하게</li>
					<li class="menuName">티라미수 x 1</li>
					<li class="option">ㄴ매장</li>
					<li class="menuName">아메리카노 x 2</li>
					<li class="option">ㄴ연하게</li>
					<li class="menuName">티라미수 x 1</li>
					<li class="option">ㄴ매장</li>
				</ul>
				<button class="btn-primary clearBtn">제조 완료</button>
			</div>
		
			<div class="orderBox">
				<h3>주문번호 1</h3>
				<ul class="orderList">
					<li class="menuName">아메리카노 x 2</li>
					<li class="option">ㄴ연하게</li>
					<li class="menuName">티라미수 x 1</li>
					<li class="option">ㄴ매장</li>
					<li class="menuName">아메리카노 x 2</li>
					<li class="option">ㄴ연하게</li>
					<li class="menuName">티라미수 x 1</li>
					<li class="option">ㄴ매장</li>
					<li class="menuName">아메리카노 x 2</li>
					<li class="option">ㄴ연하게</li>
					<li class="menuName">티라미수 x 1</li>
					<li class="option">ㄴ매장</li>
				</ul>
				<button class="btn-primary clearBtn">제조 완료</button>
			</div>

		</div>
		
		<button class="btn-primary menuSetBtn">노출 메뉴 수정</button>
	</div>
</body>
<script type="text/javascript">

</script>
</html>