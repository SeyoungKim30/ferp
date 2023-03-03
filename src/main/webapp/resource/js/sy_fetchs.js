/**
 * 
 */
console.log('sy_fetchs included')

var accountList=[];
var accountListfalse=[];
var accountListBoth=[];

	function fetchAccountList(queryString){
		let url="/ferp/selectAccountJson.do"+queryString;
	 	fetch(url).then(function(response){return response.json() }).then(function(json){
	 		accountList=json.accountList;
	 		accountListfalse=json.accountListfalse;
	 		accountListBoth=[...accountList,...accountListfalse]
	 		console.log('어카운트리스트'+accountList)
	 	}).catch(function(err){console.log(err)})
	}
	

	function makeAccountOption(acntList){
		let acntTitlehtmls='';
		let acntNumhtmls='';
		acntList.forEach(function(each){
			console.log('어카운트 리스트 for문')
		 	acntTitlehtmls+=`<option value='`+each.acntTitle+`' label='`+each.acntNum+`'>`
		 	acntNumhtmls+=`<option value='`+each.acntNum+`' label='`+each.acntTitle+`'>`
		 })
	 	$('#titleList').html(acntTitlehtmls)
	 	$('#numList').html(acntNumhtmls)
	}

//폼아이디랑 폼 action 바꿀거 전체, 제출할때 필요한 숨겨진 real-submit-btn있어야함
	function multipathSubmit(formId,realpath){
		let formm=document.querySelector("#"+formId)
		formm.action=realpath;
		$('#real-submit-btn').click();
	}