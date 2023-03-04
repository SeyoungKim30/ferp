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
	
	//,리스트, 밸류, 레이블, 출력할 타켓 넣어서 데이터리스트 들어갈 옵션 만들기
	function makeAccountOption(jsonlist,valueName,labelName,target){
		let htmls='';
		jsonlist.forEach(function(each){
		 	htmls+=`<option value='`+each[valueName]+`' label='`+each[labelName]+`'>`
		 })
	 	$(target).html(htmls)
	}
	
